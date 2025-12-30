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
	<style>
		#tabela thead th,
		#tabela tbody td {
			vertical-align: middle !important;
		}
		#tabela tbody td {
			padding: 12px 8px !important;
		}
		#tabela tbody td:last-child {
			white-space: nowrap;
		}
	</style>
	<table class="table table-hover" id="tabela">
	<thead> 
	<tr> 
		<th style="vertical-align: middle;">Curso</th>
		<th class="esc" style="vertical-align: middle;">Professor</th> 
		<th class="esc" style="vertical-align: middle;">Aulas</th> 
		<th style="vertical-align: middle;">Progresso</th> 
		<th class="esc" style="vertical-align: middle;">Valor</th> 	
		<th class="esc" style="vertical-align: middle;">Data</th>
		<th class="esc" style="vertical-align: middle;">Status</th> 	
		<th style="vertical-align: middle;">Ações</th>
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

	
	// Contar aulas considerando sessões (mesma lógica de listar-aulas.php)
	$query_sessoes = $pdo->query("SELECT * FROM sessao where curso = '$curso'");
	$res_sessoes = $query_sessoes->fetchAll(PDO::FETCH_ASSOC);
	$tem_sessoes = @count($res_sessoes) > 0;

	if($tem_sessoes){
		// Contar aulas que pertencem a sessões válidas
		$query_aulas_com_sessao = $pdo->query("SELECT a.* FROM aulas a 
		                                        INNER JOIN sessao s ON a.sessao = s.id 
		                                        WHERE a.curso = '$curso' AND s.curso = '$curso' 
		                                        AND a.sessao IS NOT NULL AND a.sessao != 0");
		$res_aulas_com_sessao = $query_aulas_com_sessao->fetchAll(PDO::FETCH_ASSOC);
		$total_com_sessao = @count($res_aulas_com_sessao);

		// Contar aulas sem sessão
		$query_aulas_sem_sessao = $pdo->query("SELECT * FROM aulas where curso = '$curso' and (sessao = 0 OR sessao IS NULL)");
		$res_aulas_sem_sessao = $query_aulas_sem_sessao->fetchAll(PDO::FETCH_ASSOC);
		$total_sem_sessao = @count($res_aulas_sem_sessao);

		$aulas = $total_com_sessao + $total_sem_sessao;
	}else{
		$query2 = $pdo->query("SELECT * FROM aulas where curso = '$curso'");
		$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
		$aulas = @count($res2);
	}


	//verificar se o curso já foi avaliado
	$query2 = $pdo->query("SELECT * FROM avaliacoes where curso = '$curso' and aluno = '$id_usuario' ");
	$res2 = $query2->fetchAll(PDO::FETCH_ASSOC);
	$avaliacoes = @count($res2);
	
	// Sempre mostrar, mas desabilitar se já foi avaliado ou se não estiver finalizado
	$avaliar_disabled = '';
	$avaliar_style = '';
	$avaliar_tooltip = 'Avaliar Curso';
	if($avaliacoes > 0 || $status != 'Finalizado'){
		$avaliar_disabled = 'disabled';
		$avaliar_style = 'opacity: 0.5; cursor: not-allowed;';
		if($avaliacoes > 0){
			$avaliar_tooltip = 'Curso já foi avaliado';
		} else {
			$avaliar_tooltip = 'Curso precisa estar finalizado para avaliar';
		}
	}

	// Progresso será calculado via JavaScript
	$aulas_realmente_concluidas = $aulas_concluidas;
	
	// Calcular tempo restante total do curso (para tooltip do questionário) usando timestamp
	$tempo_restante_total_segundos = 0;
	$timestamp_atual = time();
	$query_aulas_curso = $pdo->query("SELECT id, tempo_aula FROM aulas WHERE curso = '$curso'");
	$res_aulas_curso = $query_aulas_curso->fetchAll(PDO::FETCH_ASSOC);
	
	foreach($res_aulas_curso as $aula_curso) {
		$id_aula_curso = $aula_curso['id'];
		$tempo_aula_curso_minutos = (int)$aula_curso['tempo_aula']; // em minutos
		$tempo_aula_curso_segundos = $tempo_aula_curso_minutos * 60;
		
		if($tempo_aula_curso_minutos > 0) {
			// Buscar registro na tabela tempo_aulas usando timestamp_inicio
			$query_tempo_curso = $pdo->query("SELECT timestamp_inicio, data_criacao, concluido FROM tempo_aulas 
			                                 WHERE id_aula = '$id_aula_curso' AND id_aluno = '$id_usuario'");
			$res_tempo_curso = $query_tempo_curso->fetchAll(PDO::FETCH_ASSOC);
			
			if(@count($res_tempo_curso) > 0) {
				$concluido_aula = (int)$res_tempo_curso[0]['concluido'];
				$timestamp_inicio = $res_tempo_curso[0]['timestamp_inicio'];
				$data_criacao = $res_tempo_curso[0]['data_criacao'];
				
				if($concluido_aula == 0) {
					// Se não tem timestamp_inicio, usar data_criacao como fallback
					if(!$timestamp_inicio || $timestamp_inicio == 0) {
						if($data_criacao) {
							$timestamp_inicio = strtotime($data_criacao);
						}
					}
					
					if($timestamp_inicio && $timestamp_inicio > 0) {
						// Calcular timestamp de liberação
						$timestamp_liberacao = $timestamp_inicio + $tempo_aula_curso_segundos;
						
						// Calcular tempo restante
						if($timestamp_atual < $timestamp_liberacao) {
							$tempo_restante_aula = $timestamp_liberacao - $timestamp_atual;
							$tempo_restante_total_segundos += $tempo_restante_aula;
						}
						// Se já passou o tempo, não adiciona nada (aula já deveria estar concluída)
					} else {
						// Se não tem registro de início, a aula não foi iniciada, então o tempo total é o tempo da aula
						$tempo_restante_total_segundos += $tempo_aula_curso_segundos;
					}
				}
			} else {
				// Se não tem registro, a aula não foi iniciada, então o tempo total é o tempo da aula
				$tempo_restante_total_segundos += $tempo_aula_curso_segundos;
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


	//pegar o id da matricula
$query_m = $pdo->query("SELECT * FROM matriculas where id = '$id'");
$res_m = $query_m->fetchAll(PDO::FETCH_ASSOC);
$id_mat = $res_m[0]['id'];
$aulas_conc = $aulas_realmente_concluidas; // Usar aulas realmente concluídas
$status_mat = $res_m[0]['status'];

//verificar total de aulas do curso (usar mesma lógica de contagem)
$total_aulas = $aulas; // Já foi calculado acima considerando sessões

// Buscar configuração do questionário e média
$query_config = $pdo->query("SELECT * FROM config");
$res_config = $query_config->fetchAll(PDO::FETCH_ASSOC);
$questionario_config = @count($res_config) > 0 ? $res_config[0]['questionario'] : 'Não';
$media_config = @count($res_config) > 0 ? $res_config[0]['media'] : 60;

// Sempre mostrar questionário, mas desabilitar quando necessário
$quest_disabled = '';
$quest_tooltip = '';
$quest_style = '';

if($questionario_config == 'Sim'){
	// Verificar se todas as aulas foram concluídas (permitir mesmo se status já for Finalizado)
	if($total_aulas > 0 && $total_aulas == $aulas_realmente_concluidas){
		$quest_disabled = '';
		$quest_style = '';
		$quest_tooltip = 'Iniciar Questionário';
	} else {
		// Desabilitar se não estiver 100% concluído
		$quest_disabled = 'disabled';
		$quest_style = 'opacity: 0.5; cursor: not-allowed;';
		$quest_tooltip = 'Você deve concluir a matéria para fazer a prova, falta assistir ' . $tempo_restante_formatado;
	}
} else {
	// Questionário desabilitado no sistema
	$quest_disabled = 'disabled';
	$quest_style = 'opacity: 0.5; cursor: not-allowed;';
	$quest_tooltip = 'Questionário não está habilitado para este curso';
}

// Validar se deve mostrar nota
if($nota <= $media_config and $nota != ""){
	$classe_nota = '';
	$nota_texto = "Nota: {$nota}%";
}else{
	$classe_nota = 'ocultar';
	$nota_texto = '';
}

	
	
echo <<<HTML
<tr> 
		<td style="vertical-align: middle;">		
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
		<td class="esc" style="vertical-align: middle;">{$nome_professor}</td>		
		<td class="esc" style="vertical-align: middle; text-align: center;"><span class="aulas-contador-{$id}">{$aulas_realmente_concluidas}</span> / {$aulas}</td>
		<td style="vertical-align: middle;">
			<div class="progress" style="height:15px; margin: 0;">
  				<div class="progress-bar progresso-curso-{$id}" role="progressbar" style="width: 0%; background: {$classe_progress}" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" data-curso="{$curso}">0%</div>
			</div>
		</td>
		<td class="esc" style="vertical-align: middle;">R$ {$valorF}</td>
		<td class="esc" style="vertical-align: middle;">{$dataF}</td>
		<td class="esc" style="vertical-align: middle; text-align: center;"><i class="fa {$icone} $classe_square"></i></td>				
		<td style="vertical-align: middle;">
		
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

			<big><a href="#" onclick="if('{$avaliar_disabled}' != 'disabled') { avaliar('{$curso}', '{$nome_curso}'); } else { alert('{$avaliar_tooltip}'); } return false;" title="{$avaliar_tooltip}" style="{$avaliar_style}; min-width: 30px; min-height: 30px; display: inline-block; text-align: center;"><i class="fa fa-star amarelo"></i></a></big>

			<big><a class="quest-link-{$id}" href="javascript:void(0);" title="{$quest_tooltip}" style="{$quest_style}; min-width: 30px; min-height: 30px; display: inline-block; text-align: center;" data-tempo-restante="{$tempo_restante_total_segundos}" data-curso-id="{$curso}" data-quest-tooltip="{$quest_tooltip}" data-quest-disabled="{$quest_disabled}" data-curso-nome="{$nome_curso}" data-mat-id="{$id}"><i class="fa fa-question-circle-o verde"></i></a></big>

			<form method="post" action="../rel/rel_certificado.php" target="_blank" class="{$icones_finalizados}">		
			<input type="hidden" name="id_mat" value="{$id}">
			</form>

			
			<small><span class="text-danger {$classe_nota}">{$nota_texto}</span></small>


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
							
							if(porcentagem >= 100 && aulasConcluidas >= totalAulas && totalAulas > 0) {
								// Curso concluído - habilitar questionário
								$questLink.removeClass('disabled');
								$questLink.removeAttr('disabled'); // Remover atributo disabled
								$questLink.css('opacity', '1');
								$questLink.css('cursor', 'pointer');
								$questLink.attr('title', 'Iniciar Questionário');
								$questLink.attr('data-quest-tooltip', 'Iniciar Questionário');
								$questLink.attr('data-quest-disabled', ''); // Atualizar data attribute
							} else {
								// Curso não concluído - desabilitar questionário
								$questLink.addClass('disabled');
								$questLink.attr('disabled', 'disabled'); // Adicionar atributo disabled
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
								
								var tooltipText = 'Você deve concluir a matéria para fazer a prova, falta assistir ' + tempoFormatado;
								$questLink.attr('title', tooltipText);
								$questLink.attr('data-quest-tooltip', tooltipText);
								$questLink.attr('data-quest-disabled', 'disabled'); // Atualizar data attribute
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
		// Configurar DataTable com responsividade para mobile
		$('#tabela').DataTable({
			"ordering": false,
			"stateSave": true,
			"responsive": true,
			"scrollX": true,
			"pageLength": 10,
			"autoWidth": false,
			"columnDefs": [
				{ "width": "auto", "targets": 0 },
				{ "width": "auto", "targets": "_all" }
			]
		});
		
		// Garantir alinhamento das células após inicialização do DataTable
		setTimeout(function() {
			$('#tabela thead th, #tabela tbody td').css({
				'vertical-align': 'middle',
				'text-align': 'left'
			});
			$('#tabela tbody td:last-child').css('text-align', 'left');
		}, 100);
		
		$('#tabela_filter label input').focus();
		
		// Event listener para botão de questionário - compatível com iOS/iPhone
		// Usar off() primeiro para evitar múltiplos listeners
		$(document).off('click touchstart', '[class*="quest-link-"]').on('click touchstart', '[class*="quest-link-"]', function(e) {
			e.preventDefault();
			e.stopPropagation();
			
			var $this = $(this);
			var isDisabled = $this.attr('data-quest-disabled') == 'disabled' || $this.hasClass('disabled') || $this.attr('disabled') == 'disabled';
			
			if(isDisabled) {
				// Se estiver desabilitado, mostrar tooltip
				var tooltip = $this.attr('data-quest-tooltip') || $this.attr('title') || 'Você deve concluir a matéria para fazer a prova';
				alert(tooltip);
				return false;
			} else {
				// Se estiver habilitado, abrir modal de questionário
				var curso = $this.attr('data-curso-id');
				var nome = $this.attr('data-curso-nome');
				var id = $this.attr('data-mat-id');
				
				if(curso && nome && id) {
					questionario(curso, nome, id);
				} else {
					console.error('DEBUG - Dados incompletos para abrir questionário:', {curso: curso, nome: nome, id: id});
				}
				return false;
			}
		});
		
		// Calcular progresso de todos os cursos após um pequeno delay para garantir que o DOM está pronto
		setTimeout(function() {
			if(typeof window.calcularProgressoCursos === 'function') {
				window.calcularProgressoCursos();
			}
		}, 100);
	} );

</script>

