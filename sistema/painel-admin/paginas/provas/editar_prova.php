<?php
require_once('../../../conexao.php');

header('Content-Type: application/json');

if (!isset($_POST['id']) || empty($_POST['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'ID da prova não fornecido.']);
    exit();
}

$prova_id = $_POST['id'];

try {
    // Buscar informações da prova
    $query_prova = $pdo->prepare("SELECT p.*, c.nome AS nome_curso 
                                  FROM provas p 
                                  LEFT JOIN cursos c ON p.curso_id = c.id 
                                  WHERE p.id = :id");
    $query_prova->bindValue(':id', $prova_id, PDO::PARAM_INT);
    $query_prova->execute();
    $prova = $query_prova->fetch(PDO::FETCH_ASSOC);

    // Verificar se a prova existe
    if (!$prova) {
        echo json_encode(['status' => 'error', 'message' => 'Prova não encontrada.']);
        exit();
    }

    // Buscar perguntas da prova
    $query_perguntas = $pdo->prepare("SELECT * FROM perguntas_provas WHERE prova_id = :prova_id");
    $query_perguntas->bindValue(':prova_id', $prova_id, PDO::PARAM_INT);
    $query_perguntas->execute();
    $perguntas = $query_perguntas->fetchAll(PDO::FETCH_ASSOC);

    // Para cada pergunta, buscar as alternativas
    foreach ($perguntas as $index => $pergunta) {
        $query_alternativas = $pdo->prepare("SELECT * FROM alternativas_prova WHERE pergunta_id = :pergunta_id");
        $query_alternativas->bindValue(':pergunta_id', $pergunta['id'], PDO::PARAM_INT);
        $query_alternativas->execute();
        $alternativas = $query_alternativas->fetchAll(PDO::FETCH_ASSOC);

        // Adicionar as alternativas à pergunta
        $perguntas[$index]['alternativas'] = $alternativas;
    }

    // Retornar os dados da prova, incluindo perguntas e alternativas
    echo json_encode([
        'status' => 'success',
        'prova' => $prova,
        'perguntas' => $perguntas
    ]);

} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'Erro ao carregar os dados da prova: ' . $e->getMessage()]);
}