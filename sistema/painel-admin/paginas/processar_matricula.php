<?php
require_once('../../conexao.php');
require_once('../verificar.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $aluno_id = $_POST['aluno'];
    $curso_id = $_POST['curso'];
    $data = date('Y-m-d');
    $status = 'Matriculado';
    $aulas_concluidas = 1;
    $mensagem = '';
    $cor_mensagem = '';

    // Verificar se o aluno já está matriculado no curso
    $sql_verificar = "SELECT COUNT(*) FROM matriculas WHERE aluno = :aluno_id AND id_curso = :curso_id";
    $stmt_verificar = $pdo->prepare($sql_verificar);
    $stmt_verificar->bindParam(':aluno_id', $aluno_id, PDO::PARAM_INT);
    $stmt_verificar->bindParam(':curso_id', $curso_id, PDO::PARAM_INT);
    $stmt_verificar->execute();
    $ja_matriculado = $stmt_verificar->fetchColumn();

    if ($ja_matriculado) {
        $mensagem = "Este aluno já está matriculado neste curso.";
    } else {
        // Inserir matrícula no banco de dados
        $sql = "INSERT INTO matriculas (aluno, id_curso, data, status, aulas_concluidas ) VALUES (:aluno_id, :curso_id, :data, :status, :aulas_concluidas)";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':aluno_id', $aluno_id, PDO::PARAM_INT);
        $stmt->bindParam(':curso_id', $curso_id, PDO::PARAM_INT);
        $stmt->bindParam(':data', $data, PDO::PARAM_STR);
        $stmt->bindParam(':status', $status, PDO::PARAM_STR);
        $stmt->bindParam(':aulas_concluidas', $aulas_concluidas, PDO::PARAM_STR);

        if ($stmt->execute()) {
            $mensagem = "Matriculado com sucesso!";
        } else {
            $mensagem = "Erro ao matricular. Por favor, tente novamente.";
        }
    }

    echo $mensagem; // Enviar mensagem de volta para o JavaScript
}
?>