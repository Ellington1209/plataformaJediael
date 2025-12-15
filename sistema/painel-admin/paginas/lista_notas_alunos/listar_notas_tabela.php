<small>
<div class="form-group">
    <input type="text" id="buscar" class="form-control" placeholder="Buscar aluno ou prova..." style="width: 400px; border-radius: 10px;" onkeyup="filtrarTabela()">
</div>

<div id="loading" class="text-center" style="display: none;">
    <p>Carregando dados...</p>
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
    <tbody id="tbody-dados">
        <tr>
            <td colspan="5" class="text-center">Carregando dados...</td>
        </tr>
    </tbody>
</table>

<div id="paginacao" class="text-center"></div>
</small>

<script>
let paginaAtual = 1;
let totalPaginas = 1;
let termoBusca = '';
let timeoutBusca = null;

// Carregar dados ao iniciar a página
document.addEventListener('DOMContentLoaded', function() {
    carregarDados(1, '');
});

function carregarDados(pagina, busca) {
    paginaAtual = pagina;
    termoBusca = busca || '';
    
    // Mostrar loading
    document.getElementById('loading').style.display = 'block';
    document.getElementById('tbody-dados').innerHTML = '<tr><td colspan="5" class="text-center">Carregando dados...</td></tr>';
    
    // Construir URL absoluta baseada na estrutura do projeto
    // O arquivo está em: sistema/painel-admin/paginas/lista_notas_alunos/buscar_notas_ajax.php
    const caminhoAtual = window.location.pathname;
    let urlAjax;
    
    // Extrair o caminho base (até /painel-admin/)
    const match = caminhoAtual.match(/(.*\/painel-admin\/)/);
    if (match) {
        urlAjax = match[1] + 'paginas/lista_notas_alunos/buscar_notas_ajax.php';
    } else {
        // Fallback: tentar caminho relativo
        urlAjax = 'paginas/lista_notas_alunos/buscar_notas_ajax.php';
    }
    
    // Construir parâmetros da URL
    let params = '?pagina=' + pagina;
    if (termoBusca) {
        params += '&busca=' + encodeURIComponent(termoBusca);
    }
    
    // Fazer requisição AJAX
    const xhr = new XMLHttpRequest();
    xhr.open('GET', urlAjax + params, true);
    
    xhr.onload = function() {
        document.getElementById('loading').style.display = 'none';
        
        if (xhr.status === 200) {
            try {
                const response = JSON.parse(xhr.responseText);
                
                if (response.success) {
                    totalPaginas = response.total_paginas;
                    preencherTabela(response.dados);
                    atualizarPaginacao(response.pagina_atual, response.total_paginas, response.total_registros);
                } else {
                    document.getElementById('tbody-dados').innerHTML = '<tr><td colspan="5" class="text-center text-danger">Erro ao carregar dados: ' + (response.error || 'Erro desconhecido') + '</td></tr>';
                }
            } catch (e) {
                document.getElementById('tbody-dados').innerHTML = '<tr><td colspan="5" class="text-center text-danger">Erro ao processar resposta do servidor</td></tr>';
                console.error('Erro ao parsear JSON:', e);
            }
        } else {
            document.getElementById('tbody-dados').innerHTML = '<tr><td colspan="5" class="text-center text-danger">Erro ao carregar dados. Status: ' + xhr.status + '</td></tr>';
        }
    };
    
    xhr.onerror = function() {
        document.getElementById('loading').style.display = 'none';
        document.getElementById('tbody-dados').innerHTML = '<tr><td colspan="5" class="text-center text-danger">Erro de conexão ao carregar dados</td></tr>';
    };
    
    xhr.send();
}

function preencherTabela(dados) {
    const tbody = document.getElementById('tbody-dados');
    
    if (dados.length === 0) {
        tbody.innerHTML = '<tr><td colspan="5" class="text-center">Nenhum registro encontrado!</td></tr>';
        return;
    }
    
    let html = '';
    dados.forEach(function(item) {
        html += '<tr>';
        html += '<td>' + item.nome_aluno + '</td>';
        html += '<td>' + item.nome_prova + '</td>';
        html += '<td>' + item.tentativa + '</td>';
        html += '<td>' + item.nota + '</td>';
        html += '<td>' + item.data_tentativa + '</td>';
        html += '</tr>';
    });
    
    tbody.innerHTML = html;
}

function atualizarPaginacao(paginaAtual, totalPaginas, totalRegistros) {
    const divPaginacao = document.getElementById('paginacao');
    
    if (totalPaginas <= 1) {
        divPaginacao.innerHTML = '<p class="text-muted">Total de registros: ' + totalRegistros + '</p>';
        return;
    }
    
    // Função auxiliar para escapar o termo de busca
    const escapeBusca = function(busca) {
        return busca.replace(/\\/g, '\\\\').replace(/'/g, "\\'").replace(/"/g, '\\"');
    };
    
    const buscaEscapada = escapeBusca(termoBusca);
    
    let html = '<ul class="pagination">';
    
    // Botão anterior
    if (paginaAtual > 1) {
        html += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="carregarDados(' + (paginaAtual - 1) + ', \'' + buscaEscapada + '\')">Anterior</a></li>';
    } else {
        html += '<li class="page-item disabled"><span class="page-link">Anterior</span></li>';
    }
    
    // Números das páginas
    let inicio = Math.max(1, paginaAtual - 2);
    let fim = Math.min(totalPaginas, paginaAtual + 2);
    
    if (inicio > 1) {
        html += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="carregarDados(1, \'' + buscaEscapada + '\')">1</a></li>';
        if (inicio > 2) {
            html += '<li class="page-item disabled"><span class="page-link">...</span></li>';
        }
    }
    
    for (let i = inicio; i <= fim; i++) {
        if (i === paginaAtual) {
            html += '<li class="page-item active"><span class="page-link">' + i + '</span></li>';
        } else {
            html += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="carregarDados(' + i + ', \'' + buscaEscapada + '\')">' + i + '</a></li>';
        }
    }
    
    if (fim < totalPaginas) {
        if (fim < totalPaginas - 1) {
            html += '<li class="page-item disabled"><span class="page-link">...</span></li>';
        }
        html += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="carregarDados(' + totalPaginas + ', \'' + buscaEscapada + '\')">' + totalPaginas + '</a></li>';
    }
    
    // Botão próximo
    if (paginaAtual < totalPaginas) {
        html += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="carregarDados(' + (paginaAtual + 1) + ', \'' + buscaEscapada + '\')">Próximo</a></li>';
    } else {
        html += '<li class="page-item disabled"><span class="page-link">Próximo</span></li>';
    }
    
    html += '</ul>';
    html += '<p class="text-muted">Página ' + paginaAtual + ' de ' + totalPaginas + ' (Total: ' + totalRegistros + ' registros)';
    if (termoBusca) {
        html += ' - Buscando: "' + termoBusca.replace(/"/g, '&quot;') + '"';
    }
    html += '</p>';
    
    divPaginacao.innerHTML = html;
}

function filtrarTabela() {
    var input = document.getElementById("buscar");
    var busca = input.value.trim();
    
    // Limpar timeout anterior se existir
    if (timeoutBusca) {
        clearTimeout(timeoutBusca);
    }
    
    // Aguardar 500ms após o usuário parar de digitar antes de fazer a busca
    timeoutBusca = setTimeout(function() {
        // Voltar para a primeira página quando buscar
        carregarDados(1, busca);
    }, 500);
}
</script>
