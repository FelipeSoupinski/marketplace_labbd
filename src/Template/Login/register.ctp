<?php $this->layout = 'login';  ?>
<p class="login-box-msg"><?= __('Crie sua conta') ?></p>
<?= $this->Form->create($usuario) ?>
<div class="form-group">
  <?= $this->Form->control('nome', ['class' => 'form-control', 'placeholder' => 'Nome', 'label' => false]) ?>
</div>
<div class="form-group">
  <?= $this->Form->control('email', ['class' => 'form-control', 'placeholder' => 'Email', 'label' => false]) ?>
</div>
<div class="form-group">
  <?= $this->Form->control('senha', ['type' => 'password', 'class' => 'form-control', 'placeholder' => 'Senha', 'label' => false]) ?>
</div>
<button type="submit" class="btn btn-mega btn-block"><?= __('Registrar') ?></button>
<?= $this->Form->end() ?>
<hr>
<p class="mb-1">
  <?= $this->Html->link(__('Já possui uma conta?'), ['action' => 'login']) ?>
</p>