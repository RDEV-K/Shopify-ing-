<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class CPNModel extends Model{
    protected $table = 'tbl_cpn';
    protected $primaryKey = 'cpn_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;

    protected $allowedFields = [
        'cpn_id',
        'cpn_date',
        'cpn_formula',
        'cpn_rp',
        'cpn_reporta',
        'cpn_reportb',
        'cpn_stability',
        'cpn_challenge',
        'cpn_status',
        'cpn_pif',
        'cpn_notification',
        'cpn_user',
        'invoice_file',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function cpnWith(){
        $db = db_connect();
        $builder = $db  ->table('tbl_cpn t1')
                        ->join('tbl_formula t2', 't2.formula_id = t1.cpn_formula')
                        ->join('tbl_users t4', 't4.user_id = t1.cpn_user')
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function cpnWithformula($cpn_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_cpn t1')
                        ->join('tbl_formula t2', 't2.formula_id = t1.cpn_formula')
                        ->join('tbl_users t4', 't4.user_id = t1.cpn_user')
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.cpn_id', $cpn_id);
        $query = $builder->get();
        return $query->getResult();
    }

}