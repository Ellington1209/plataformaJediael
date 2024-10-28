<?php
require_once('../conexao.php');

$query = $pdo->query("SELECT p.id, p.nome AS nome_prova, p.descricao, p.data_criacao, p.status, c.nome AS nome_curso
                      FROM provas p
                      LEFT JOIN cursos c ON p.curso_id = c.id
                      ORDER BY p.id DESC");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);

if ($total_reg > 0) {
    echo <<<HTML
    <small>
    <table class="table table-hover" id="tabela">
        <thead>
            <tr>
                <th>Nome da Prova</th>
                <th class="esc">Curso</th>
                <th class="esc">Data de Criação</th>
                <th class="esc">Status</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
HTML;

    foreach ($res as $row) {
        $id = $row['id'];
        $nome_prova = $row['nome_prova'];
        $descricao = $row['descricao'];
        $data_criacao = date('d/m/Y', strtotime($row['data_criacao']));
        $status = $row['status'] == 'ativa' ? 'Ativa' : 'Inativa';
        $nome_curso = $row['nome_curso'] ?? 'Sem curso associado';

        echo <<<HTML
        <tr>
            <td>{$nome_prova}</td>
            <td class="esc">{$nome_curso}</td>
            <td class="esc">{$data_criacao}</td>
            <td class="esc">{$status}</td>
            <td>
                <big><a href="#" onclick="mostrarDetalhesProva('{$id}')" title="Ver Dados"><i class="fa fa-info-circle text-secondary"></i></a></big>
                <big><a href="#" onclick="editar('{$id}', '{$nome_prova}', '{$descricao}', '{$status}')" title="Editar Prova"><i class="fa fa-edit text-primary"></i></a></big>

                <li class="dropdown head-dpdn2" style="display: inline-block;">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><big><i class="fa fa-trash-o text-danger"></i></big></a>
                    <ul class="dropdown-menu" style="margin-left:-230px;">
                        <li>
                            <div class="notification_desc2">
                                <p>Confirmar Exclusão? <a href="#" onclick="excluir('{$id}')"><span class="text-danger">Sim</span></a></p>
                            </div>
                        </li>                                      
                    </ul>
                </li>
            </td>
        </tr>
HTML;
    }

    echo <<<HTML
        </tbody>
        <small><div align="center" id="mensagem-excluir"></div></small>
    </table>
    </small>
HTML;
} else {
    echo '<p>Não possui nenhum registro cadastrado!</p>';
}
?>
