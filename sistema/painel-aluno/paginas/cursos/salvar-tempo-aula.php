<?php 
require_once("../../../conexao.php");
@session_start();

$id_aula = @$_POST['id_aula'];
$id_aluno = @$_SESSION['id'];
$acao = @$_POST['acao'];

// Se for ação buscar_dados_aula, não precisa verificar id_aluno aqui (será verificado dentro)
if($acao != 'buscar_dados_aula') {
    // Verificar se os dados estão completos
    if(!$id_aula || !$id_aluno) {
        echo json_encode(['erro' => 'Dados incompletos']);
        exit();
    }
}

// Ação para buscar dados da aula para o cronômetro
if($acao == 'buscar_dados_aula') {
    if(!$id_aula || !$id_aluno) {
        echo json_encode(['erro' => 'Dados incompletos']);
        exit();
    }
    
    // Buscar dados da aula e do tempo_aulas
    $query = $pdo->query("SELECT ta.timestamp_inicio, ta.data_criacao, ta.concluido, a.tempo_aula 
                         FROM tempo_aulas ta
                         INNER JOIN aulas a ON ta.id_aula = a.id
                         WHERE ta.id_aula = '$id_aula' AND ta.id_aluno = '$id_aluno'");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    
    if(@count($res) > 0) {
        $concluido = (int)$res[0]['concluido'];
        $timestamp_inicio = $res[0]['timestamp_inicio'];
        $data_criacao = $res[0]['data_criacao'];
        $tempo_aula_minutos = (int)$res[0]['tempo_aula'];
        $tempo_aula_segundos = $tempo_aula_minutos * 60;
        
        // Se não tem timestamp_inicio, usar data_criacao como fallback
        if(!$timestamp_inicio || $timestamp_inicio == 0) {
            if($data_criacao) {
                $timestamp_inicio = strtotime($data_criacao);
            }
        }
        
        if($timestamp_inicio && $timestamp_inicio > 0) {
            $timestamp_liberacao = $timestamp_inicio + $tempo_aula_segundos;
            $timestamp_atual = time();
            $tempo_decorrido = $timestamp_atual - $timestamp_inicio;
            
            // Calcular hora de liberação formatada
            $hora_liberacao = date('H:i', $timestamp_liberacao);
            
            echo json_encode([
                'concluido' => $concluido == 1,
                'timestamp_inicio' => $timestamp_inicio,
                'timestamp_liberacao' => $timestamp_liberacao,
                'timestamp_atual' => $timestamp_atual,
                'tempo_aula_segundos' => $tempo_aula_segundos,
                'tempo_decorrido' => $tempo_decorrido,
                'hora_liberacao' => $hora_liberacao,
                'liberado' => ($timestamp_atual >= $timestamp_liberacao) || ($concluido == 1)
            ]);
        } else {
            echo json_encode(['erro' => 'Timestamp de início não encontrado']);
        }
    } else {
        echo json_encode(['erro' => 'Registro não encontrado']);
    }
    exit();
}

// Verificar se já existe registro com id_aula e id_aluno
$query_verificar = $pdo->prepare("SELECT id FROM tempo_aulas WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
$query_verificar->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
$query_verificar->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
$query_verificar->execute();
$res_verificar = $query_verificar->fetchAll(PDO::FETCH_ASSOC);

if(@count($res_verificar) > 0) {
    // Se já existe, verificar se deve marcar como concluído
    // 1. Buscar data_criacao do registro atual
    $query_data = $pdo->prepare("SELECT data_criacao, concluido FROM tempo_aulas 
                                WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    $query_data->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_data->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query_data->execute();
    $res_data = $query_data->fetchAll(PDO::FETCH_ASSOC);
    
    $data_criacao = $res_data[0]['data_criacao'];
    $ja_concluido = (int)$res_data[0]['concluido'];
    
    // 2. Buscar tempo_aula da tabela aulas
    $query_aula = $pdo->prepare("SELECT tempo_aula FROM aulas WHERE id = :id_aula");
    $query_aula->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_aula->execute();
    $res_aula = $query_aula->fetchAll(PDO::FETCH_ASSOC);
    
    $tempo_aula_minutos = (int)$res_aula[0]['tempo_aula'];
    
    // 3. Calcular data de liberação: data_criacao + tempo_aula (em minutos)
    $timestamp_criacao = strtotime($data_criacao);
    $timestamp_liberacao = $timestamp_criacao + ($tempo_aula_minutos * 60); // tempo_aula em minutos, converter para segundos
    $timestamp_atual = time();
    
    // 4. Se data atual for maior ou igual a data_criacao + tempo_aula, marcar como concluído
    $deve_concluir = false;
    if($timestamp_atual >= $timestamp_liberacao && $ja_concluido == 0) {
        $deve_concluir = true;
    }
    
    // 5. Atualizar registro
    if($deve_concluir) {
        $query_update = $pdo->prepare("UPDATE tempo_aulas 
                                      SET data_atualizacao = CURRENT_TIMESTAMP, concluido = 1 
                                      WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    } else {
        $query_update = $pdo->prepare("UPDATE tempo_aulas SET data_atualizacao = CURRENT_TIMESTAMP 
                                       WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    }
    $query_update->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_update->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query_update->execute();
    
    // Buscar o ID do registro atualizado
    $query_id = $pdo->prepare("SELECT id FROM tempo_aulas WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    $query_id->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_id->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query_id->execute();
    $res_id = $query_id->fetchAll(PDO::FETCH_ASSOC);
    $id_tempo_aula = $res_id[0]['id'];
    
    echo json_encode([
        'sucesso' => true, 
        'acao' => 'atualizado',
        'id' => $id_tempo_aula,
        'concluido' => $deve_concluir ? true : ($ja_concluido == 1)
    ]);
} else {
    // Se não existe, criar novo registro
    $timestamp_atual = time();
    
    $query_insert = $pdo->prepare("INSERT INTO tempo_aulas (id_aula, id_aluno, timestamp_inicio, data_criacao) 
                                   VALUES (:id_aula, :id_aluno, :timestamp_inicio, CURRENT_TIMESTAMP)");
    $query_insert->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_insert->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query_insert->bindValue(":timestamp_inicio", $timestamp_atual, PDO::PARAM_INT);
    $query_insert->execute();
    
    // Buscar o ID do registro criado
    $id_tempo_aula = $pdo->lastInsertId();
    
    echo json_encode([
        'sucesso' => true, 
        'acao' => 'criado', 
        'id' => $id_tempo_aula,
        'timestamp_inicio' => $timestamp_atual
    ]);
}

?>

