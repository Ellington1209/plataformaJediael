<?php
require_once('../../../conexao.php');

header('Content-Type: application/json');

if (!isset($_POST['id_aluno'], $_POST['id_prova']) || empty($_POST['id_aluno']) || empty($_POST['id_prova'])) {
    echo json_encode(['status' => 'error', 'message' => 'id_aluno e id_prova obrigatórios.']);
    exit();
}

$id_aluno = (int) $_POST['id_aluno'];
$id_prova = (int) $_POST['id_prova'];

try {
    $stmt = $pdo->prepare("DELETE FROM tentativas_aluno WHERE id_aluno = ? AND id_prova = ?");
    $stmt->execute([$id_aluno, $id_prova]);
    echo json_encode(['status' => 'success', 'message' => 'Tentativas zeradas.']);
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
