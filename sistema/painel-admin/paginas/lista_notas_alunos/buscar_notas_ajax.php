<?php 
require_once("../../../conexao.php");

header('Content-Type: application/json; charset=utf-8');

$registros_por_pagina = 30;
$pagina_atual = isset($_GET['pagina']) ? max(1, (int)$_GET['pagina']) : 1;
$offset = ($pagina_atual - 1) * $registros_por_pagina;
$busca = isset($_GET['busca']) ? trim($_GET['busca']) : '';

try {
    // Construir condições WHERE para busca
    $where_conditions = [];
    $params = [];
    
    if (!empty($busca)) {
        $where_conditions[] = "(a.nome LIKE :busca OR p.nome LIKE :busca)";
        $params[':busca'] = '%' . $busca . '%';
    }
    
    $where_clause = !empty($where_conditions) ? 'WHERE ' . implode(' AND ', $where_conditions) : '';
    
    // Consulta para contar total de registros
    $sql_total = "SELECT COUNT(*) AS total 
                  FROM tentativas_aluno t
                  JOIN usuarios a ON t.id_aluno = a.id_pessoa
                  JOIN provas p ON t.id_prova = p.id
                  $where_clause";
    
    $query_total = $pdo->prepare($sql_total);
    foreach ($params as $key => $value) {
        $query_total->bindValue($key, $value, PDO::PARAM_STR);
    }
    $query_total->execute();
    $total = $query_total->fetch(PDO::FETCH_ASSOC)['total'];
    $total_paginas = ceil($total / $registros_por_pagina);

    // Consulta para buscar os dados paginados
    $sql = "SELECT 
                t.id_aluno AS id_aluno,
                a.nome AS nome_aluno,
                p.id AS id_prova,
                p.nome AS nome_prova,
                t.tentativa,
                t.nota,
                t.data_tentativa
            FROM tentativas_aluno t
            JOIN usuarios a ON t.id_aluno = a.id_pessoa
            JOIN provas p ON t.id_prova = p.id
            $where_clause
            ORDER BY a.nome, p.nome, t.tentativa DESC
            LIMIT :offset, :registros";
    
    $query = $pdo->prepare($sql);
    
    // Bind dos parâmetros de busca
    foreach ($params as $key => $value) {
        $query->bindValue($key, $value, PDO::PARAM_STR);
    }
    
    // Bind dos parâmetros de paginação
    $query->bindValue(':offset', $offset, PDO::PARAM_INT);
    $query->bindValue(':registros', $registros_por_pagina, PDO::PARAM_INT);
    $query->execute();

    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    
    // Formatar os dados
    $dados = [];
    foreach ($res as $row) {
        $dados[] = [
            'id_aluno' => $row['id_aluno'],
            'nome_aluno' => $row['nome_aluno'],
            'id_prova' => $row['id_prova'],
            'nome_prova' => $row['nome_prova'],
            'tentativa' => $row['tentativa'],
            'nota' => number_format($row['nota'], 2, ',', '.') . '%',
            'data_tentativa' => date('d/m/Y H:i', strtotime($row['data_tentativa']))
        ];
    }

    echo json_encode([
        'success' => true,
        'dados' => $dados,
        'pagina_atual' => $pagina_atual,
        'total_paginas' => $total_paginas,
        'total_registros' => $total,
        'registros_por_pagina' => $registros_por_pagina
    ], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);

} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'error' => 'Erro ao buscar dados: ' . $e->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}
?>

