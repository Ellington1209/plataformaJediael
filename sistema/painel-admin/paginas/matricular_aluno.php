<?php
require_once('../conexao.php');
require_once('verificar.php');
$pag = 'cursos';

if (@$_SESSION['nivel'] != 'Administrador' and @$_SESSION['nivel'] != 'Professor') {
  echo "<script>window.location='../index.php'</script>";
  exit();
}
?>

<div class="container mt-12">
  <div class="row">
    <div class="col-md-12 ">
      <h1 style="margin-bottom: 20px;">Matrículas</h1>
      <form action="processar_matricula.php" method="post" id="form-niceEdit">
        <div class="col-md-7">
          <div class="form-group">
            <label for="aluno">Selecione o Aluno:</label>
            <select class="form-control sel2" name="aluno" id="aluno" required style="width:100%;">
              <?php
              $sql = "SELECT id, nome FROM usuarios WHERE nivel = 'Aluno' ORDER BY nome ASC";
              $query = $pdo->query($sql);
              $res = $query->fetchAll(PDO::FETCH_ASSOC);
              foreach ($res as $aluno) {
              ?>
                <option value="<?php echo $aluno['id'] ?>"><?php echo $aluno['nome'] ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-7">
          <div class="form-group">
            <label for="curso">Selecione o curso:</label>
            <select class="form-control sel2" name="curso" id="curso" required style="width:100%;">
              <?php
              $query = $pdo->query("SELECT id, nome FROM cursos ORDER BY nome ASC");
              $cursos = $query->fetchAll(PDO::FETCH_ASSOC);
              foreach ($cursos as $curso) {
              ?>
                <option value="<?php echo $curso['id']; ?>"><?php echo $curso['nome']; ?></option>
              <?php } ?>
            </select>
          </div>
        </div>
        <div class="col-md-12">
          <button type="submit" class="btn btn-primary">Matricular</button>
        </div>
        <div class="col-md-12" style="margin-top:15px;">
          <span id="mensagem" style="margin-left: 10px;"></span>
        </div>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript">
  $(document).ready(function() {
    $('.sel2').select2();

    $("#form-niceEdit").submit(function(event) {
      event.preventDefault();
      var formData = new FormData(this);

      $.ajax({
        url: "paginas/processar_matricula.php",
        data: formData,
        method: 'POST',
        success: function(response, textStatus, xhr) {
          $('#mensagem').text('');
          if (xhr.status == 200) {
            $('#btn-fechar').click();
            if (response.includes("Este aluno já está matriculado neste curso.")) {
              $('#mensagem').addClass('text-danger').text(response);
            } else {
              $('#mensagem').addClass('text-success').text(response);
            }
          }
        },
        error: function(xhr, textStatus, errorThrown) {
          $('#mensagem').addClass('text-danger').text('Erro ao realizar a matrícula.');
        },
        complete: function() {
          // Remover a classe de erro se já foi adicionada
          $('#mensagem').removeClass('text-danger');
        },
        cache: false,
        contentType: false,
        processData: false
      });
    });
  });
</script>