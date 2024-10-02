<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class OverheadsModel extends Model{
    protected $table = 'tbl_models_overheads';
    protected $primaryKey = 'models_overheads_id';

    protected $allowedFields = [
        'models_overheads_id',
        'models_id',
        'models_overheads_insurance',
        'models_overheads_domain',
        'models_overheads_hosting',
        'models_overheads_gdpr',
        'models_overheads_phone',
        'models_overheads_mail',
        'models_overheads_banking',
        'models_overheads_tech',
        'models_overheads_software',
        'models_overheads_filing',
        'models_overheads_ops_rate',
        'models_overheads_ops_hours',
        'models_overheads_coms_rate',
        'models_overheads_coms_hours',
        'models_overheads_pub_rate',
        'models_overheads_pub_hours',
        'models_overheads_acc_rate',
        'models_overheads_acc_hours',
        'models_overheads_acc_yearly',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function overheadsWith($models_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_models_overheads t1')
                        ->join('tbl_models t2', 't2.models_id = t1.models_id')
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.models_id', $models_id);
        $query = $builder->get();
        return $query->getRowObject();
    }
}