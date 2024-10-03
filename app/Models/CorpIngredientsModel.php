<?php

namespace App\Models;

use CodeIgniter\Model;

class CorpIngredientsModel extends Model
{
    protected $table            = 'tbl_corporate_ingredients';
    protected $primaryKey       = 'corporate_ingredient_id';
    protected $allowedFields    = [
        'formula_ids',
        'suppliers',
        'order_qty',
        'prices',
        'models_id',
        'user_id',
    ];

    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
}
