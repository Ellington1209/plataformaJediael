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
$timestamp_atual = time();

foreach($res_aulas as $aula) {
    $id_aula = $aula['id'];
    $tempo_aula_minutos = (int)$aula['tempo_aula'];
    $tempo_aula_segundos = $tempo_aula_minutos * 60;
    
    if($tempo_aula_minutos > 0) {
        // Buscar registro na tabela tempo_aulas usando timestamp_inicio
        $query_tempo = $pdo->query("SELECT timestamp_inicio, data_criacao, concluido FROM tempo_aulas 
                                   WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
        $res_tempo = $query_tempo->fetchAll(PDO::FETCH_ASSOC);
        
        if(@count($res_tempo) > 0) {
            $concluido = (int)$res_tempo[0]['concluido'];
            $timestamp_inicio = $res_tempo[0]['timestamp_inicio'];
            $data_criacao = $res_tempo[0]['data_criacao'];
            
            if($concluido == 1) {
                $progresso_aula = 100;
                $aulas_concluidas++;
            } else {
                if(!$timestamp_inicio || $timestamp_inicio == 0) {
                    if($data_criacao) {
                        $timestamp_inicio = strtotime($data_criacao);
                    }
                }
                
                if($timestamp_inicio && $timestamp_inicio > 0) {
                    $tempo_decorrido_segundos = $timestamp_atual - $timestamp_inicio;
                    
                    if($tempo_decorrido_segundos >= $tempo_aula_segundos) {
                        $progresso_aula = 100;
                        $aulas_concluidas++;
                        $pdo->query("UPDATE tempo_aulas SET concluido = 1 WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
                    } else if($tempo_decorrido_segundos > 0) {
                        $progresso_aula = ($tempo_decorrido_segundos / $tempo_aula_segundos) * 100;
                    } else {
                        $progresso_aula = 0;
                    }
                    
                    if($progresso_aula < 0) $progresso_aula = 0;
                    if($progresso_aula > 100) $progresso_aula = 100;
                } else {
                    $progresso_aula = 0;
                }
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

// Calcular tempo restante total do curso (em segundos) usando timestamp
$tempo_restante_total_segundos = 0;
foreach($res_aulas as $aula) {
    $id_aula = $aula['id'];
    $tempo_aula_minutos = (int)$aula['tempo_aula'];
    $tempo_aula_segundos = $tempo_aula_minutos * 60;
    
    if($tempo_aula_minutos > 0) {
        $query_tempo_total = $pdo->query("SELECT timestamp_inicio, data_criacao, concluido FROM tempo_aulas 
                                         WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
        $res_tempo_total = $query_tempo_total->fetchAll(PDO::FETCH_ASSOC);
        
        if(@count($res_tempo_total) > 0) {
            $concluido_aula = (int)$res_tempo_total[0]['concluido'];
            $timestamp_inicio = $res_tempo_total[0]['timestamp_inicio'];
            $data_criacao = $res_tempo_total[0]['data_criacao'];
            
            if($concluido_aula == 0) {
                // Se não tem timestamp_inicio, usar data_criacao como fallback
                if(!$timestamp_inicio || $timestamp_inicio == 0) {
                    if($data_criacao) {
                        $timestamp_inicio = strtotime($data_criacao);
                    }
                }
                
                if($timestamp_inicio && $timestamp_inicio > 0) {
                    // Calcular timestamp de liberação
                    $timestamp_liberacao = $timestamp_inicio + $tempo_aula_segundos;
                    
                    // Calcular tempo restante
                    if($timestamp_atual < $timestamp_liberacao) {
                        $tempo_restante_aula = $timestamp_liberacao - $timestamp_atual;
                        $tempo_restante_total_segundos += $tempo_restante_aula;
                    }
                    // Se já passou o tempo, não adiciona nada (aula já deveria estar concluída)
                } else {
                    // Se não tem registro de início, a aula não foi iniciada, então o tempo total é o tempo da aula
                    $tempo_restante_total_segundos += $tempo_aula_segundos;
                }
            }
        } else {
            // Se não tem registro, a aula não foi iniciada, então o tempo total é o tempo da aula
            $tempo_restante_total_segundos += $tempo_aula_segundos;
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

