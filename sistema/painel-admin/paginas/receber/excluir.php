<?php 
require_once("../../../conexao.php");
$tabela = 'receber';

$id = $_POST['id'];

$query = $pdo->query("SELECT * FROM $tabela where id = '$id'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
$foto = $res[0]['arquivo'];
if($foto != "sem-foto.png"){
	@unlink('../../img/contas/'.$foto);
}

$pdo->query("DELETE FROM $tabela where id = '$id'");

echo 'Excluído com Sucesso';

?>