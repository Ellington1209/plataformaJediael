<?php
require_once('../conexao.php');
require_once('verificar.php');
$pag = 'provas';

if (@$_SESSION['nivel'] != 'Administrador' and @$_SESSION['nivel'] != 'Professor') {
    echo "<script>window.location='../index.php'</script>";
    exit();
}
?>

<button onclick="inserir()" type="button" class="btn btn-primary btn-flat btn-pri"><i class="fa fa-plus" aria-hidden="true"></i> Cadastrar Nova Prova</button>

<!-- Modal Form para cadastrar nova prova -->
<div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="tituloModal">Cadastrar Prova</h4>
                <button id="btn-fechar" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form method="post" id="form-prova">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="curso">Curso</label>
                        <!-- Campo de curso editável no modo cadastro -->
                        <select class="form-control" name="curso" id="curso" required style="display: none;">
                            <!-- As opções de cursos serão preenchidas via AJAX -->
                        </select>
                        <!-- Campo de curso somente leitura no modo edição -->
                        <p id="curso_nome" class="form-control-plaintext" style="display: none;"></p>
                    </div>


                    <div class="form-group">
                        <label for="nome_prova">Nome da Prova</label>
                        <input type="text" class="form-control" name="nome_prova" id="nome_prova" required>
                    </div>

                    <div class="form-group">
                        <label for="descricao">Descrição</label>
                        <textarea class="form-control" name="descricao" id="descricao" rows="3"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="num_perguntas">Quantas perguntas terá a prova?</label>
                        <input type="number" class="form-control" name="num_perguntas" id="num_perguntas" min="1" max="20" required onchange="gerarCamposPerguntas()">
                    </div>

                    <div id="perguntas-container">
                    </div>

                    <div id="mensagem-resultado" class="mt-3"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Salvar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Importar a tabela de provas de um arquivo separado -->
<div class="bs-example widget-shadow" style="padding:15px" id="listar">
    <?php include 'provas/listar_provas_tabela.php'; ?>
</div>




<!-- Modal para exibir detalhes da prova -->
<div class="modal fade" id="modalMostrar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title"><b id="nome_mostrar"> </b></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="detalhesProva">
                <!-- Conteúdo gerado dinamicamente via JavaScript -->
            </div>
        </div>
    </div>
</div>



<!-- Modal Form para editar prova -->
<div class="modal fade" id="modalEditForm" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="editModalLabel">Editar Prova</h4>
                <button id="btn-fechar" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: -20px">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form method="post" id="form-edit-prova">
                <div class="modal-body">
                    <input type="hidden" name="id_prova" id="id_prova"> <!-- Campo oculto para armazenar o ID da prova -->
                    <div class="form-group">
                        <label for="curso_nome_edit">Curso</label>
                        <p id="curso_nome_edit" class="form-control-plaintext"></p>
                    </div>

                    <div class="form-group">
                        <label for="nome_prova_edit">Nome da Prova</label>
                        <input type="text" class="form-control" name="nome_prova" id="nome_prova_edit" required>
                    </div>

                    <div class="form-group">
                        <label for="descricao_edit">Descrição</label>
                        <textarea class="form-control" name="descricao" id="descricao_edit" rows="3"></textarea>
                    </div>

                    <div id="perguntas-edit-container"></div>

                    <div id="mensagem-resultado-edit" class="mt-3"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
    function mostrarDetalhesProva(id) {
        $.ajax({
            url: 'paginas/provas/detalhes_prova.php',
            method: 'POST',
            data: {
                id: id
            },
            success: function(response) {
                $('#detalhesProva').html(response);
                $('#modalMostrar').modal('show');
            },
            error: function() {
                alert('Erro ao carregar os detalhes da prova.');
            }
        });
    }
</script>

<!-- JavaScript para manipulação dos dados da tabela de provas -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#tabela').DataTable({
            "ordering": false,
            "stateSave": true,
        });
        $('#tabela_filter label input').focus();
    });

    function editar(id) {
        $.ajax({
            url: 'paginas/provas/editar_prova.php',
            method: 'POST',
            data: {
                id: id
            },
            success: function(response) {
                if (response.status === 'success') {
                    const prova = response.prova;
                    const perguntas = response.perguntas;

                    $('#id_prova').val(prova.id);
                    $('#curso_nome_edit').text(prova.nome_curso);
                    $('#nome_prova_edit').val(prova.nome);
                    $('#descricao_edit').val(prova.descricao);

                    gerarCamposPerguntasEdicao(perguntas, 'perguntas-edit-container');

                    $('#editModalLabel').text('Editar Prova');
                    $('#mensagem-resultado-edit').text('');
                    $('#modalEditForm').modal('show');
                } else {
                    alert(response.message);
                }
            },
            error: function() {
                alert('Erro ao carregar os dados da prova para edição.');
            }
        });
    }
    // Atualizar o formulário de edição para enviar a requisição para update_provas.php
    $('#form-edit-prova').on('submit', function(e) {
        e.preventDefault();
        $('#mensagem-resultado-edit').html('<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>');

        $.ajax({
            url: 'paginas/provas/update_provas.php',
            method: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                if (response.status === 'success') {
                    $('#mensagem-resultado-edit').html('<div class="alert alert-success">' + response.message + '</div>');
                    recarregarTabela(); // Recarregar a tabela de provas após atualização
                    $('#modalEditForm').modal('hide');
                } else {
                    $('#mensagem-resultado-edit').html('<div class="alert alert-danger">' + response.message + '</div>');
                }
            },
            error: function() {
                $('#mensagem-resultado-edit').html('<div class="alert alert-danger">Erro ao processar a solicitação.</div>');
            }
        });
    });

    function mostrar(nome, descricao, data_criacao, status, curso) {
        $('#nome_mostrar').text(nome);
        $('#descricao_mostrar').text(descricao);
        $('#data_criacao_mostrar').text(data_criacao);
        $('#status_mostrar').text(status);
        $('#curso_mostrar').text(curso);

        $('#modalMostrar').modal('show');
    }

    function excluir(id) {

        $.ajax({
            url: 'paginas/provas/excluir_prova.php',
            method: 'POST',
            data: {
                id: id
            },
            success: function(response) {
                if (response.status === 'success') {
                    location.reload();
                } else {
                    alert('Erro ao excluir prova: ' + response.message);
                }
            },
            error: function() {
                alert('Erro ao processar a solicitação.');
            }
        });

    }
</script>


<script>
    function inserir() {
        $('#tituloModal').text('Cadastrar Prova');
        $('#form-prova')[0].reset();
        $('#curso_nome').hide();
        $('#curso').show();
        $('#mensagem-resultado').html('');

        $.ajax({
            url: 'paginas/provas/buscar_cursos.php',
            method: 'POST',
            success: function(data) {
                $('#curso').html(data);
            },
            error: function() {
                $('#curso').html('<option value="">Erro ao carregar cursos</option>');
            }
        });

        $('#num_perguntas').on('change', function() {
            const numPerguntas = parseInt(this.value, 10) || 0;
            gerarCamposPerguntasCadastro(numPerguntas, 'perguntas-container');
        });

        $('#modalForm').modal('show');
    }


    $('#form-prova').on('submit', function(e) {
        e.preventDefault();
        $('#mensagem-resultado').html('<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>');

        $.ajax({
            url: 'paginas/provas/salvar_provas.php',
            method: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                if (response.status === 'success') {
                    $('#mensagem-resultado').html('<div class="alert alert-success">' + response.message + '</div>');
                    $('#form-prova')[0].reset(); // Reseta o formulário
                    recarregarTabela(); // Chama a função para recarregar a tabela
                } else {
                    $('#mensagem-resultado').html('<div class="alert alert-danger">' + response.message + '</div>');
                }
            },
            error: function() {
                $('#mensagem-resultado').html('<div class="alert alert-danger">Erro ao processar a solicitação.</div>');
            }
        });
    });

    // Função para recarregar a tabela de provas
    function recarregarTabela() {
        location.reload(); // Atualiza a página completamente
    }

    // Captura o número de perguntas e chama a função para gerar as perguntas no cadastro
    document.getElementById('num_perguntas').addEventListener('change', function() {
        const numPerguntas = parseInt(this.value, 10) || 0;
        gerarCamposPerguntas(new Array(numPerguntas).fill({}), 'perguntas-container');
    });

    // Função para novo cadastro
    function gerarCamposPerguntasCadastro(numPerguntas, containerId = 'perguntas-container') {
        const container = document.getElementById(containerId);
        container.innerHTML = ''; // Limpa o container antes de gerar novos campos

        const opcoes = ['A', 'B', 'C', 'D'];

        for (let i = 0; i < numPerguntas; i++) {
            const perguntaDiv = document.createElement('div');
            perguntaDiv.classList.add('form-group');

            const perguntaLabel = document.createElement('label');
            perguntaLabel.innerHTML = `Pergunta ${i + 1}:`;

            const perguntaInput = document.createElement('input');
            perguntaInput.type = 'text';
            perguntaInput.classList.add('form-control');
            perguntaInput.name = `perguntas[${i}][texto]`;
            perguntaInput.required = true;

            perguntaDiv.appendChild(perguntaLabel);
            perguntaDiv.appendChild(perguntaInput);
            container.appendChild(perguntaDiv);

            opcoes.forEach((opcao, altIndex) => {
                const opcaoDiv = document.createElement('div');
                opcaoDiv.classList.add('form-group');

                const opcaoLabel = document.createElement('label');
                opcaoLabel.innerHTML = `Opção ${opcao}:`;

                const opcaoInput = document.createElement('input');
                opcaoInput.type = 'text';
                opcaoInput.classList.add('form-control');
                opcaoInput.name = `perguntas[${i}][opcoes][]`;
                opcaoInput.required = true;

                opcaoDiv.appendChild(opcaoLabel);
                opcaoDiv.appendChild(opcaoInput);
                container.appendChild(opcaoDiv);
            });

            const corretaDiv = document.createElement('div');
            corretaDiv.classList.add('form-group');

            const corretaLabel = document.createElement('label');
            corretaLabel.innerHTML = 'Escolha a opção correta:';

            const corretaSelect = document.createElement('select');
            corretaSelect.classList.add('form-control');
            corretaSelect.name = `perguntas[${i}][correta]`;
            corretaSelect.required = true;

            opcoes.forEach((opcao) => {
                const option = new Option(`Opção ${opcao}`, opcao);
                corretaSelect.add(option);
            });

            corretaDiv.appendChild(corretaLabel);
            corretaDiv.appendChild(corretaSelect);
            container.appendChild(corretaDiv);
        }
    }

    // Função para edição
    function gerarCamposPerguntasEdicao(perguntas = [], containerId = 'perguntas-edit-container') {
        const container = document.getElementById(containerId);
        container.innerHTML = ''; // Limpa o container antes de gerar novos campos

        perguntas.forEach((pergunta, index) => {
            const perguntaDiv = document.createElement('div');
            perguntaDiv.classList.add('form-group');

            const perguntaLabel = document.createElement('label');
            perguntaLabel.innerHTML = `Pergunta ${index + 1}:`;

            const perguntaIdInput = document.createElement('input');
            perguntaIdInput.type = 'hidden';
            perguntaIdInput.name = `perguntas[${index}][id]`;
            perguntaIdInput.value = pergunta.id;

            const perguntaInput = document.createElement('input');
            perguntaInput.type = 'text';
            perguntaInput.classList.add('form-control');
            perguntaInput.name = `perguntas[${index}][texto]`;
            perguntaInput.value = pergunta.texto;
            perguntaInput.required = true;

            perguntaDiv.appendChild(perguntaLabel);
            perguntaDiv.appendChild(perguntaIdInput);
            perguntaDiv.appendChild(perguntaInput);
            container.appendChild(perguntaDiv);

            const opcoes = ['A', 'B', 'C', 'D'];
            pergunta.alternativas.forEach((alternativa, altIndex) => {
                const opcaoDiv = document.createElement('div');
                opcaoDiv.classList.add('form-group');

                const opcaoLabel = document.createElement('label');
                opcaoLabel.innerHTML = `Opção ${opcoes[altIndex]}:`;

                const alternativaIdInput = document.createElement('input');
                alternativaIdInput.type = 'hidden';
                alternativaIdInput.name = `perguntas[${index}][alternativas][${altIndex}][id]`;
                alternativaIdInput.value = alternativa.id;

                const opcaoInput = document.createElement('input');
                opcaoInput.type = 'text';
                opcaoInput.classList.add('form-control');
                opcaoInput.name = `perguntas[${index}][opcoes][]`;
                opcaoInput.value = alternativa.texto;
                opcaoInput.required = true;

                opcaoDiv.appendChild(opcaoLabel);
                opcaoDiv.appendChild(alternativaIdInput);
                opcaoDiv.appendChild(opcaoInput);
                container.appendChild(opcaoDiv);
            });

            const corretaDiv = document.createElement('div');
            corretaDiv.classList.add('form-group');

            const corretaLabel = document.createElement('label');
            corretaLabel.innerHTML = 'Escolha a opção correta:';

            const corretaSelect = document.createElement('select');
            corretaSelect.classList.add('form-control');
            corretaSelect.name = `perguntas[${index}][correta]`;
            corretaSelect.required = true;

            opcoes.forEach((opcao, opcaoIndex) => {
                const option = new Option(`Opção ${opcao}`, opcao);
                if (pergunta.alternativas[opcaoIndex]?.correta === "1") {
                    option.selected = true;
                }
                corretaSelect.add(option);
            });

            corretaDiv.appendChild(corretaLabel);
            corretaDiv.appendChild(corretaSelect);
            container.appendChild(corretaDiv);
        });
    }
</script>