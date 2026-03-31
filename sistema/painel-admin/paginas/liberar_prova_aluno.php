<?php
require_once('../conexao.php');
require_once('verificar.php');

if (@$_SESSION['nivel'] != 'Administrador') {
	echo "<script>window.location='../index.php'</script>";
	exit();
}
?>

<div class="bs-example widget-shadow" style="padding:15px; margin-top:15px;">
	<div class="row">
		<div class="col-md-7">
			<label>Selecione o aluno</label>
			<select class="form-control sel2" id="aluno_id" style="width:100%;">
				<option value="">Selecione um aluno</option>
				<?php
				$query = $pdo->query("SELECT id, nome FROM usuarios WHERE nivel = 'Aluno' ORDER BY nome ASC");
				$res = $query->fetchAll(PDO::FETCH_ASSOC);
				for ($i = 0; $i < @count($res); $i++) {
					$id_aluno = $res[$i]['id'];
					$nome_aluno = $res[$i]['nome'];
					echo "<option value='{$id_aluno}'>{$nome_aluno}</option>";
				}
				?>
			</select>
		</div>
	</div>

	<hr>
	<div id="listar-aulas-pendentes">
		<small class="text-muted">Selecione um aluno para listar as aulas pendentes.</small>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('.sel2').select2();

		$('#aluno_id').on('change', function() {
			listarPendentes();
		});
	});

	function listarPendentes() {
		var alunoId = $('#aluno_id').val();
		if (!alunoId) {
			$('#listar-aulas-pendentes').html('<small class="text-muted">Selecione um aluno para listar as aulas pendentes.</small>');
			return;
		}

		$.ajax({
			url: 'paginas/liberar_prova_aluno/listar.php',
			method: 'POST',
			data: { aluno_id: alunoId },
			dataType: 'html',
			success: function(result) {
				$('#listar-aulas-pendentes').html(result);
			},
			error: function(xhr) {
				$('#listar-aulas-pendentes').html('<small class="text-danger">Erro ao carregar aulas pendentes.</small>');
				console.error('Erro listar pendentes:', xhr.responseText);
			}
		});
	}

	function liberarAula(idAula, idAluno) {
		$.ajax({
			url: 'paginas/liberar_prova_aluno/liberar.php',
			method: 'POST',
			data: { id_aula: idAula, id_aluno: idAluno },
			dataType: 'text',
			success: function(msg) {
				if (msg.trim() === 'Liberado com Sucesso') {
					listarPendentes();
				} else {
					alert(msg);
				}
			},
			error: function(xhr) {
				alert('Erro ao liberar aula.');
				console.error('Erro liberar aula:', xhr.responseText);
			}
		});
	}
</script>
