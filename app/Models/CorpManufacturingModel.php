<?php

namespace App\Models;

use CodeIgniter\Model;

class CorpManufacturingModel extends Model
{
    protected $table            = 'tbl_models_manufacturing';
    protected $primaryKey       = 'model_manufacturing_id';
    protected $allowedFields    = [
        'models_id',
        'model_manufacturing_productionfee',
        'model_manufacturing_deliveryfee',
        'model_manufacturing_bottlingfee',
        'models_igtp',
        'models_pktp',
        'models_pdtp',
        'models_igkp',
        'models_pkkp',
        'models_pdkp',
        'models_igup',
        'models_pkup',
        'models_pdup',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
}
