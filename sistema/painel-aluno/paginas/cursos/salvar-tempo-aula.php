<?php 
require_once("../../../conexao.php");
@session_start();

// Buscar configuração do questionário
$query_config = $pdo->query("SELECT questionario FROM config");
$res_config = $query_config->fetchAll(PDO::FETCH_ASSOC);
$questionario_config = @count($res_config) > 0 ? $res_config[0]['questionario'] : 'Não';

$id_aula = @$_POST['id_aula'];
$id_aluno = @$_SESSION['id'];
$tempo_restante = @$_POST['tempo_restante'];
$acao = @$_POST['acao']; // 'salvar', 'recuperar', 'concluir' ou 'verificar_concluido'

// Criar tabela se não existir com todas as colunas
$pdo->query("CREATE TABLE IF NOT EXISTS tempo_aulas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_aula INT NOT NULL,
    id_aluno INT NOT NULL,
    tempo_restante INT NOT NULL,
    concluido TINYINT(1) DEFAULT 0,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_aula_aluno (id_aula, id_aluno)
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

// Limpar registros antigos (mais de 30 dias) que não foram concluídos
try {
    $pdo->query("DELETE FROM tempo_aulas WHERE concluido = 0 AND data_atualizacao < DATE_SUB(NOW(), INTERVAL 30 DAY)");
} catch(PDOException $e) {
    // Erro silencioso
}

// Limpar registros concluídos muito antigos (mais de 90 dias)
try {
    $pdo->query("DELETE FROM tempo_aulas WHERE concluido = 1 AND data_atualizacao < DATE_SUB(NOW(), INTERVAL 90 DAY)");
} catch(PDOException $e) {
    // Erro silencioso
}

if($acao == 'salvar') {
    if(!$id_aula || !$id_aluno || !isset($tempo_restante)) {
        echo 'ERRO: Dados incompletos';
        exit();
    }
    
    // Salvar ou atualizar o tempo restante (só se não estiver concluído)
    $query = $pdo->prepare("INSERT INTO tempo_aulas (id_aula, id_aluno, tempo_restante, concluido) 
                           VALUES (:id_aula, :id_aluno, :tempo_restante, 0)
                           ON DUPLICATE KEY UPDATE 
                           tempo_restante = IF(concluido = 0, :tempo_restante2, tempo_restante),
                           data_atualizacao = IF(concluido = 0, CURRENT_TIMESTAMP, data_atualizacao)");
    $query->bindValue(":id_aula", $id_aula, PDO::PARAM_INT);
    $query->bindValue(":id_aluno", $id_aluno, PDO::PARAM_INT);
    $query->bindValue(":tempo_restante", $tempo_restante, PDO::PARAM_INT);
    $query->bindValue(":tempo_restante2", $tempo_restante, PDO::PARAM_INT);
    
    try {
        $query->execute();
        echo "OK";
    } catch(PDOException $e) {
        echo "ERRO: " . $e->getMessage();
    }
    
} else if($acao == 'recuperar') {
    if(!$id_aula || !$id_aluno) {
        echo '0';
        exit();
    }
    
    // Recuperar o tempo restante (só se não estiver concluído)
    $query = $pdo->query("SELECT tempo_restante, concluido FROM tempo_aulas 
                         WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    
    if(@count($res) > 0) {
        if($res[0]['concluido'] == 1) {
            // Se já foi concluído, retorna -1 para indicar que não precisa mais contar
            echo '-1';
        } else {
            echo $res[0]['tempo_restante'];
        }
    } else {
        // Se não encontrar registro, retorna null para indicar que deve usar o tempo inicial da aula
        // O JavaScript tratará isso e usará tempo_aula * 60
        echo '0';
    }
    
} else if($acao == 'concluir') {
    // Marcar aula como concluída e atualizar progresso do curso
    if(!$id_aula || !$id_aluno) {
        echo 'ERRO: Dados incompletos';
        exit();
    }
    
    // 1. Marcar a aula como concluída na tabela tempo_aulas
    $query = $pdo->prepare("UPDATE tempo_aulas SET concluido = 1, tempo_restante = 0 
                           WHERE id_aula = :id_aula AND id_aluno = :id_aluno");
    $query->bindValue(":id_aula", $id_aula);
    $query->bindValue(":id_aluno", $id_aluno);
    
    try {
        $query->execute();
        $linhas = $query->rowCount();
        if($linhas == 0) {
            // Se não existir registro, criar um marcado como concluído
            $query2 = $pdo->prepare("INSERT INTO tempo_aulas (id_aula, id_aluno, tempo_restante, concluido) 
                                    VALUES (:id_aula, :id_aluno, 0, 1)");
            $query2->bindValue(":id_aula", $id_aula);
            $query2->bindValue(":id_aluno", $id_aluno);
            $query2->execute();
        }
        
        // 2. Buscar informações da aula e curso
        $query_aula = $pdo->query("SELECT curso, sequencia_aula FROM aulas WHERE id = '$id_aula'");
        $res_aula = $query_aula->fetchAll(PDO::FETCH_ASSOC);
        
        if(@count($res_aula) > 0) {
            $id_curso = $res_aula[0]['curso'];
            $seq_aula = $res_aula[0]['sequencia_aula'];
            
            // 3. Buscar matrícula do aluno no curso
            $query_mat = $pdo->query("SELECT id FROM matriculas WHERE id_curso = '$id_curso' AND aluno = '$id_aluno'");
            $res_mat = $query_mat->fetchAll(PDO::FETCH_ASSOC);
            
            if(@count($res_mat) > 0) {
                $id_matricula = $res_mat[0]['id'];
                
                // 4. Contar quantas aulas foram realmente concluídas (tempo zerado)
                $query_contar = $pdo->query("SELECT COUNT(DISTINCT ta.id_aula) as total_concluidas
                                            FROM tempo_aulas ta
                                            INNER JOIN aulas a ON ta.id_aula = a.id
                                            WHERE a.curso = '$id_curso' 
                                            AND ta.id_aluno = '$id_aluno' 
                                            AND ta.concluido = 1");
                $res_contar = $query_contar->fetchAll(PDO::FETCH_ASSOC);
                $aulas_concluidas = $res_contar[0]['total_concluidas'];
                
                // 5. Atualizar aulas_concluidas na matrícula
                $query_update = $pdo->prepare("UPDATE matriculas SET aulas_concluidas = :aulas_concluidas WHERE id = :id_matricula");
                $query_update->bindValue(":aulas_concluidas", $aulas_concluidas);
                $query_update->bindValue(":id_matricula", $id_matricula);
                $query_update->execute();
                
                // 6. Verificar se todas as aulas foram concluídas para finalizar o curso
                $query_total = $pdo->query("SELECT COUNT(*) as total FROM aulas WHERE curso = '$id_curso'");
                $res_total = $query_total->fetchAll(PDO::FETCH_ASSOC);
                $total_aulas_curso = $res_total[0]['total'];
                
                // Verificar se tem questionário
                $query_quest = $pdo->query("SELECT COUNT(*) as total FROM perguntas_quest WHERE curso = '$id_curso'");
                $res_quest = $query_quest->fetchAll(PDO::FETCH_ASSOC);
                $tem_quest = $res_quest[0]['total'] > 0;
                
                // Se todas as aulas foram concluídas e não tem questionário, finalizar curso
                if($aulas_concluidas >= $total_aulas_curso) {
                    if(!$tem_quest || $questionario_config != 'Sim') {
                        $query_finalizar = $pdo->prepare("UPDATE matriculas SET status = 'Finalizado', data_conclusao = CURDATE() 
                                                         WHERE id = :id_matricula AND status != 'Finalizado'");
                        $query_finalizar->bindValue(":id_matricula", $id_matricula);
                        $query_finalizar->execute();
                    }
                }
                
                echo "OK|Aula concluída|Progresso: $aulas_concluidas/$total_aulas_curso aulas";
            } else {
                echo "OK|Aula marcada como concluída (matrícula não encontrada)";
            }
        } else {
            echo "OK|Aula marcada como concluída (curso não encontrado)";
        }
        
    } catch(PDOException $e) {
        echo "ERRO: " . $e->getMessage();
    }
    
} else if($acao == 'verificar_concluido') {
    // Verificar se a aula já foi concluída
    if(!$id_aula || !$id_aluno) {
        echo '0';
        exit();
    }
    
    $query = $pdo->query("SELECT concluido FROM tempo_aulas 
                         WHERE id_aula = '$id_aula' AND id_aluno = '$id_aluno'");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    
    if(@count($res) > 0 && $res[0]['concluido'] == 1) {
        echo '1'; // Já foi concluído
    } else {
        echo '0'; // Não foi concluído ainda
    }
}

?>

