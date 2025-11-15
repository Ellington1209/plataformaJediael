<?php 
require_once("../../../conexao.php");
$tabela = 'matriculas';

@session_start();
$id_usuario = $_SESSION['id'];

$id_pacote = '%'.@$_POST['id'].'%';

echo <<<HTML
<small>
HTML;

$query = $pdo->query("SELECT * FROM $tabela where aluno = '$id_usuario'  ORDER BY id desc");
$res = $query->fetchAll(PDO::FETCH_ASSOC);
$total_reg = @count($res);
if($total_reg > 0){
echo <<<HTML
	<table class="table table-hover" id="tabela">
	<thead> 
	<tr> 
		<th>Curso</th>
		<th class="esc">Professor</th> 
		<th class="esc">Aulas</th> 
		<th class="esc">Progresso</th> 
		<th class="esc">Valor</th> 	
		<th class="esc">Data</th>
		<th class="esc">Status</th> 	
		<th>Ações</th>
	</tr> 
	</thead> 
	<tbody>
HTML;

for($i=0; $i < $total_reg; $i++){
	foreach ($res[$i] as $key => $value){}
	$id = $res[$i]['id'];
	$curso = $res[$i]['id_curso'];
	$aulas_concluidas = $res[$i]['aulas_concluidas'] ?? 0;	
	$valor = $res[$i]['subtotal'] ?? 0;	
	$data = $res[$i]['data'] ?? date('Y-m-d');	
	$status = $res[$i]['status'] ?? '';
	$professor = $res[$i]['professor'] ?? 0;	
	$pacote = $res[$i]['pacote'] ?? 'Não';
	$boleto = $res[$i]['boleto'] ?? '';
	$nota = $res[$i]['nota'] ?? '';


	if($boleto != "" and $status == 'Aguardando'){
		//require("../../../../pagamentos/boletos/notificacoes.php");
	}	

	if($pacote == 'Sim'){
		$tab = 'pacotes';
		$link = 'cursos-do-';
	}else{
		$tab = 'cursos';
		$link = 'curso-de-';
	}
	

	$query2 = $pdo->query("SELECT * FROM $tab where id = '$curso'");
	
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);

	

	if(@count($res2) > 0){
		$nome_curso = $res2[0]['nome'];
		$nome_url = $res2[0]['nome_url'];
		$url_do_curso = $link.$nome_url;
		$id_do_curso = $res2[0]['id'];
		$link = $res2[0]['link'];
		

		

	}else{
		$nome_curso = "";
	}
	


	$query2 = $pdo->query("SELECT * FROM professores where id = '$professor'");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);

	if(@count($res2) > 0){
		$nome_professor = $res2[0]['nome'];		
	}else{
		$nome_professor = "";
	}

	
	$query2 = $pdo->query("SELECT * FROM aulas where curso = '$curso'");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
	$aulas = @count($res2);


	//verificar se o curso já foi avaliado
	$query2 = $pdo->query("SELECT * FROM avaliacoes where curso = '$curso' and aluno = '$id_usuario' ");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
	$avaliacoes = @count($res2);
	if($avaliacoes > 0){
		$ocultar_avaliar = 'ocultar';
	}else{
		$ocultar_avaliar = '';
	}

	// Progresso será calculado via JavaScript
	$aulas_realmente_concluidas = $aulas_concluidas;
	
	// Calcular tempo restante total do curso (para tooltip do questionário)
	$tempo_restante_total_segundos = 0;
	$query_aulas_curso = $pdo->query("SELECT id, tempo_aula FROM aulas WHERE curso = '$curso'");
	$res_aulas_curso = $query_aulas_curso->fetchAll(PDO::FETCH_ASSOC);
	
	foreach($res_aulas_curso as $aula_curso) {
		$id_aula_curso = $aula_curso['id'];
		$tempo_aula_curso = (int)$aula_curso['tempo_aula']; // em minutos
		
		if($tempo_aula_curso > 0) {
			// Buscar registro na tabela tempo_aulas
			$query_tempo_curso = $pdo->query("SELECT tempo_restante, concluido FROM tempo_aulas 
			                                 WHERE id_aula = '$id_aula_curso' AND id_aluno = '$id_usuario'");
			$res_tempo_curso = $query_tempo_curso->fetchAll(PDO::FETCH_ASSOC);
			
			if(@count($res_tempo_curso) > 0) {
				$tempo_restante_aula = (int)$res_tempo_curso[0]['tempo_restante']; // em segundos
				$concluido_aula = (int)$res_tempo_curso[0]['concluido'];
				
				if($concluido_aula == 0) {
					// Se não está concluída, adicionar o tempo restante
					$tempo_restante_total_segundos += $tempo_restante_aula;
				}
			} else {
				// Se não tem registro, a aula não foi iniciada, então o tempo total é o tempo da aula
				$tempo_restante_total_segundos += $tempo_aula_curso * 60; // converter minutos para segundos
			}
		}
	}
	
	// Converter para minutos e formatar
	$tempo_restante_total_minutos = round($tempo_restante_total_segundos / 60, 1);
	$tempo_restante_formatado = '';
	if($tempo_restante_total_minutos >= 60) {
		$horas = floor($tempo_restante_total_minutos / 60);
		$minutos = round($tempo_restante_total_minutos % 60);
		$tempo_restante_formatado = $horas . 'h ' . $minutos . 'min';
	} else {
		$tempo_restante_formatado = $tempo_restante_total_minutos . 'min';
	}



	if($status == 'Aguardando'){
		$excluir = '';
		$icone = 'fa-square';		
		$classe_square = 'text-danger';
		$classe_nome = 'text-muted';
		$ocultar_aulas = 'ocultar';
		$ocultar_pagar = '';
		$classe_progress = '';
		$icones_finalizados = 'ocultar';
	}else if($status == 'Finalizado'){
		$excluir = 'ocultar';
		$icone = 'fa-square';		
		$classe_square = 'azul';
		$classe_nome = 'verde_claro';
		$ocultar_aulas = '';
		$ocultar_pagar = 'ocultar';
		$classe_progress = '#015e23';
		$icones_finalizados = '';
	}
	else{
		$excluir = 'ocultar';
		$icone = 'fa-square';		
		$classe_square = 'verde';
		$classe_nome = 'verde_claro';
		$ocultar_aulas = '';
		$ocultar_pagar = 'ocultar';
		$classe_progress = '';
		$icones_finalizados = 'ocultar';
	}


	
	//FORMATAR VALORES
	$valor = $valor ?? 0; // Garantir que não seja null
	$valorF = $valor > 0 ? number_format($valor, 2, ',', '.') : '0,00';
	$dataF = implode('/', array_reverse(explode('-', $data)));


$classe_quest = '';

	//pegar o id da matricula
$query_m = $pdo->query("SELECT * FROM matriculas where id = '$id'");
$res_m = $query_m->fetchAll(PDO::FETCH_ASSOC);
$id_mat = $res_m[0]['id'];
$aulas_conc = $aulas_realmente_concluidas; // Usar aulas realmente concluídas
$status_mat = $res_m[0]['status'];

//verificar total de aulas do curso
$query_m = $pdo->query("SELECT * FROM aulas where curso = '$curso'");
$res_m = $query_m->fetchAll(PDO::FETCH_ASSOC);
$total_aulas = @count($res_m);

// Buscar configuração do questionário e média
$query_config = $pdo->query("SELECT * FROM config");
$res_config = $query_config->fetchAll(PDO::FETCH_ASSOC);
$questionario_config = @count($res_config) > 0 ? $res_config[0]['questionario'] : 'Não';
$media_config = @count($res_config) > 0 ? $res_config[0]['media'] : 60;

$quest_disabled = '';
$quest_tooltip = '';
$quest_style = '';

if($questionario_config == 'Sim'){
	// Verificar se todas as aulas foram concluídas
	if($status_mat != 'Finalizado' and $total_aulas == $aulas_realmente_concluidas){
		$classe_quest = '';
		$quest_disabled = '';
		$quest_tooltip = 'Iniciar Questionário';
	} else {
		// Desabilitar se não estiver 100% concluído
		$classe_quest = '';
		$quest_disabled = 'disabled';
		$quest_style = 'opacity: 0.5; cursor: not-allowed;';
		$quest_tooltip = 'Você deve concluir a matéria para fazer a prova, falta assistir ' . $tempo_restante_formatado;
	}
} else {
	$classe_quest = 'ocultar';
}

if($nota <= $media_config and $nota != ""){
	$classe_nota = '';
}else{
	$classe_nota = 'ocultar';
}

	
	
echo <<<HTML
<tr> 
		<td>		
		<a href="#" onclick="abrirAulas('{$id}', '{$nome_curso}', '{$aulas}', '{$id_do_curso}', '{$link}')" class="{$classe_nome} $ocultar_aulas">	
		{$nome_curso}
		<small><i class="fa fa-video-camera text-dark"></i>	</small>
		</a>

			
		
		
		<form method="post" action="../../{$url_do_curso}" target="_blank" class="{$ocultar_pagar}">

		<span class="text-muted">{$nome_curso}</span>
							
									<button  type="submit" style="background-color: transparent;  border:none!important;"><i class="fa fa-money text-danger" ></i><span class="text-danger" style="margin-left:2px">Pagar</span>
									</button>
									<input type="hidden" name="painel_aluno" value="sim">
									

								
							</form>

		

		</td> 		
		<td class="esc">{$nome_professor}</td>		
		<td class="esc"><span class="aulas-contador-{$id}">{$aulas_realmente_concluidas}</span> / {$aulas}</td>
		<td class="esc">
			<div class="progress" style="height:15px; ">
  				<div class="progress-bar progresso-curso-{$id}" role="progressbar" style="width: 0%; background: {$classe_progress}" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" data-curso="{$curso}">0%</div>
			</div>
		</td>
		<td class="esc">R$ {$valorF} </td>
		<td class="esc">{$dataF}</td>
		<td class="esc"><i class="fa {$icone} $classe_square"></i></td>				
		<td>
		
			<li class="dropdown head-dpdn2 {$excluir}" style="display: flex;">
			<a href="#" class="dropdown-toggle {$excluir}" data-toggle="dropdown" aria-expanded="false"><big><i class="fa fa-trash-o text-danger"></i></big></a>

			<ul class="dropdown-menu" style="margin-left:-230px;">
			<li>
			<div class="notification_desc2">
			<p>Confirmar Exclusão? <a href="#" onclick="excluir('{$id}')"><span class="text-danger">Sim</span></a></p>
			</div>
			</li>										
			</ul>
			</li>

			<form method="post" action="../rel/rel_certificado.php" target="_blank" class="{$icones_finalizados}">		

			<input type="hidden" name="id_mat" value="{$id}">

			<big><a class="{$icones_finalizados} {$ocultar_avaliar}" href="#" onclick="avaliar('{$curso}', '{$nome_curso}')" title="Avaliar Curso"><i class="fa fa-star amarelo"></i></a></big>

			<big><a class="{$classe_quest} quest-link-{$id}" href="#" onclick="if(!$(this).hasClass('disabled')) { questionario('{$curso}', '{$nome_curso}', '{$id}'); } return false;" title="{$quest_tooltip}" style="{$quest_style}" data-tempo-restante="{$tempo_restante_total_segundos}" data-curso-id="{$curso}"><i class="fa fa-question-circle-o verde"></i></a></big>

			</form>

			
			<small><span class="text-danger {$classe_nota}">Nota: {$nota}%</span></small>


		</td>
</tr>
HTML;

}

echo <<<HTML
</tbody>
<small><div align="center" id="mensagem-excluir"></div></small>
</table>	
HTML;

}else{
	echo 'Não possui nenhum curso matriculado!';
}
echo <<<HTML
</small>
HTML;


?>


<script type="text/javascript">
	// Função para calcular o progresso de um curso específico
	function calcularProgresso(idCurso, $barraElemento) {
		$.ajax({
			url: 'paginas/' + pag + "/calcular-progresso.php",
			method: 'POST',
			data: {
				id_curso: idCurso
			},
			dataType: "json",
			success: function(result) {
				if(result.erro) {
					return;
				}
				
				var porcentagem = result.porcentagem || 0;
				var aulasConcluidas = result.aulas_concluidas || 0;
				var totalAulas = result.total_aulas || 0;
				var tempoRestanteSegundos = result.tempo_restante_segundos || 0;
				
				// Atualizar barra de progresso
				if($barraElemento) {
					$barraElemento.css('width', porcentagem + '%');
					$barraElemento.attr('aria-valuenow', porcentagem);
					$barraElemento.text(porcentagem.toFixed(2) + '%');
					
					// Atualizar contador de aulas
					var $tr = $barraElemento.closest('tr');
					if($tr.length) {
						// Procurar qualquer contador de aulas na linha
						var $contador = $tr.find('[class*="aulas-contador-"]');
						if($contador.length) {
							$contador.text(aulasConcluidas);
						}
						
						// Atualizar status do questionário
						var $questLink = $tr.find('[class*="quest-link-"]');
						if($questLink.length) {
							// Atualizar data-tempo-restante com o valor do servidor
							$questLink.data('tempo-restante', tempoRestanteSegundos);
							
							if(porcentagem >= 100 && aulasConcluidas >= totalAulas) {
								// Curso concluído - habilitar questionário
								$questLink.removeClass('disabled');
								$questLink.css('opacity', '1');
								$questLink.css('cursor', 'pointer');
								$questLink.attr('title', 'Iniciar Questionário');
							} else {
								// Curso não concluído - desabilitar questionário
								$questLink.addClass('disabled');
								$questLink.css('opacity', '0.5');
								$questLink.css('cursor', 'not-allowed');
								
								// Formatar tempo restante
								var tempoRestanteMinutos = Math.round(tempoRestanteSegundos / 60 * 10) / 10;
								var tempoFormatado = '';
								
								if(tempoRestanteMinutos >= 60) {
									var horas = Math.floor(tempoRestanteMinutos / 60);
									var minutos = Math.round(tempoRestanteMinutos % 60);
									tempoFormatado = horas + 'h ' + minutos + 'min';
								} else {
									tempoFormatado = tempoRestanteMinutos + 'min';
								}
								
								$questLink.attr('title', 'Você deve concluir a matéria para fazer a prova, falta assistir ' + tempoFormatado);
							}
						}
					}
				}
			},
			error: function() {
				// Em caso de erro, manter 0%
			}
		});
	}
	
	// Função global para calcular o progresso de todos os cursos
	if(typeof window.calcularProgressoCursos === 'undefined') {
		window.calcularProgressoCursos = function() {
			$('[class*="progresso-curso-"]').each(function() {
				var $barra = $(this);
				var idCurso = $barra.data('curso');
				
				if(idCurso) {
					calcularProgresso(idCurso, $barra);
				}
			});
		};
	}

	$(document).ready( function () {
		$('#tabela').DataTable({
			"ordering": false,
			"stateSave": true,
		});
		$('#tabela_filter label input').focus();
		
		// Calcular progresso de todos os cursos após um pequeno delay para garantir que o DOM está pronto
		setTimeout(function() {
			if(typeof window.calcularProgressoCursos === 'function') {
				window.calcularProgressoCursos();
			}
		}, 100);
	} );

</script>

