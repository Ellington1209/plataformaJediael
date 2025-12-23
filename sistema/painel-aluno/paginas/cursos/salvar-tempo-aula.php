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
    try {
        if(!$id_aula || !$id_aluno) {
            echo json_encode(['erro' => 'Dados incompletos']);
            exit();
        }
        
        // Buscar dados da aula e do tempo_aulas usando prepared statement
        $query = $pdo->prepare("SELECT ta.timestamp_inicio, ta.data_criacao, ta.concluido, a.tempo_aula 
                               FROM tempo_aulas ta
                               INNER JOIN aulas a ON ta.id_aula = a.id
                               WHERE ta.id_aula = :id_aula AND ta.id_aluno = :id_aluno");
        $query->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
        $query->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
        $query->execute();
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
    } catch(Exception $e) {
        // Em produção, não mostrar detalhes do erro, apenas log
        error_log("Erro em buscar_dados_aula: " . $e->getMessage());
        echo json_encode(['erro' => 'Erro ao buscar dados da aula']);
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
        $query_update->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
        $query_update->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
        $query_update->execute();
    } else {
        $query_update = $pdo->prepare("UPDATE tempo_aulas SET data_atualizacao = CURRENT_TIMESTAMP 
                                       WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
        $query_update->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
        $query_update->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
        $query_update->execute();
    }
    
    // 6. SEMPRE verificar se todas as aulas do curso foram concluídas (mesmo que a aula atual já esteja concluída)
    // Buscar informações da aula e curso
    $query_aula_info = $pdo->prepare("SELECT curso FROM aulas WHERE id = :id_aula");
    $query_aula_info->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_aula_info->execute();
    $res_aula_info = $query_aula_info->fetchAll(PDO::FETCH_ASSOC);
    
    if(@count($res_aula_info) > 0) {
        $id_curso = $res_aula_info[0]['curso'];
        
        // Contar total de aulas do curso
        $query_total_aulas = $pdo->prepare("SELECT COUNT(*) as total FROM aulas WHERE curso = :id_curso");
        $query_total_aulas->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
        $query_total_aulas->execute();
        $res_total_aulas = $query_total_aulas->fetchAll(PDO::FETCH_ASSOC);
        $total_aulas_curso = (int)$res_total_aulas[0]['total'];
        
        // Contar aulas concluídas do aluno neste curso
        $query_aulas_concluidas = $pdo->prepare("SELECT COUNT(DISTINCT ta.id_aula) as total_concluidas
                                                 FROM tempo_aulas ta
                                                 INNER JOIN aulas a ON ta.id_aula = a.id
                                                 WHERE a.curso = :id_curso 
                                                 AND ta.id_aluno = :id_aluno 
                                                 AND ta.concluido = 1");
        $query_aulas_concluidas->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
        $query_aulas_concluidas->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
        $query_aulas_concluidas->execute();
        $res_aulas_concluidas = $query_aulas_concluidas->fetchAll(PDO::FETCH_ASSOC);
        $aulas_concluidas = (int)$res_aulas_concluidas[0]['total_concluidas'];
        
        // Variáveis de debug
        $debug_info = [
            'id_curso' => $id_curso,
            'id_aluno' => $id_aluno,
            'total_aulas_curso' => $total_aulas_curso,
            'aulas_concluidas' => $aulas_concluidas,
            'todas_concluidas' => ($aulas_concluidas >= $total_aulas_curso && $total_aulas_curso > 0)
        ];
        
        // Se todas as aulas foram concluídas, atualizar status da matrícula
        if($aulas_concluidas >= $total_aulas_curso && $total_aulas_curso > 0) {
            // Verificar se tem questionário
            $query_quest = $pdo->prepare("SELECT COUNT(*) as total FROM perguntas_quest WHERE curso = :id_curso");
            $query_quest->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
            $query_quest->execute();
            $res_quest = $query_quest->fetchAll(PDO::FETCH_ASSOC);
            $tem_quest = (int)$res_quest[0]['total'] > 0;
            
            // Buscar configuração do questionário
            $query_config = $pdo->query("SELECT questionario FROM config LIMIT 1");
            $res_config = $query_config->fetchAll(PDO::FETCH_ASSOC);
            $questionario_config = @count($res_config) > 0 ? $res_config[0]['questionario'] : 'Não';
            
            $debug_info['tem_quest'] = $tem_quest;
            $debug_info['questionario_config'] = $questionario_config;
            
            // Se tem questionário, verificar se o aluno foi aprovado
            $aluno_aprovado_quest = false;
            if($tem_quest && $questionario_config == 'Sim') {
                // Buscar ID da prova do curso
                $query_prova = $pdo->prepare("SELECT id FROM provas WHERE curso_id = :id_curso LIMIT 1");
                $query_prova->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
                $query_prova->execute();
                $res_prova = $query_prova->fetchAll(PDO::FETCH_ASSOC);
                
                if(@count($res_prova) > 0) {
                    $id_prova = $res_prova[0]['id'];
                    
                    // Buscar id_pessoa do aluno (tabela alunos) a partir do id_usuario
                    $query_aluno_pessoa = $pdo->prepare("SELECT id_pessoa FROM usuarios WHERE id = :id_aluno");
                    $query_aluno_pessoa->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
                    $query_aluno_pessoa->execute();
                    $res_aluno_pessoa = $query_aluno_pessoa->fetchAll(PDO::FETCH_ASSOC);
                    
                    if(@count($res_aluno_pessoa) > 0) {
                        $id_aluno_pessoa = $res_aluno_pessoa[0]['id_pessoa'];
                        
                        // Verificar se o aluno tem uma tentativa aprovada (nota >= 70)
                        $query_aprovado = $pdo->prepare("SELECT COUNT(*) as total FROM tentativas_aluno 
                                                          WHERE id_aluno = :id_aluno_pessoa 
                                                          AND id_prova = :id_prova 
                                                          AND nota >= 70");
                        $query_aprovado->bindValue(":id_aluno_pessoa", $id_aluno_pessoa, PDO::PARAM_INT);
                        $query_aprovado->bindValue(":id_prova", $id_prova, PDO::PARAM_INT);
                        $query_aprovado->execute();
                        $res_aprovado = $query_aprovado->fetchAll(PDO::FETCH_ASSOC);
                        $aluno_aprovado_quest = (int)$res_aprovado[0]['total'] > 0;
                        
                        // Buscar a maior nota do aluno nesta prova para debug
                        $query_nota = $pdo->prepare("SELECT MAX(nota) as maior_nota, COUNT(*) as total_tentativas 
                                                     FROM tentativas_aluno 
                                                     WHERE id_aluno = :id_aluno_pessoa 
                                                     AND id_prova = :id_prova");
                        $query_nota->bindValue(":id_aluno_pessoa", $id_aluno_pessoa, PDO::PARAM_INT);
                        $query_nota->bindValue(":id_prova", $id_prova, PDO::PARAM_INT);
                        $query_nota->execute();
                        $res_nota = $query_nota->fetchAll(PDO::FETCH_ASSOC);
                        
                        $debug_info['id_prova'] = $id_prova;
                        $debug_info['id_aluno_pessoa'] = $id_aluno_pessoa;
                        $debug_info['aluno_aprovado_quest'] = $aluno_aprovado_quest;
                        $debug_info['maior_nota'] = @count($res_nota) > 0 ? (float)$res_nota[0]['maior_nota'] : 0;
                        $debug_info['total_tentativas'] = @count($res_nota) > 0 ? (int)$res_nota[0]['total_tentativas'] : 0;
                    }
                }
            }
            
            // Se todas as aulas foram concluídas E (não tem questionário OU aluno foi aprovado), finalizar curso
            if(!$tem_quest || $questionario_config != 'Sim' || $aluno_aprovado_quest) {
                // Buscar matrícula para verificar se existe e qual o status atual
                $query_verificar_mat = $pdo->prepare("SELECT id, status FROM matriculas 
                                                       WHERE id_curso = :id_curso 
                                                       AND aluno = :id_aluno");
                $query_verificar_mat->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
                $query_verificar_mat->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
                $query_verificar_mat->execute();
                $res_mat = $query_verificar_mat->fetchAll(PDO::FETCH_ASSOC);
                
                $debug_info['matricula_encontrada'] = @count($res_mat) > 0;
                if(@count($res_mat) > 0) {
                    $debug_info['status_atual'] = $res_mat[0]['status'];
                    $debug_info['id_matricula'] = $res_mat[0]['id'];
                }
                
                // Se encontrou a matrícula e o status não é 'Finalizado', atualizar
                if(@count($res_mat) > 0 && $res_mat[0]['status'] != 'Finalizado') {
                    $query_finalizar = $pdo->prepare("UPDATE matriculas 
                                                     SET status = 'Finalizado', 
                                                         data_conclusao = CURDATE(),
                                                         aulas_concluidas = :aulas_concluidas
                                                     WHERE id_curso = :id_curso 
                                                     AND aluno = :id_aluno");
                    $query_finalizar->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
                    $query_finalizar->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
                    $query_finalizar->bindValue(":aulas_concluidas", $aulas_concluidas, PDO::PARAM_INT);
                    $query_finalizar->execute();
                    $debug_info['update_executado'] = true;
                    $debug_info['linhas_afetadas'] = $query_finalizar->rowCount();
                } else {
                    $debug_info['update_executado'] = false;
                    $debug_info['motivo_nao_atualizou'] = @count($res_mat) == 0 ? 'Matrícula não encontrada' : 'Status já é Finalizado';
                }
            } else {
                // Se tem questionário mas aluno não foi aprovado, apenas atualizar aulas_concluidas
                $query_update_mat = $pdo->prepare("UPDATE matriculas 
                                                   SET aulas_concluidas = :aulas_concluidas
                                                   WHERE id_curso = :id_curso 
                                                   AND aluno = :id_aluno");
                $query_update_mat->bindValue(":id_curso", $id_curso, PDO::PARAM_INT);
                $query_update_mat->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
                $query_update_mat->bindValue(":aulas_concluidas", $aulas_concluidas, PDO::PARAM_INT);
                $query_update_mat->execute();
                $debug_info['update_executado'] = true;
                $debug_info['motivo'] = 'Tem questionário e aluno não foi aprovado, apenas atualizou aulas_concluidas';
            }
        } else {
            $debug_info['motivo_nao_finalizou'] = "Aulas concluídas ($aulas_concluidas) < Total de aulas ($total_aulas_curso)";
        }
    } else {
        $debug_info = ['erro' => 'Não foi possível encontrar informações da aula'];
    }
    
    // Buscar o ID do registro atualizado
    $query_id = $pdo->prepare("SELECT id FROM tempo_aulas WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    $query_id->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query_id->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query_id->execute();
    $res_id = $query_id->fetchAll(PDO::FETCH_ASSOC);
    $id_tempo_aula = $res_id[0]['id'];
    
    // Preparar resposta com debug
    $resposta = [
        'sucesso' => true, 
        'acao' => 'atualizado',
        'id' => $id_tempo_aula,
        'concluido' => $deve_concluir ? true : ($ja_concluido == 1)
    ];
    
    // Adicionar informações de debug se existirem
    if(isset($debug_info)) {
        $resposta['debug'] = $debug_info;
    }
    
    echo json_encode($resposta);
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

