<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class IngredientModel extends Model{
    protected $table = 'tbl_ingredients';
    protected $primaryKey = 'ingredient_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'ingredient_id',
        'ingredient_name',
        'ingredient_inci',
        'ingredient_category',
        'ingredient_qty',
        'ingredient_date',
        'ingredient_price',
        'ingredient_delivery',
        'ingredient_vat',
        'ingredient_supplier',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function ingredientsWith(){
        $db = db_connect();
        $builder = $db  ->table('tbl_ingredients t1')
                        ->orderBy('t1.ingredient_name', 'asc')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function ingredientsWithsupplier($ingredient_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_ingredients t1')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t1.ingredient_id', $ingredient_id);
        $query = $builder->get();
        return $query->getResult();
    }

    //public function stockWithDelivery($stock_id) {
    //    $db = db_connect();
    //    $builder = $db->table('tbl_stockcheck_delivery_items itm')
    //            ->select('itm.delivery_item_qty')
                        // ->where('itm.user_id', $_SESSION['user_id'])
    //            ->where('itm.delivery_ingredient_item',$stock_id);
    //    $query = $builder->get();
    //    return $query->getResult();
    //}
}