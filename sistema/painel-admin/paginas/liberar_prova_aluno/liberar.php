<?php
require_once("../../../conexao.php");
@session_start();

if (@$_SESSION['nivel'] != 'Administrador') {
	echo 'Acesso negado';
	exit();
}

$id_aula = @$_POST['id_aula'];
$id_aluno = @$_POST['id_aluno'];

if (!$id_aula || !$id_aluno) {
	echo 'Dados incompletos';
	exit();
}

$query_aula = $pdo->query("SELECT curso, tempo_aula FROM aulas WHERE id = '$id_aula' LIMIT 1");
$res_aula = $query_aula->fetchAll(PDO::FETCH_ASSOC);
if (@count($res_aula) == 0) {
	echo 'Aula não encontrada';
	exit();
}

$id_curso = $res_aula[0]['curso'];
$tempo_aula_min = (int)$res_aula[0]['tempo_aula'];
$tempo_restante = $tempo_aula_min > 0 ? $tempo_aula_min * 60 : 0;
$timestamp_atual = time();

$query_tempo = $pdo->query("SELECT id FROM tempo_aulas WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno' LIMIT 1");
$res_tempo = $query_tempo->fetchAll(PDO::FETCH_ASSOC);

if (@count($res_tempo) > 0) {
	$id_tempo = $res_tempo[0]['id'];
	$pdo->query("UPDATE tempo_aulas SET concluido = 1, tempo_restante = 0, data_atualizacao = CURRENT_TIMESTAMP WHERE id = '$id_tempo'");
} else {
	$pdo->query("INSERT INTO tempo_aulas SET id_aula = '$id_aula', id_aluno = '$id_aluno', tempo_restante = '$tempo_restante', timestamp_inicio = '$timestamp_atual', concluido = 1, data_criacao = CURRENT_TIMESTAMP");
}

$query_total = $pdo->query("SELECT COUNT(*) as total FROM aulas WHERE curso = '$id_curso'");
$res_total = $query_total->fetchAll(PDO::FETCH_ASSOC);
$total_aulas = (int)$res_total[0]['total'];

$query_concluidas = $pdo->query("SELECT COUNT(DISTINCT ta.id_aula) as total FROM tempo_aulas ta INNER JOIN aulas a ON a.id = ta.id_aula WHERE a.curso = '$id_curso' AND ta.id_aluno = '$id_aluno' AND ta.concluido = 1");
$res_concluidas = $query_concluidas->fetchAll(PDO::FETCH_ASSOC);
$aulas_concluidas = (int)$res_concluidas[0]['total'];

$pdo->query("UPDATE matriculas SET aulas_concluidas = '$aulas_concluidas' WHERE id_curso = '$id_curso' AND aluno = '$id_aluno'");

echo 'Liberado com Sucesso';
?>
