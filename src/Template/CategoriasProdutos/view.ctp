<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\CategoriasProduto $categoriasProduto
 */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Categorias Produto'), ['action' => 'edit', $categoriasProduto->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Categorias Produto'), ['action' => 'delete', $categoriasProduto->id], ['confirm' => __('Are you sure you want to delete # {0}?', $categoriasProduto->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Categorias Produtos'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Categorias Produto'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Categorias'), ['controller' => 'Categorias', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Categoria'), ['controller' => 'Categorias', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Produtos'), ['controller' => 'Produtos', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Produto'), ['controller' => 'Produtos', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="categoriasProdutos view large-9 medium-8 columns content">
    <h3><?= h($categoriasProduto->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('Categoria') ?></th>
            <td><?= $categoriasProduto->has('categoria') ? $this->Html->link($categoriasProduto->categoria->id, ['controller' => 'Categorias', 'action' => 'view', $categoriasProduto->categoria->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Produto') ?></th>
            <td><?= $categoriasProduto->has('produto') ? $this->Html->link($categoriasProduto->produto->id, ['controller' => 'Produtos', 'action' => 'view', $categoriasProduto->produto->id]) : '' ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($categoriasProduto->id) ?></td>
        </tr>
    </table>
</div>
