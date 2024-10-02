<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class Manuf_ProductionBatchModel extends Model{
    protected $table = 'tbl_manuf_production_batch';
    protected $primaryKey = 'manuf_production_batch_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'manuf_production_batch_id',
        'manuf_production_batch_production',
        'manuf_production_batch_ingredients',
        'manuf_production_batch_qty',
        'production_batch_ingredient_batch',
        'f_ingredients_id',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function productionWithIngredients($manuf_product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_manuf_production t1')
                        ->join('tbl_manuf_production_batch t2', 't2.manuf_production_batch_production  = t1.manuf_product_id')
                        ->join('tbl_ingredients_batch t4', 't4.ingredient_batch_id = t2.production_batch_ingredient_batch', 'LEFT')
                        ->join('tbl_ingredients t3', 't3.ingredient_id  = t2.manuf_production_batch_ingredients')
                        ->join('tbl_formula f', 'f.formula_id  = t1.manuf_product_formula')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL')
                        ->where('t3.deleted_at IS NULL')
                        ->where('t4.deleted_at IS NULL')
                        ->where('f.deleted_at IS NULL')
                        ->select('*,f.formula_rdplan as product_name,f.formula_version as product_version')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t3.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.manuf_product_id', $manuf_product_id);
        $query = $builder->get();
        return $query->getResultObject();
    }

    public function productionbatchWith($manuf_product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_manuf_production t1')
                        ->join('tbl_formula t2', 't2.formula_id = t1.manuf_product_formula')
                        ->join('tbl_users t6', 't6.user_id = t1.user_id')
                        ->join('tbl_formula_ingredients t3', 't3.f_ingredients_formula = t2.formula_id')
                        ->join('tbl_ingredients t4', 't4.ingredient_id = t3.f_ingredients_ingredients')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t6.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.manuf_product_id ', $manuf_product_id)
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL')
                        ->where('t3.deleted_at IS NULL')
                        ->where('t4.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function productionbatchProduced($manuf_product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_manuf_production_batch mpb')
                        ->join('tbl_manuf_production t1', 't1.manuf_product_id = mpb.manuf_production_batch_production')
                        ->join('tbl_formula t2', 't2.formula_id  = t1.manuf_product_formula')
                        ->join('tbl_users t6', 't6.user_id  = t1.user_id')
                        ->join('tbl_formula_ingredients t3', 't3.f_ingredients_formula  = t2.formula_id')
                        ->join('tbl_ingredients t4', 't4.ingredient_id  = mpb.manuf_production_batch_ingredients')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t6.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t1.manuf_product_id ', $manuf_product_id)
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL')
                        ->where('t3.deleted_at IS NULL')
                        ->where('t4.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }
    
    public function productionbatchGroupByBatchId($manuf_product_id) {
        $db = db_connect();
        // Assuming $db is your database connection and $_SESSION['user_id'] and $manuf_product_id are already set

        $builder = $db->table('tbl_manuf_production_batch mpb')
            ->select('mpb.*, t1.*, t2.*, t4.*') // Select specific columns as needed
            ->join('tbl_manuf_production t1', 't1.manuf_product_id = mpb.manuf_production_batch_production')
            ->join('tbl_formula t2', 't2.formula_id = t1.manuf_product_formula')
            ->join('tbl_users t6', 't6.user_id = t1.user_id')
            ->join('tbl_formula_ingredients t3', 't3.f_ingredients_formula = t2.formula_id')
            ->join('tbl_ingredients t4', 't4.ingredient_id = mpb.manuf_production_batch_ingredients')
            ->where('t1.user_id', $_SESSION['user_id'])
            ->where('t6.user_id', $_SESSION['user_id'])
            ->where('t4.user_id', $_SESSION['user_id'])
            ->where('t1.manuf_product_id', $manuf_product_id)
            ->where('t1.deleted_at IS NULL')
            ->where('t2.deleted_at IS NULL')
            ->where('t3.deleted_at IS NULL')
            ->where('t4.deleted_at IS NULL');

        // Group by the batch ID to get unique entries
        $query = $builder->groupBy('mpb.manuf_production_batch_id')->get();

        // Process the results
        $results = $query->getResult(); // Get the result set

        return $query->getResult();
    }

    
    public function productionbatchWithCertificate($manuf_product_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_manuf_production t1')
                        ->join('tbl_formula t2', 't2.formula_id  = t1.manuf_product_formula')
                        ->join('tbl_formula_ingredients t3', 't3.f_ingredients_formula  = t2.formula_id')
                        ->join('tbl_ingredients t4', 't4.ingredient_id  = t3.f_ingredients_ingredients')
                        ->join('tbl_rd_plan t5', 't5.plan_id  = t2.formula_rdplan')
                        ->join('tbl_users t6', 't6.user_id  = t1.user_id')
                        ->join('tbl_manuf_production_batch t7', 't7.manuf_production_batch_production = t1.manuf_product_id')
                        ->join('tbl_ingredients_batch t8', 't8.ingredient_id = t7.manuf_production_batch_ingredients')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t8.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t4.user_id', $_SESSION['user_id'])
                        ->where('t6.user_id', $_SESSION['user_id'])
                        ->where('t1.manuf_product_id ', $manuf_product_id)
                        ->where('t2.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

}