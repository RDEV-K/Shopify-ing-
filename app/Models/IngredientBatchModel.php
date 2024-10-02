<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class IngredientBatchModel extends Model{
    protected $table = 'tbl_ingredients_batch';
    protected $primaryKey = 'ingredient_batch_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'ingredient_batch_id',
        'ingredient_id',
        'ingredient_batch_no',
        'ingredient_batch_expiry',
        'ingredient_batch_supplier_id',
        'user_id',
        'ingredient_batch_qty',
        'delivery_id',
        'date_added',
        'invoice_file',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function ingredientsWith(){
        $db = db_connect();
        $builder = $db  ->table('tbl_ingredients t1')
                        ->join('tbl_ingredients_batch t2', 't2.ingredient_id = t1.ingredient_id')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function batchwithIng($ingredient_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_ingredients t1')
                        ->join('tbl_ingredients_batch t2', 't2.ingredient_id = t1.ingredient_id')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.ingredient_id', $ingredient_id)
                        ->where('t2.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    /*
    public function stockWithDelivery($stock_id) {
        $db = db_connect();
        $builder = $db->table('tbl_stockcheck_delivery_items itm')
                ->select('itm.delivery_item_qty')
                ->where('itm.delivery_ingredient_item',$stock_id);
        $query = $builder->get();
        return $query->getResult();
    }*/

    public function ingredientsBatch($ingredientbatch_id = null) {
        $db = db_connect();
        $builder = $db->table('tbl_ingredients_batch in1')
                        ->join('tbl_ingredients in2', 'in1.ingredient_id = in2.ingredient_id')
                        ->where('in1.user_id', $_SESSION['user_id'])
                        ->where('in2.user_id', $_SESSION['user_id'])
                        ->select('in1.*,in2.ingredient_name,in2.ingredient_category');
        if($ingredientbatch_id != null) {
            $builder
                        ->where('in1.deleted_at IS NULL')
                        ->where('in1.ingredient_batch_id', $ingredientbatch_id);
        }
        $query = $builder->get();
        return $query->getResultObject();
    }

    public function ingredientsWithBatch(){
        $db = db_connect();
        $builder = $db  ->table('tbl_ingredients t1')
                        ->join('tbl_ingredients_batch t2', 't2.ingredient_id = t1.ingredient_id')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function batchCertificateM($db,$batch_id = null) {
        $builder = $db->table('tbl_manuf_production_batch mpb')
                        ->join('tbl_ingredients in', 'mpb.manuf_production_batch_ingredients = in.ingredient_id')
                        ->join('tbl_manuf_production mp','mpb.manuf_production_batch_production = mp.manuf_product_id')
                        ->join('tbl_ingredients_batch inb','mpb.production_batch_ingredient_batch = inb.ingredient_batch_id')
                        ->join('tbl_formula f','f.formula_id = mp.manuf_product_formula')
                        ->join('tbl_users u','u.user_id = mp.user_id')
                        ->select('
                                    inb.ingredient_batch_id as ID,
                                    inb.date_added as date,
                                    inb.ingredient_batch_no as batch,
                                    inb.ingredient_batch_qty as qty,
                                    inb.invoice_file as file,
                                    u.user_first_name as creatorF,
                                    u.user_last_name as creatorL,
                                    in.ingredient_name as product,
                                    f.formula_version as version

                                ')
                        ->where('mpb.deleted_at IS NULL')
                        ->where('u.user_id', $_SESSION['user_id'])
                        ->where('mpb.user_id', $_SESSION['user_id'])
                        ->where('mp.manuf_product_status','Produced');
                        
                        
        if($batch_id) {
            $builder = $builder->where('inb.ingredient_batch_no', $batch_id);
        }
        return $builder->get();        
    }

    public function batchCertificateRd($db,$batch_id = null) {
        
        $builder = $db->table('tbl_rd_production_batch rpb')
                        ->join('tbl_ingredients in', 'rpb.production_batch_ingredients = in.ingredient_id')
                        ->join('tbl_rd_production rp','rpb.production_batch_production = rp.product_id')
                        ->join('tbl_ingredients_batch inb','rpb.production_batch_ingredient_batch = inb.ingredient_batch_id')
                        ->join('tbl_formula f','f.formula_id = rp.product_formula')
                        ->join('tbl_users u','u.user_id = rp.user_id')
                        ->select('
                                    inb.ingredient_batch_id as ID,
                                    inb.date_added as date,
                                    inb.ingredient_batch_no as batch,
                                    inb.ingredient_batch_qty as qty,
                                    inb.invoice_file as file,
                                    u.user_first_name as creatorF,
                                    u.user_last_name as creatorL,
                                    in.ingredient_name as product,
                                    f.formula_version as version

                                ')
                        ->where('rpb.deleted_at IS NULL')
                        ->where('rpb.user_id', $_SESSION['user_id'])
                        ->where('u.user_id', $_SESSION['user_id'])
                        ->where('rp.product_status','Produced');
        
        if($batch_id) {
            $builder = $builder->where('inb.ingredient_batch_no', $batch_id);
        }
        return $builder->get();
    }

    public function batchCertificate($batch_id = null,$production = null) {
        $db = db_connect();
        if(!$production) return [
            'Manufacturing' => $this->batchCertificateM($db,)->getResultObject(),
            'R&D' => $this->batchCertificateRd($db)->getResultObject()
        ];
        if($production === 'Manufacturing') return ['Manufacturing' => $this->batchCertificateM($db,$batch_id)->getResultObject()];
        if($production === 'R&D') return ['R&D' => $this->batchCertificateRd($db,$batch_id)->getResultObject()];
    }
}