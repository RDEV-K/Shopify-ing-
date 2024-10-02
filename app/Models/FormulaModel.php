<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class FormulaModel extends Model{
    protected $table = 'tbl_formula';
    protected $primaryKey = 'formula_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'formula_id',
        'formula_date',
        'dependency_id',
        'formula_version',
        'formula_creator',
        'formula_comments',
        'formula_status',
        'formula_rdplan',
        'user_id',
    ];
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }

    public function formulaWith(){
        $db = db_connect();
        $builder = $db  ->table('tbl_formula f')
                        ->join('tbl_users u', 'u.user_id = f.user_id')
                        ->orderBy('f.dependency_id','asc')
                        ->where('f.user_id', $_SESSION['user_id'])
                        ->where('f.deleted_at IS NULL');
        $query = $builder->get();
        return $query->getResult();
    }

    public function formulaWithPlan(){
        $db = db_connect();
        $builder = $db  ->table('tbl_formula t1')
                        ->join('tbl_users t2', 't2.user_id = t1.user_id')
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $builder->orderBy('formula_version', 'ASC');
        $query = $builder->get();
        return $query->getResult();
    }

    public function formulaWithPlanManu(){
        $db = db_connect();
        $builder = $db  ->table('tbl_formula t1')
                        ->join('tbl_users t2', 't2.user_id = t1.user_id')
                        ->where('t2.user_id', $_SESSION['user_id'])
                        ->where('t1.deleted_at IS NULL');
        $builder->orderBy('formula_version', 'ASC');
        $query = $builder->get();
        return $query->getResult();
    }

    public function formulaWithf_ingredients($formula_id){
        $db = db_connect();
        $builder = $db  ->table('tbl_formula t1')
                        ->where('t1.deleted_at IS NULL')
                        ->where('t1.user_id', $_SESSION['user_id'])
                        ->where('t1.formula_id', $formula_id);
        $query = $builder->get();
        return $query->getResult();
    }

}