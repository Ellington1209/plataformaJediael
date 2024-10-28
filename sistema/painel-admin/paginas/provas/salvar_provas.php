<?php
require_once("../../../conexao.php");

header('Content-Type: application/json');

// Recebe os dados do formulário
$curso_id = $_POST['curso'];
$nome_prova = $_POST['nome_prova'];
$descricao = $_POST['descricao'];
$num_perguntas = $_POST['num_perguntas'];
$perguntas = $_POST['perguntas'];

try {
    $pdo->beginTransaction();

    // Insere a prova na tabela `provas`
    $query_prova = $pdo->prepare("INSERT INTO provas (curso_id, nome, descricao, data_criacao, status) 
                                  VALUES (:curso_id, :nome_prova, :descricao, NOW(), 'ativa')");
    $query_prova->bindValue(":curso_id", $curso_id);
    $query_prova->bindValue(":nome_prova", $nome_prova);
    $query_prova->bindValue(":descricao", $descricao);
    $query_prova->execute();

    // Recupera o ID da prova recém-inserida
    $prova_id = $pdo->lastInsertId();

    // Array para mapear as letras A, B, C, D com os índices das opções
    $letras_opcoes = ['A', 'B', 'C', 'D'];

    // Insere cada pergunta na tabela `perguntas_provas`
    foreach ($perguntas as $index => $pergunta) {
        $texto_pergunta = $pergunta['texto'];
        $query_pergunta = $pdo->prepare("INSERT INTO perguntas_provas (prova_id, texto, tipo) 
                                         VALUES (:prova_id, :texto_pergunta, 'multipla_escolha')");
        $query_pergunta->bindValue(":prova_id", $prova_id);
        $query_pergunta->bindValue(":texto_pergunta", $texto_pergunta);
        $query_pergunta->execute();

        // Recupera o ID da pergunta recém-inserida
        $pergunta_id = $pdo->lastInsertId();

        // Insere as alternativas na tabela `alternativas_prova`
        foreach ($pergunta['opcoes'] as $key => $texto_opcao) {
            // Verifica se a letra da opção atual corresponde à alternativa correta
            $correta = ($pergunta['correta'] === $letras_opcoes[$key]) ? 1 : 0;
            
            $query_alternativa = $pdo->prepare("INSERT INTO alternativas_prova (pergunta_id, texto, correta) 
                                                VALUES (:pergunta_id, :texto_opcao, :correta)");
            $query_alternativa->bindValue(":pergunta_id", $pergunta_id);
            $query_alternativa->bindValue(":texto_opcao", $texto_opcao);
            $query_alternativa->bindValue(":correta", $correta);
            $query_alternativa->execute();
        }
    }

    // Confirma a transação
    $pdo->commit();
    
    echo json_encode(['status' => 'success', 'message' => 'Prova salva com sucesso!']);
} catch (Exception $e) {
    // Caso ocorra um erro, desfaz as alterações
    $pdo->rollBack();
    echo json_encode(['status' => 'error', 'message' => 'Erro ao salvar a prova: ' . $e->getMessage()]);
}
?>
