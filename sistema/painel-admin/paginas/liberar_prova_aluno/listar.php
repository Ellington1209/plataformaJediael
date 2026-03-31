<?php
require_once("../../../conexao.php");
@session_start();

if (@$_SESSION['nivel'] != 'Administrador') {
	echo 'Acesso negado';
	exit();
}

$id_aluno = @$_POST['aluno_id'];
if (!$id_aluno) {
	echo '<small class="text-muted">Selecione um aluno.</small>';
	exit();
}

$query = $pdo->query("SELECT 
	a.id as id_aula,
	a.nome as nome_aula,
	a.num_aula,
	c.nome as nome_curso,
	m.id as id_matricula,
	ta.id as id_tempo_aula,
	COALESCE(ta.concluido, 0) as concluido_tempo
	FROM matriculas m
	INNER JOIN cursos c ON c.id = m.id_curso
	INNER JOIN aulas a ON a.curso = m.id_curso
	LEFT JOIN tempo_aulas ta ON ta.id_aula = a.id AND ta.id_aluno = m.aluno
	WHERE m.aluno = '$id_aluno'
	AND (m.pacote IS NULL OR m.pacote = '' OR m.pacote = 'Não')
	AND (ta.id IS NULL OR ta.concluido = 0)
	ORDER BY c.nome ASC, a.num_aula ASC");

$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

if ($total_reg == 0) {
	echo '<small class="text-success">Esse aluno não possui aulas pendentes.</small>';
	exit();
}

echo <<<HTML
<table class="table table-hover" id="tabela_pendentes">
	<thead>
		<tr>
			<th>Curso</th>
			<th>Aula</th>
			<th class="esc">Nº Aula</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
HTML;

for ($i = 0; $i < $total_reg; $i++) {
	$id_aula = $res[$i]['id_aula'];
	$nome_aula = $res[$i]['nome_aula'];
	$num_aula = $res[$i]['num_aula'];
	$nome_curso = $res[$i]['nome_curso'];

	echo <<<HTML
	<tr>
		<td>{$nome_curso}</td>
		<td>{$nome_aula}</td>
		<td class="esc">{$num_aula}</td>
		<td>
			<button class="btn btn-primary btn-sm" onclick="liberarAula('{$id_aula}', '{$id_aluno}')">Liberar Prova</button>
		</td>
	</tr>
HTML;
}

echo <<<HTML
	</tbody>
</table>
<small><div id="mensagem_liberar" align="center"></div></small>
HTML;
?>

<script type="text/javascript">
	$(document).ready(function() {
		$('#tabela_pendentes').DataTable({
			"ordering": false,
			"stateSave": true
		});
		$('#tabela_pendentes_filter label input').focus();
	});
</script>
