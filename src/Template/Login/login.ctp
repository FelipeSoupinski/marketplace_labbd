<?php $this->layout = 'login';  ?>
<p class="login-box-msg"><?= __('Entre com seu email e senha') ?></p>
<?= $this->Form->create('post') ?>
<div class="input-group mb-3">
  <label for="email">Email</label>
  <input type="email" name="email" class="form-control" placeholder="<?= __('ex: raimunda@email.com') ?>" id="email">
  <div class="input-group-append">
    <div class="input-group-text">
      <span class="fas fa-envelope"></span>
    </div>
  </div>
</div>
<div class="input-group mb-3">
  <label for="senha">Senha</label>
  <input type="password" name="senha" class="form-control" placeholder="********" id="senha">
  <div class="input-group-append">
    <div class="input-group-text">
      <span class="fas fa-lock"></span>
    </div>
  </div>
</div>
<button type="submit" class="btn btn-mega btn-block"><?= __('Entrar') ?></button>
<?= $this->Form->end() ?>
<hr>
<p class="mb-0">
  <?= $this->Html->link(__('Registrar-se'), ['action' => 'register']) ?>
</p>