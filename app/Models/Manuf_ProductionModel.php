<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class Manuf_ProductionModel extends Model{
    protected $table = 'tbl_manuf_production';
    protected $primaryKey = 'manuf_product_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'manuf_product_id',
        'manuf_product_date',
        'manuf_product_formula',
        'manuf_product_creator',
        'manuf_product_qty',
        'manuf_product_batch',
        'manuf_product_status',
        'manuf_comments',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function manufproductWith(){
            $db = db_connect();
            $builder = $db  ->table('tbl_manuf_production t1')
                            ->join('tbl_formula t2', 't2.formula_id = t1.manuf_product_formula',)
                            ->join('tbl_users t4', 't4.user_id = t1.user_id')
                            ->where('t1.user_id', $_SESSION['user_id'])
                            ->where('t2.user_id', $_SESSION['user_id'])
                            ->where('t4.user_id', $_SESSION['user_id'])
                            ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function manufproductWithBatch(){
        $db = db_connect();
        $builder = $db  ->table('tbl_manuf_production t1')
                       ->join('tbl_formula t2', 't2.formula_id = t1.manuf_product_formula',)
                        ->join('tbl_users t4', 't4.user_id = t1.user_id')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.manuf_product_status', 'Produced');
    $query = $builder->get();
    return $query->getResult();
    }

}