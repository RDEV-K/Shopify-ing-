<?php

namespace App\Models;

use CodeIgniter\Model;

class CorpPackagingModel extends Model
{
    protected $table            = 'tbl_models_packaging';
    protected $primaryKey       = 'model_package_id';
    protected $allowedFields    = [
        'models_id',
        'models_packaging_container_size',
        'models_packaging_container_qty',
        'models_packaging_container_supplier',
        'models_packaging_container_order',
        'models_packaging_container_price',
        'models_packaging_label_size',
        'models_packaging_label_qty',
        'models_packaging_label_supplier',
        'models_packaging_label_order',
        'models_packaging_label_price',
        'models_packaging_shipping_size',
        'models_packaging_shipping_qty',
        'models_packaging_shipping_supplier',
        'models_packaging_shipping_order',
        'models_packaging_shipping_price',
        'models_packaging_bags_size',
        'models_packaging_bags_qty',
        'models_packaging_bags_supplier',
        'models_packaging_bags_order',
        'models_packaging_bags_price',
        'models_packaging_notes_size',
        'models_packaging_notes_qty',
        'models_packaging_notes_supplier',
        'models_packaging_notes_order',
        'models_packaging_notes_price',
        'models_packaging_delivery_size',
        'models_packaging_delivery_qty',
        'models_packaging_delivery_supplier',
        'models_packaging_delivery_order',
        'models_packaging_delivery_price',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
}
