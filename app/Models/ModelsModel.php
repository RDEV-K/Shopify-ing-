<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class ModelsModel extends Model{
    protected $table = 'tbl_models';
    protected $primaryKey = 'models_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'models_id',
        'models_date',
        'models_name',
        'models_qty',
        'models_spend',
        'models_revenue',
        'models_profit',
        'models_user',
        'models_status',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function modelswith(){
        $db = db_connect();
        $builder = $db  ->table('tbl_models t1')
                        ->join('tbl_corporate_formula t2', 't2.models_id = t1.models_id')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }
}