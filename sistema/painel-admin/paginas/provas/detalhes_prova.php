<?php
require_once('../../../conexao.php');

$id_prova = $_POST['id'];

// Buscar informações básicas da prova e curso
$query = $pdo->prepare("SELECT p.nome AS nome_prova, p.descricao, p.data_criacao, p.status, c.nome AS nome_curso
                        FROM provas p
                        LEFT JOIN cursos c ON p.curso_id = c.id
                        WHERE p.id = :id");
$query->bindValue(':id', $id_prova, PDO::PARAM_INT);
$query->execute();
$prova = $query->fetch(PDO::FETCH_ASSOC);

if ($prova) {
    $nome_prova = $prova['nome_prova'];
    $nome_curso = $prova['nome_curso'] ?? 'Sem curso associado';
    $descricao = $prova['descricao'];
    $data_criacao = date('d/m/Y', strtotime($prova['data_criacao']));
    $status = $prova['status'] == 'ativa' ? 'Ativa' : 'Inativa';

    echo <<<HTML
    <div class="container">
        <h4><strong>Nome da Prova:</strong> {$nome_prova}</h4>
        <p><strong>Curso:</strong> {$nome_curso}</p>
        <p><strong>Descrição:</strong> {$descricao}</p>
        <p><strong>Data de Criação:</strong> {$data_criacao}</p>
        <p><strong>Status:</strong> {$status}</p>
        <hr>
HTML;

    // Buscar perguntas e alternativas
    $queryPerguntas = $pdo->prepare("SELECT id, texto FROM perguntas_provas WHERE prova_id = :prova_id");
    $queryPerguntas->bindValue(':prova_id', $id_prova, PDO::PARAM_INT);
    $queryPerguntas->execute();
    $perguntas = $queryPerguntas->fetchAll(PDO::FETCH_ASSOC);

    foreach ($perguntas as $index => $pergunta) {
        echo "<h5><strong>Pergunta " . ($index + 1) . ":</strong> " . htmlspecialchars($pergunta['texto']) . "</h5>";
        
        $queryAlternativas = $pdo->prepare("SELECT texto, correta FROM alternativas_prova WHERE pergunta_id = :pergunta_id");
        $queryAlternativas->bindValue(':pergunta_id', $pergunta['id'], PDO::PARAM_INT);
        $queryAlternativas->execute();
        $alternativas = $queryAlternativas->fetchAll(PDO::FETCH_ASSOC);

        $letras = ['a', 'b', 'c', 'd']; // Para exibir as letras antes das opções
        echo "<ul class='list-unstyled'>";
        foreach ($alternativas as $key => $alternativa) {
            $corretaClass = $alternativa['correta'] ? 'text-success font-weight-bold' : '';
            $letra = isset($letras[$key]) ? $letras[$key] : '';
            echo "<li class='{$corretaClass}'>{$letra}) " . htmlspecialchars($alternativa['texto']) . "</li>";
        }
        echo "</ul><hr>";
    }
    echo "</div>";
} else {
    echo "<p class='text-danger'>Prova não encontrada.</p>";
}
?>
