<?php

namespace App\Models;

use CodeIgniter\Model;

class CorpMarketingModel extends Model
{
    protected $table            = 'tbl_models_marketing';
    protected $primaryKey       = 'model_marketing_id';
    protected $allowedFields    = [
        'models_id',
        'models_sales_pp', 
        'models_sales_tr', 
        'models_rrp', 
        'formu_id', 
        'models_li',
        'user_id',
    ];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
}
