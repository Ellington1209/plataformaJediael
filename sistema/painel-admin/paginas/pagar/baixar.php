<?php 
require_once("../../../conexao.php");
$tabela = 'pagar';

$id = $_POST['id'];

$pdo->query("UPDATE $tabela SET pago = 'Sim', data_pgto = curDate() where id = '$id'");

echo 'Baixado com Sucesso';

?>