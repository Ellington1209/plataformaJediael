<?php 
require_once("../../../conexao.php");
@session_start();

$id_curso = @$_POST['id_curso'];
$id_aluno = @$_SESSION['id'];



if(!$id_curso || !$id_aluno) {
    echo json_encode(['erro' => 'Dados incompletos']);
    exit();
}

// Buscar todas as aulas do curso
$query_aulas = $pdo->query("SELECT id, tempo_aula FROM aulas WHERE curso = '$id_curso'");
$res_aulas = $query_aulas->fetchAll(PDO::FETCH_ASSOC);



$progresso_total = 0;
$aulas_concluidas = 0;
$total_aulas = @count($res_aulas);

foreach($res_aulas as $aula) {
    $id_aula = $aula['id'];
    $tempo_aula = (int)$aula['tempo_aula'];
    
    if($tempo_aula > 0) {
        // Buscar registro na tabela tempo_aulas
        $query_tempo = $pdo->query("SELECT tempo_restante, concluido FROM tempo_aulas 
                                   WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
        $res_tempo = $query_tempo->fetchAll(PDO::FETCH_ASSOC);
        
        if(@count($res_tempo) > 0) {
            $tempo_restante = (int)$res_tempo[0]['tempo_restante'];
            $concluido = (int)$res_tempo[0]['concluido'];
            
            if($concluido == 1) {
                $progresso_aula = 100;
                $aulas_concluidas++;
            } else {
                // tempo_aula está em MINUTOS no banco (ex: 4 = 4 minutos)
                // tempo_restante está em SEGUNDOS (vem do cronômetro)
                // Vamos calcular tudo em minutos
                
                $tempo_aula_minutos = $tempo_aula; // Já está em minutos
                $tempo_restante_minutos = $tempo_restante / 60; // Converter segundos para minutos
                
                // Se tempo_restante_minutos for maior que tempo_aula_minutos, ajustar
                if($tempo_restante_minutos > $tempo_aula_minutos) {
                    $tempo_restante_minutos = $tempo_aula_minutos;
                }
                
                // Calcular tempo assistido em minutos
                $tempo_assistido_minutos = $tempo_aula_minutos - $tempo_restante_minutos;
                
                // Garantir limites
                if($tempo_assistido_minutos < 0) $tempo_assistido_minutos = 0;
                if($tempo_assistido_minutos > $tempo_aula_minutos) $tempo_assistido_minutos = $tempo_aula_minutos;
                
                // Calcular progresso em porcentagem
                $progresso_aula = ($tempo_assistido_minutos / $tempo_aula_minutos) * 100;
                
                // Garantir que progresso está entre 0 e 100
                if($progresso_aula < 0) $progresso_aula = 0;
                if($progresso_aula > 100) $progresso_aula = 100;
            }
        } else {
            $progresso_aula = 0;
        }
        
        $progresso_total += $progresso_aula;
    }
}

// Calcular porcentagem média
$porcentagem = 0;
if($total_aulas > 0) {
    $porcentagem = $progresso_total / $total_aulas;
    if($porcentagem > 100) $porcentagem = 100;
    if($porcentagem < 0) $porcentagem = 0;
}

// Calcular tempo restante total do curso (em segundos)
$tempo_restante_total_segundos = 0;
foreach($res_aulas as $aula) {
    $id_aula = $aula['id'];
    $tempo_aula = (int)$aula['tempo_aula']; // em minutos
    
    if($tempo_aula > 0) {
        $query_tempo_total = $pdo->query("SELECT tempo_restante, concluido FROM tempo_aulas 
                                         WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
        $res_tempo_total = $query_tempo_total->fetchAll(PDO::FETCH_ASSOC);
        
        if(@count($res_tempo_total) > 0) {
            $tempo_restante_aula = (int)$res_tempo_total[0]['tempo_restante']; // em segundos
            $concluido_aula = (int)$res_tempo_total[0]['concluido'];
            
            if($concluido_aula == 0) {
                $tempo_restante_total_segundos += $tempo_restante_aula;
            }
        } else {
            // Se não tem registro, a aula não foi iniciada, então o tempo total é o tempo da aula
            $tempo_restante_total_segundos += $tempo_aula * 60; // converter minutos para segundos
        }
    }
}


// Atualizar aulas_concluidas na matrícula
$query_mat = $pdo->query("SELECT id, aulas_concluidas FROM matriculas WHERE id_curso = '$id_curso' AND aluno = '$id_aluno'");
$res_mat = $query_mat->fetchAll(PDO::FETCH_ASSOC);
if(@count($res_mat) > 0) {
    $id_matricula = $res_mat[0]['id'];
    $aulas_concluidas_atual = $res_mat[0]['aulas_concluidas'];
    
    if($aulas_concluidas != $aulas_concluidas_atual) {
        $pdo->query("UPDATE matriculas SET aulas_concluidas = '$aulas_concluidas' WHERE id = '$id_matricula'");
    }
}

echo json_encode([
    'porcentagem' => round($porcentagem, 2),
    'aulas_concluidas' => $aulas_concluidas,
    'total_aulas' => $total_aulas,
    'tempo_restante_segundos' => $tempo_restante_total_segundos
]);

?>

