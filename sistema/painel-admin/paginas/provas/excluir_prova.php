<?php
require_once("../../../conexao.php");

header('Content-Type: application/json');

// Verifica se o ID da prova foi enviado
if (!isset($_POST['id']) || empty($_POST['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'ID da prova não fornecido.']);
    exit();
}

$prova_id = $_POST['id'];

try {
    $pdo->beginTransaction();

    // Exclui as alternativas associadas às perguntas da prova
    $query_alternativas = $pdo->prepare("
        DELETE alternativas_prova 
        FROM alternativas_prova 
        INNER JOIN perguntas_provas ON alternativas_prova.pergunta_id = perguntas_provas.id 
        WHERE perguntas_provas.prova_id = :prova_id
    ");
    $query_alternativas->bindValue(':prova_id', $prova_id, PDO::PARAM_INT);
    $query_alternativas->execute();

    // Exclui as perguntas associadas à prova
    $query_perguntas = $pdo->prepare("DELETE FROM perguntas_provas WHERE prova_id = :prova_id");
    $query_perguntas->bindValue(':prova_id', $prova_id, PDO::PARAM_INT);
    $query_perguntas->execute();

    // Exclui a prova
    $query_prova = $pdo->prepare("DELETE FROM provas WHERE id = :prova_id");
    $query_prova->bindValue(':prova_id', $prova_id, PDO::PARAM_INT);
    $query_prova->execute();

    $pdo->commit();
    
    echo json_encode(['status' => 'success', 'message' => 'Prova excluída com sucesso!']);
} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['status' => 'error', 'message' => 'Erro ao excluir a prova: ' . $e->getMessage()]);
}
?>
