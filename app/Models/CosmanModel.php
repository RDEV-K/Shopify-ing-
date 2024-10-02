<?php

namespace App\Models;

use CodeIgniter\Model;

class CosmanModel extends Model
{
    protected $DBGroup          = 'ingrevo_wp';
    protected $table            = 'ougvp_users';
    protected $primaryKey       = 'ID';
    protected $allowedFields    = [
        'user_email',
        'user_registered',
        'ID'
    ];
    
    private function checkSubscriptions($email) {
        $sub_id = null;
        
        $queryChk = $this->db->table('ougvp_ppress_subscriptions sub')
                    ->join('ougvp_ppress_customers cus', 'cus.id = sub.customer_id' )
                    ->join('ougvp_users user', 'user.ID = cus.user_id' )
                    ->join('ougvp_ppress_plans plan', 'sub.plan_id = plan.id' )
                    ->select('
                        sub.profile_id as stripe_subscription_id, 
                        user.user_email,
                        display_name as names,
                        user.user_registered as created_at,
                        sub.status as stripe_subscription_status,
                        plan.name as stripe_product_name,
                        sub.id as sub_id
                    ')
                    ->where('user_email',$email)
                    ->whereIn('sub.status',['active','trialling']);
        $resultChk = $queryChk->get();
        $resultChk = $resultChk->getResult();
        
        if(!empty($resultChk)) {
            if(count($resultChk) > 0){
                foreach($resultChk as $resChk) {
                    if(in_array($resChk->stripe_product_name,['Pro','Professional'])) $sub_id = $resChk->sub_id;
                }
            }
        }
        return $sub_id;
    }
    public function cosman($email) {
        $sub_id = $this->checkSubscriptions($email);
        $query = $this->db->table('ougvp_users user')
                    ->join('ougvp_ppress_customers cus', 'user.ID = cus.user_id' )
                    ->join('ougvp_ppress_subscriptions sub', 'cus.id = sub.customer_id' )
                    ->join('ougvp_ppress_plans plan', 'sub.plan_id = plan.id' )
                    ->select('
                        sub.profile_id as stripe_subscription_id, 
                        user.user_email,
                        display_name as names,
                        user.user_registered as created_at,
                        sub.status as stripe_subscription_status,
                        plan.name as stripe_product_name
                        
                    ')
                    ->where('user_email',$email)
                    ->whereIn('sub.status',['active','trialling']);
        if(!empty($sub_id)) $query->WhereIn('sub.id',[$sub_id]);
        $result = $query->get();
        return $result->getRowArray();
    }

    public function clone_wp_user($user,$fieldname=null,$update=null) {
        $userID = null;
        $userModel = new UserModel();
        if(empty($fieldname)) {
            $names = explode(' ', $user['names']);
            $user['user_first_name'] = $names[0];
            $user['user_last_name'] = isset($names[1]) ? $names[1] : '';
            
            $user['user_password'] = password_hash($user['user_password'], PASSWORD_DEFAULT);
            $user = \array_diff_key($user, ["names"=>"remove"]);
            $userID = $userModel->insert($user);

        }else {
            $fieldname = array_flip($fieldname);
            $user = array_intersect_key($user, $fieldname);
            if(!empty($update)) {
                $user['user_id'] = $update;
                $userID = $userModel->save($user);
            }
        }
        return !empty($userID) ? $userID : 0;
    }
}
