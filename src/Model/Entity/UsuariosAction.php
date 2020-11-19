<?php
namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * UsuariosAction Entity
 *
 * @property int $id
 * @property int $usuario_id
 * @property string $table_name
 * @property int $id_item_modif
 * @property string $action
 * @property \Cake\I18n\FrozenTime $created
 *
 * @property \App\Model\Entity\Usuario $usuario
 */
class UsuariosAction extends Entity
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
        'usuario_id' => true,
        'table_name' => true,
        'id_item_modif' => true,
        'action' => true,
        'created' => true,
        'usuario' => true,
    ];
}
