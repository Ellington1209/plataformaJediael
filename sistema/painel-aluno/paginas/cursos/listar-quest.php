<?php
session_start();
require_once("../../../conexao.php");

// Verificar se a sessão contém o ID do usuário
if (!isset($_SESSION['id'])) {
    echo '<p style="font-weight:200; margin-left: 10px; color: red;">Erro: ID do usuário não encontrado na sessão.</p>';
    exit();
}

// Buscar o id_pessoa (ID do aluno) a partir do ID do usuário
$id_usuario = $_SESSION['id'];
$query_usuario = $pdo->prepare("SELECT id_pessoa FROM usuarios WHERE id = ?");
$query_usuario->execute([$id_usuario]);
$usuario = $query_usuario->fetch(PDO::FETCH_ASSOC);

if (!$usuario || !$usuario['id_pessoa']) {
    echo '<p style="font-weight:200; margin-left: 10px; color: red;">Erro: ID do aluno não encontrado.</p>';
    exit();
}

$id_aluno = $usuario['id_pessoa']; // ID real do aluno na tabela alunos

$id_curso = $_POST['curso'];

// Buscar a prova associada ao curso
$query_prova = $pdo->query("SELECT id FROM provas WHERE curso_id = '$id_curso'");
$prova = $query_prova->fetch(PDO::FETCH_ASSOC);

if(!$prova){
	echo '<p style="font-weight:200; margin-left: 10px; color: red;">Essa Materia ainda não possui Provas</p>';
	exit();
}
$prova_id = $prova['id'];

// Buscar perguntas associadas à prova
$query_perguntas = $pdo->query("SELECT * FROM perguntas_provas WHERE prova_id = '$prova_id'");
$perguntas = $query_perguntas->fetchAll(PDO::FETCH_ASSOC);

// Exibindo perguntas e alternativas
foreach ($perguntas as $pergunta) {
    echo '<p><b>' . $pergunta['texto'] . '</b></p>';

    // Se for múltipla escolha, buscar alternativas
    if ($pergunta['tipo'] == 'multipla_escolha') {
        $query_alternativas = $pdo->query("SELECT * FROM alternativas_prova WHERE pergunta_id = '{$pergunta['id']}'");
        $alternativas = $query_alternativas->fetchAll(PDO::FETCH_ASSOC);

        foreach ($alternativas as $alt) {
            echo '<div class="form-check">
                    <input class="form-check-input" style="font-weight:200; margin-left: 20px;" type="radio" name="pergunta_' . $pergunta['id'] . '" value="' . $alt['id'] . '">
                    <label class="form-check-label" style="font-weight:200; margin-left: 10px;">' . $alt['texto'] . '</label>
                </div>';
        }
    }
    echo '<hr>';
}
?>

<form id="form-quest" method="POST" action="resultado.php">
    <input type="hidden" name="id_aluno" value="<?php echo $id_aluno; ?>">
    <input type="hidden" name="id_prova" value="<?php echo $prova_id; ?>">
    <!-- Incluir aqui as respostas das perguntas, se necessário -->
</form>
