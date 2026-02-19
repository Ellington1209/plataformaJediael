<?php 
@session_start();
if(!isset($_SESSION['nivel']) || $_SESSION['nivel'] != 'Aluno'){
	header('Location: ../index.php');
	exit();
}
