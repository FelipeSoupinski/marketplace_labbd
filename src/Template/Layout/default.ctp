<?php
/**
 * CakePHP(tm) : Rapid Development Framework (https://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (https://cakefoundation.org)
 * @link          https://cakephp.org CakePHP(tm) Project
 * @since         0.10.0
 * @license       https://opensource.org/licenses/mit-license.php MIT License
 */

$Description = 'Trabalho labbd';
?>
<!DOCTYPE html>
<html>
<head>
    <?= $this->Html->charset() ?>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        <?= $Description ?>:
        <?= $this->fetch('title') ?>
    </title>
    <?= $this->Html->meta('icon') ?>

    <?= $this->Html->css('plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css') ?>
    <?= $this->Html->css('plugins/toastr/toastr.css') ?>
    <?= $this->Html->css('plugins/adminlte/adminlte.css') ?>
    <?= $this->Html->css('base.css') ?>
    <?= $this->Html->css('style.css') ?>

    <?= $this->fetch('meta') ?>
    <?= $this->fetch('css') ?>
    <?= $this->fetch('script') ?>
</head>
<body>
    <nav class="top-bar expanded" data-topbar role="navigation">
        <ul class="title-area large-2 medium-2 columns">
            <li class="name">
                <h1><a href=""><?= $this->fetch('title') ?></a></h1>
            </li>
        </ul>
        <div class="top-bar-section">
            <ul class="left">
                <li><?= $this->Html->link('Usuarios', ['controller' => 'Usuarios']) ?></li>
            </ul>
            <ul class="left">
                <li><?= $this->Html->link('Lojas', ['controller' => 'Lojas']) ?></li>
            </ul>
            <ul class="left">
                <li><?= $this->Html->link('Pagamentos', ['controller' => 'Pagamentos']) ?></li>
            </ul>
            <ul class="left">
                <li><?= $this->Html->link('Produtos', ['controller' => 'Produtos']) ?></li>
            </ul>
            <ul class="left">
                <li><?= $this->Html->link('Categorias', ['controller' => 'Categorias']) ?></li>
            </ul>
            <ul class="left">
                <li><?= $this->Html->link('Logs', ['controller' => 'Logs']) ?></li>
            </ul>
            <ul class="right">
                <li><?= $this->Html->link('Logout', ['controller' => 'Login', 'action' => 'logout']) ?></li>
            </ul>
        </div>
    </nav>
    <div class="container clearfix">
        <?= $this->fetch('content') ?>
    </div>
    <footer>
    </footer>
</body>

<?= $this->Html->script('plugins/jquery/jquery.min.js') ?>
<?= $this->Html->script('plugins/bootstrap/bootstrap.bundle.min.js') ?>
<?= $this->Html->script('plugins/toastr/toastr.min.js') ?>
<?= $this->Html->script('plugins/adminlte/adminlte.min.js') ?>
<?= $this->Flash->render() ?>

</html>
