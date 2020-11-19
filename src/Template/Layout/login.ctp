<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Trabalho LBD | Log in</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <?= $this->Html->css('plugins/fontawesome/all.min') ?>
  <!-- icheck bootstrap -->
  <?= $this->Html->css('plugins/icheck-bootstrap/icheck-bootstrap.min.css') ?>
  <!-- SweetAlert2 -->
  <?= $this->Html->css('plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') ?>
  <!-- Toastr -->
  <?= $this->Html->css('plugins/toastr/toastr.css') ?>
  <!-- AdminLTE style -->
  <?= $this->Html->css('plugins/adminlte/adminlte.css') ?>
  <!-- Main style -->
  <?= $this->Html->css('login.css') ?>
</head>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
    </div>
    <!-- /.login-logo -->
    <div class="card">
      <div class="row">
        <div class="col-7 login-bg">
          <div class="login-bg-filter"></div>
        </div>
        <div class="col-5 card-body login-card-body">
          <?= $this->fetch('content') ?>
        </div>
      </div>
      <!-- /.login-card-body -->
    </div>
  </div>
  <!-- /.login-box -->
</body>

<!-- jQuery -->
<?= $this->Html->script('plugins/jquery/jquery.min.js') ?>
<!-- Bootstrap 4 -->
<?= $this->Html->script('plugins/bootstrap/bootstrap.bundle.min.js') ?>
<!-- Toastr -->
<?= $this->Html->script('plugins/toastr/toastr.min.js') ?>
<!-- AdminLTE App -->
<?= $this->Html->script('plugins/adminlte/adminlte.min.js') ?>
<!-- Flash render -->
<?= $this->Flash->render() ?>

</html>