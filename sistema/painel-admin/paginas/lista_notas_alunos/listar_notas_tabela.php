<?php
require_once('../conexao.php');

$registros_por_pagina = 30;
$pagina_atual = isset($_GET['pagina']) ? max(1, (int)$_GET['pagina']) : 1; // Garante que seja pelo menos 1
$offset = ($pagina_atual - 1) * $registros_por_pagina;

// Consulta para contar total de registros (apenas os que têm aluno válido)
$query_total = $pdo->query("SELECT COUNT(*) AS total 
                            FROM tentativas_aluno t
                            JOIN usuarios a ON t.id_aluno = a.id_pessoa
                            JOIN provas p ON t.id_prova = p.id");
$total = $query_total->fetch(PDO::FETCH_ASSOC)['total'];
$total_paginas = ceil($total / $registros_por_pagina);

// Consulta para buscar os dados paginados
// t.id_aluno contém o id_pessoa (ID do aluno na tabela alunos)
// JOIN com usuarios usando id_pessoa para pegar o nome
$query = $pdo->prepare("SELECT 
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
                        ORDER BY a.nome, p.nome, t.tentativa DESC
                        LIMIT :offset, :registros");
$query->bindParam(':offset', $offset, PDO::PARAM_INT);
$query->bindParam(':registros', $registros_por_pagina, PDO::PARAM_INT);
$query->execute();

$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

echo <<<HTML
<small>
<div class="form-group " >
    <input type="text" id="buscar" class="form-control" placeholder="Buscar aluno ou prova..." style="width: 400px; border-radius: 10px;" onkeyup="filtrarTabela()">
</div>

<table class="table table-hover" id="tabela">
    <thead>
        <tr>
            <th>Aluno</th>
            <th>Prova</th>
            <th>Tentativa</th>
            <th>Nota</th>
            <th>Data da Tentativa</th>
        </tr>
    </thead>
    <tbody>
HTML;

if ($total_reg > 0) {
    foreach ($res as $row) {
        $nome_aluno = $row['nome_aluno'];
        $nome_prova = $row['nome_prova'];
        $tentativa = $row['tentativa'];
        $nota = number_format($row['nota'], 2, ',', '.') . '%';
        $data_tentativa = date('d/m/Y H:i', strtotime($row['data_tentativa']));

        echo <<<HTML
        <tr>
            <td>{$nome_aluno}</td>
            <td>{$nome_prova}</td>
            <td>{$tentativa}</td>
            <td>{$nota}</td>
            <td>{$data_tentativa}</td>
        </tr>
HTML;
    }
} else {
    echo '<tr><td colspan="5">Nenhum registro encontrado!</td></tr>';
}

echo <<<HTML
    </tbody>
</table>
</small>
HTML;

// Paginação
echo "<div class='text-center'>";
echo "<ul class='pagination'>";
for ($i = 1; $i <= $total_paginas; $i++) {
    $active = ($i == $pagina_atual) ? 'active' : '';
    echo "<li class='page-item $active'><a class='page-link' href='?pagina=$i'>$i</a></li>";
}
echo "</ul>";
echo "</div>";
?>



<script>
function filtrarTabela() {
    var input, filtro, tabela, tr, td, i, j, txtValue;
    input = document.getElementById("buscar");
    filtro = input.value.toLowerCase();
    tabela = document.getElementById("tabela");
    tr = tabela.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) {
        tr[i].style.display = "none";
        td = tr[i].getElementsByTagName("td");

        for (j = 0; j < td.length; j++) {
            if (td[j]) {
                txtValue = td[j].textContent || td[j].innerText;
                if (txtValue.toLowerCase().indexOf(filtro) > -1) {
                    tr[i].style.display = "";
                    break;
                }
            }
        }
    }
}
</script>
