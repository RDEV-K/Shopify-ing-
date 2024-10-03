<?php

namespace App\Models;

use CodeIgniter\Model;

class AllFiles extends Model
{
    protected $table            = 'tbl_all_files';
    protected $primaryKey       = 'file_id';
    protected $useAutoIncrement = true;
    protected $useSoftDeletes   = true;
    protected $protectFields    = true;
    protected $allowedFields    = [
        'file_directory',
        'file_upload',
        'file_page_name',
        'page_id',
        'user_id',
        'created_at',
        'updated_at',
        'deleted_at',
    ];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    
    protected $beforeInsert = ['beforeInsert'];
    protected function beforeInsert(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
        
    protected $beforeUpdate = ['beforeUpdate'];
    protected function beforeUpdate(array $data) {
        $data['data']['user_id'] = $_SESSION['user_id'];
        return $data;
    }
        
    
    public function getFiles($data) {
        extract($data);
        $db = db_connect();
        $file = $db  ->table($table.' pg')
                        ->select('fi.file_directory,fi.file_upload,fi.created_at')
                        ->join('tbl_all_files fi', "pg.$table_id = fi.page_id")
                        ->where(["pg.$table_id" => $search_id, 'fi.file_page_name' => $page_name]);
        $file->where('fi.deleted_at IS NULL');
        $qryFile = $file->get();

        return $qryFile->getResultObject();
    }

}
