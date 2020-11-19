<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * CategoriasProduto Entity
 *
 * @property int $id
 * @property int $categoria_id
 * @property int $produto_id
 *
 * @property \App\Model\Entity\Categoria $categoria
 * @property \App\Model\Entity\Produto $produto
 */
class CategoriasProduto extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array
     */
    protected $_accessible = [
        'categoria_id' => true,
        'produto_id' => true,
        'categoria' => true,
        'produto' => true,
    ];
}
