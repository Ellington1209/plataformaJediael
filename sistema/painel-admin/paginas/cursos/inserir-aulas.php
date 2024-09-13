<?php 
require_once("../../../conexao.php");
$tabela = 'aulas';

$num_aula = $_POST['num_aula'];
$nome_aula = $_POST['nome_aula'];
$link_aula = $_POST['link_aula'];
$sessao_aula = $_POST['sessao_aula'];
$id_curso = $_POST['id'];
$id_aula = $_POST['id_aula'];
$tempo_aula = $_POST['tempo_aula'];


//buscar quantidade de aulas do curso
$query = $pdo->query("SELECT * FROM $tabela where curso = '$id_curso'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_aulas = @count($res);
if($total_aulas == 0){
	$seq_aula = 1;
}else{
	$seq_aula = $total_aulas + 1;
}


//validar num aula duplicado
$query = $pdo->query("SELECT * FROM $tabela where num_aula = '$num_aula' and sessao = '$sessao_aula' and curso = '$id_curso'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0 and $res[0]['id'] != $id_aula){
	echo 'Aula já Cadastrada, escolha outro numero para aula!';
	exit();
}

if ($id_aula == "") {
	$query = $pdo->prepare("INSERT INTO $tabela SET num_aula = :num_aula, nome = :nome, link = :link, curso = '$id_curso', sessao = '$sessao_aula', sequencia_aula = '$seq_aula', tempo_aula = :tempo_aula");
} else {
	$query = $pdo->prepare("UPDATE $tabela SET num_aula = :num_aula, nome = :nome, link = :link, tempo_aula = :tempo_aula, sessao = '$sessao_aula' WHERE id = :id_aula");
	$query->bindValue(":id_aula", $id_aula);
	// Bind value only if $id_aula is provided (i.e., not empty)
	$query->bindValue(":tempo_aula", $tempo_aula);
}

$query->bindValue(":nome", $nome_aula);
$query->bindValue(":num_aula", $num_aula);
$query->bindValue(":link", $link_aula);
$query->bindValue(":tempo_aula", $tempo_aula);
$query->execute();


echo 'Salvo com Sucesso';

 ?>