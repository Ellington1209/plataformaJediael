<?php 
require_once('../../../conexao.php');


// Consulta para obter os cursos ativos
$query = $pdo->query("SELECT id, nome FROM cursos WHERE status = 'Aprovado' ORDER BY nome ASC");

$res = $query->fetchAll(PDO::FETCH_ASSOC);

$total_cursos = @count($res);

if ($total_cursos > 0) {
    echo '<option value="">Selecione o Curso</option>';
    for ($i = 0; $i < $total_cursos; $i++) {
        $id_curso = $res[$i]['id'];
        $nome_curso = $res[$i]['nome'];
        echo "<option value='$id_curso'>$nome_curso</option>";
    }
} else {
    echo '<option value="">Nenhum curso encontrado</option>';
}
?>
