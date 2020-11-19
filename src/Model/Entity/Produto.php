<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Produto Entity
 *
 * @property int $id
 * @property string $nome
 * @property string $descricao
 * @property string $imagem
 * @property float $preco
 * @property int|null $loja_id
 * @property \Cake\I18n\FrozenTime $created
 * @property \Cake\I18n\FrozenTime|null $modified
 *
 * @property \App\Model\Entity\Loja $loja
 * @property \App\Model\Entity\Categoria[] $categorias
 */
class Produto extends Entity
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
        'nome' => true,
        'descricao' => true,
        'imagem' => true,
        'preco' => true,
        'loja_id' => true,
        'created' => true,
        'modified' => true,
        'loja' => true,
        'categorias' => true,
    ];
}
