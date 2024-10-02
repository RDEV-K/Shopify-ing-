<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class RdProduction_BatchModel extends Model{
    protected $table = 'tbl_rd_production_batch';
    protected $primaryKey = 'production_batch_id';
    
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;

    protected $allowedFields = [
        'production_batch_id',
        'production_batch_production',
        'production_batch_ingredients',
        'production_batch_qty',
        'production_batch_ingredient_batch',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
    
    public function productionWithIngredients($product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_rd_production t1')
                        ->join('tbl_rd_production_batch t2', 't2.production_batch_production  = t1.product_id')
                        ->join('tbl_ingredients t3', 't3.ingredient_id  = t2.production_batch_ingredients')
                        ->join('tbl_ingredients_batch t4', 't4.ingredient_batch_id = t2.production_batch_ingredient_batch')
                        ->join('tbl_suppliers t5', 't4.ingredient_batch_supplier_id  = t5.supplier_id')
                        ->select('t4.ingredient_batch_no, t3.ingredient_name, t5.supplier_name, t1.product_id, t3.ingredient_id')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t3.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.product_id ', $product_id);
                $query = $builder->get();
        return $query->getResultObject();

    }
    
    public function productionbatchWith($product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_rd_production t1')
                        ->join('tbl_formula t2', 't2.formula_id  = t1.product_formula')
                        ->join('tbl_formula_ingredients t3', 't3.f_ingredients_formula  = t2.formula_id')
                        ->join('tbl_ingredients t4', 't4.ingredient_id  = t3.f_ingredients_ingredients')
                        ->join('tbl_users t6', 't6.user_id = t1.user_id')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t6.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.product_id ', $product_id);
        $query = $builder->get();
        return $query->getResult();
    }

    public function batchWithbatch($ingredient_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_rd_production_batch t1')
                        ->join('tbl_ingredients t2', 't2.ingredient_id = t1.production_batch_ingredients' )
                        ->join('tbl_ingredients_batch t3', 't3.ingredient_batch_id = t1.production_batch_ingredient_batch')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t3.user_id', $_SESSION['user_id'])
                        ->where('t2.ingredient_id ', $ingredient_id);
        $query = $builder->get();
        return $query->getResult();
    }


}