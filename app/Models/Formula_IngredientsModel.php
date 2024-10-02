<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class Formula_IngredientsModel extends Model{
    protected $table = 'tbl_formula_ingredients';
    protected $primaryKey = 'f_ingredients_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    private $user_id;

    protected $allowedFields = [
        'f_ingredients_formula',
        'f_ingredients_ingredients',
        'manuf_production_batch',
        'f_ingredients_qty',
        'f_ingredients_phase',
        'f_ingredients_instructions',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = session()->get('user_id');
        return $data;
    }

    // public function __construct()
    // {
    //     if(session()->has('user_id')) {
    //         $this->user_id = session()->get('user_id');   
    //     }
    // }

    public function f_ingredientsWith($formula_id, $user_id=null){
        // dd(session()->get('user_id'));
        if(session()->has('user_id')) {
            if(empty($user_id)) {$user_id = session()->get('user_id');}
        }
        $db = db_connect();
        $builder = $db  ->table('tbl_formula_ingredients t1')
                        ->join('tbl_ingredients t2', 't2.ingredient_id = t1.f_ingredients_ingredients')
                        ->join('tbl_formula t3', 't3.formula_id = t1.f_ingredients_formula')
                        ->where('t3.user_id', $user_id)
                        ->where('t2.user_id', $user_id)
                        ->where('t1.user_id', $user_id)
                        ->where('t1.deleted_at IS NULL')
                        ->where('t2.deleted_at IS NULL')
                        ->where('t3.deleted_at IS NULL')
                        ->where('t3.formula_id', $formula_id);
        $query = $builder->get();
        return $query->getResult();
    }

    public function formulaWithRD_Plan($formula_id, $user_id=null){
        if(session()->has('user_id')) {
            if(empty($user_id)) {$user_id = session()->get('user_id');}
        }
        $db = db_connect();
        $builder = $db  ->table('tbl_formula t1')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $user_id)
                        ->where('t1.formula_id', $formula_id);
        $query = $builder->get();
        return $query->getRowObject();
    }

    public function del_FIng_formula_id($formula_id) {
        $forIng = $this->f_ingredientsWith($formula_id);
        if(empty($forIng)) {
            return false;
        }
        $fIngredientsModel = new Formula_IngredientsModel();
        $f_ing_ids = [];
        foreach($forIng as $key => $ings) {
            array_push($f_ing_ids, $ings->f_ingredients_id);
        }
        $fIngredientsModel->delete($f_ing_ids);
        return true;
    }
}