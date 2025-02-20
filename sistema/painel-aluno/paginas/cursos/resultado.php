<?php
session_start();
require_once("../../../conexao.php");

// Verificar se a sessão contém o ID do aluno
if (!isset($_SESSION['id'])) {
    echo json_encode(["status" => "erro", "mensagem" => "ID do aluno não encontrado na sessão."]);
    exit();
}

$id_aluno = $_SESSION['id']; 
$id_prova = $_POST['id_prova'] ?? null;
$respostas = $_POST; 

// Remover campos desnecessários do array de respostas
unset($respostas['id_aluno'], $respostas['id_prova'], $respostas['id_curso'], $respostas['id_mat']);

// Verificar se há respostas
if (!$id_prova || empty($respostas)) {
    echo json_encode(["status" => "erro", "mensagem" => "ID da prova ou respostas não foram enviados corretamente."]);
    exit();
}

// Verificar número de tentativas
$query_tentativas = $pdo->prepare("SELECT COUNT(*) AS total_tentativas FROM tentativas_aluno WHERE id_aluno = ? AND id_prova = ?");
$query_tentativas->execute([$id_aluno, $id_prova]);
$tentativas = $query_tentativas->fetch(PDO::FETCH_ASSOC);
$total_tentativas = $tentativas['total_tentativas'] ?? 0;

// Se já fez 2 tentativas, impedir nova tentativa
if ($total_tentativas >= 2) {
    echo json_encode(["status" => "erro", "mensagem" => "Você já usou todas as suas tentativas!"]);
    exit();
}

// Iniciar cálculo da nota
$nota = 0;
$total_perguntas = count($respostas);

foreach ($respostas as $id_pergunta => $id_alternativa) {
    // Remover "pergunta_" para pegar o ID real da pergunta
    $id_pergunta = str_replace('pergunta_', '', $id_pergunta);

    // Verificar se a alternativa escolhida é correta
    $query_alt = $pdo->prepare("SELECT correta FROM alternativas_prova WHERE id = ?");
    $query_alt->execute([$id_alternativa]);
    $alt = $query_alt->fetch(PDO::FETCH_ASSOC);

    $resposta_correta = $alt['correta'] ?? 0;

    // Salvar a resposta do aluno
    $query_resposta = $pdo->prepare("INSERT INTO respostas_aluno (id_aluno, id_prova, id_pergunta, id_alternativa, resposta_correta) VALUES (?, ?, ?, ?, ?)");
    $query_resposta->execute([$id_aluno, $id_prova, $id_pergunta, $id_alternativa, $resposta_correta]);

    if ($resposta_correta) {
        $nota++;
    }
}

// Calcular a nota percentual (com duas casas decimais)
$nota_percentual = number_format(($nota / $total_perguntas) * 100, 2, '.', '');

// Salvar tentativa
$tentativa = $total_tentativas + 1;
$query_tentativa = $pdo->prepare("INSERT INTO tentativas_aluno (id_aluno, id_prova, tentativa, nota) VALUES (?, ?, ?, ?)");
$query_tentativa->execute([$id_aluno, $id_prova, $tentativa, $nota_percentual]);

// Verificar se foi aprovado
$status = $nota_percentual >= 70 ? "Aprovado" : "Reprovado";

// Retornar JSON
echo json_encode([
    "status" => $status,
    "nota" => $nota_percentual,
    "mensagem" => $status === "Aprovado"
        ? "Parabéns! Você foi aprovado com $nota_percentual%."
        : "Você foi reprovado. Sua nota foi de $nota_percentual%. Você pode refazer o questionário para tentar novamente."
]);
?>
