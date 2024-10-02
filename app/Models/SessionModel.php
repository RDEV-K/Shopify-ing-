<?php

namespace App\Models;

use CodeIgniter\Model;

class SessionModel extends Model
{
    protected $table = 'tbl_users';

    public function sess_check() {
        $session = session();
        $uri = service('uri');
        $exp = 7200;
        $elapse = time() - $_SESSION['__ci_last_regenerate'];
        $expireds = ($exp - $elapse - 60) * 1000;
        if($uri->getSegment(1) != "" && $uri->getSegment(1) != "login"){
            
            if($expireds < 1) {
                if(!$session->get('notify')) {
                    $ses_data = [
                        'notify' => TRUE
                    ];
                    $session->set($ses_data);
                    return $expireds;
                }
            }else {
                return $expireds;
            }
        }
    }
                            
    
}
