<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class RdProductionModel extends Model{
    protected $table = 'tbl_rd_production';
    protected $primaryKey = 'product_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'product_id',
        'product_date',
        'product_formula',
        'product_creator',
        'product_qty',
        'product_batch',
        'product_status',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function productionWith(){

            $db = db_connect();
            $builder = $db  ->table('tbl_rd_production t1')
                            ->join('tbl_formula t2', 't2.formula_id = t1.product_formula',)
                            ->join('tbl_users t4', 't4.user_id = t1.user_id' )
                            ->where('t1.user_id', $_SESSION['user_id'])
                            ->where('t2.user_id', $_SESSION['user_id'])
                            ->where('t4.user_id', $_SESSION['user_id'])
                            ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function productionWithBatch(){
        $db = db_connect();
        $builder = $db  ->table('tbl_rd_production t1')
                        ->join('tbl_formula t2', 't2.formula_id = t1.product_formula',)
                        ->join('tbl_users t4', 't4.user_id = t1.user_id' )
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.product_status', 'Produced');
    $query = $builder->get();
    return $query->getResult();
}

    public function productionCheck(){

            $db = db_connect();
            $builder = $db  ->table('tbl_rd_production t1')
                            ->join('tbl_formula t2', 't2.formula_id = t1.product_formula',)
                            ->join('tbl_users t4', 't4.user_id = t1.user_id' )
                            ->where('t1.deleted_at IS NULL')
                            ->where('t1.user_id', $_SESSION['user_id'])
                            ->where('t2.user_id', $_SESSION['user_id'])
                            ->where('t4.user_id', $_SESSION['user_id'])
                            ->where(['product_status'=>"Produced"]);
        $query = $builder->get();
        return $query->getResult();
    }

}