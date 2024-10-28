<?php
require_once("../../../conexao.php");

header('Content-Type: application/json');

// Captura os dados enviados
$id_prova = $_POST['id_prova'];
$nome_prova = $_POST['nome_prova'];
$descricao = $_POST['descricao'];
$perguntas = $_POST['perguntas'];



try {
    $pdo->beginTransaction();

    // Atualizar a prova
    $query_prova = $pdo->prepare("UPDATE provas SET nome = :nome_prova, descricao = :descricao WHERE id = :id_prova");
    $query_prova->bindValue(":nome_prova", $nome_prova);
    $query_prova->bindValue(":descricao", $descricao);
    $query_prova->bindValue(":id_prova", $id_prova);
    $query_prova->execute();

    // Array para as letras das alternativas
    $opcoes = ['A', 'B', 'C', 'D'];

    // Atualizar perguntas e alternativas
    foreach ($perguntas as $index => $pergunta) {

        if (!isset($pergunta['id'])) {
            echo "Pergunta $index não tem ID e será ignorada.\n";
            continue; // Ignora a pergunta se não tiver ID
        }

        // Atualizar a pergunta
        $query_pergunta = $pdo->prepare("UPDATE perguntas_provas SET texto = :texto WHERE id = :pergunta_id");
        $query_pergunta->bindValue(":texto", $pergunta['texto']);
        $query_pergunta->bindValue(":pergunta_id", $pergunta['id']);
        $query_pergunta->execute();

        // Verificar se existem alternativas para a pergunta
        if (isset($pergunta['alternativas']) && is_array($pergunta['alternativas'])) {
            foreach ($pergunta['alternativas'] as $key => $alternativa) {

                // Extrair o texto da opção correspondente
                $texto_opcao = $pergunta['opcoes'][$key] ?? null;
                $correta = (isset($pergunta['correta']) && $pergunta['correta'] === $opcoes[$key]) ? 1 : 0;

                if ($texto_opcao !== null && isset($alternativa['id'])) {
                    $query_alternativa = $pdo->prepare("UPDATE alternativas_prova SET texto = :texto_opcao, correta = :correta WHERE id = :alternativa_id");
                    $query_alternativa->bindValue(":texto_opcao", $texto_opcao);
                    $query_alternativa->bindValue(":correta", $correta);
                    $query_alternativa->bindValue(":alternativa_id", $alternativa['id']);
                    $query_alternativa->execute();

                   
                } else {
                    echo "Alternativa {$opcoes[$key]} da pergunta $index não possui ID ou texto e foi ignorada.\n";
                }
            }
        } else {
            echo "A pergunta $index não possui alternativas válidas.\n";
        }
    }

    $pdo->commit();
    echo json_encode(['status' => 'success', 'message' => 'Prova atualizada com sucesso!']);
} catch (Exception $e) {
    $pdo->rollBack();
    echo json_encode(['status' => 'error', 'message' => 'Erro ao atualizar a prova: ' . $e->getMessage()]);
}
?>
