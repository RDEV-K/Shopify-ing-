<?php

namespace App\Models;

use CodeIgniter\Model;

class CorpFormulasModel extends Model
{
    protected $table            = 'tbl_corporate_formula';
    protected $primaryKey       = 'corporate_formula_id';
    protected $allowedFields    = [
        'batch_qty',
        'unit_qty',
        'formula_id',
        'models_id',
        'created_at',
        'user_id',
    ];

    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
        
}
