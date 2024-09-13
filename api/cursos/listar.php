<?php 

include_once('../conexao.php');

$postjson = json_decode(file_get_contents('php://input'), true);

$limite = (isset($_GET['limite'])) ? $_GET['limite'] : 5; 
$pagina = (isset($_GET['pagina'])) ? $_GET['pagina'] : 1; 

$inicio = ($limite * $pagina) - $limite; 

$query = $pdo->query("SELECT * FROM cursos where status = 'Aprovado' ORDER BY id DESC LIMIT $inicio, $limite");
$res = $query->fetchAll(PDO::FETCH_ASSOC);


for ($i=0; $i < count($res); $i++) { 

$nome = $res[$i]['nome'];  
$valor = $res[$i]['valor'];  
$categoria = $res[$i]['categoria'];   
$promocao = $res[$i]['promocao'];
    

    $query2 = $pdo->query("SELECT * FROM categorias where id = '$categoria'");
    $res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
    if(@count($res2) > 0){
        $nome_cat = $res2[0]['nome'];     
       
    }else{
        $nome_cat = "";
    }

    if($promocao > 0){
        $valor = $promocao;
    }

               
    //FORMATAR VALORES
    $valorF = number_format($valor, 2, ',', '.');
      

      $dados[] = array(
        'id' => $res[$i]['id'],
        'nome' => $nome,        
        'categoria' => $nome_cat,
        'valor' => $valorF,       
        'foto' => $res[$i]['imagem'],              
    );

}


if(count($res) > 0){
    $result = json_encode(array('success'=>true, 'resultado'=>@$dados, 'totalItems'=>@count($dados) + ($inicio)));
}else{
    $result = json_encode(array('success'=>false, 'resultado'=>'0'));
}

echo $result;

?>