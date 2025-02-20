<?php
require_once('../conexao.php');
require_once('verificar.php');
$pag = 'lista_notas_alunos';

if (@$_SESSION['nivel'] != 'Administrador' and @$_SESSION['nivel'] != 'Professor') {
    echo "<script>window.location='../index.php'</script>";
    exit();
}
?>


<!-- Importar a tabela de lista_notas_alunos de um arquivo separado -->
<div class="bs-example widget-shadow" style="padding:15px" id="listar">
    <?php include 'lista_notas_alunos/listar_notas_tabela.php'; ?>
</div>




