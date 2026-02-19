<?php 
@session_start();
if(!isset($_SESSION['nivel']) || ($_SESSION['nivel'] != 'Administrador' && $_SESSION['nivel'] != 'Professor')){
	header('Location: ../index.php');
	exit();
}
