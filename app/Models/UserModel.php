<?php 
namespace App\Models;  
use CodeIgniter\Model;
  
class UserModel extends Model{
    protected $table = 'tbl_users';
    protected $primaryKey = 'user_id';

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';
    protected $useSoftDeletes = true;
    
    protected $allowedFields = [
        'user_id',
        'user_first_name',
        'user_last_name',
        'user_email',
        'stripe_customer_id',
        'stripe_subscription_id',
        'stripe_subscription_status',
        'user_password',
        'stripe_product_id',
        'stripe_product_name',
        'user_business_name',
        'user_business_type',
        'user_business_overview'
    ];

    public function cosman($email) {
        $db = \Config\Database::connect('ingrevo_wp');
        $query = $db->table('cnhnwdSRusers user')
                    ->join('cnhnwdSRppress_customers cus', 'user.ID = cus.user_id' )
                    ->join('cnhnwdSRppress_subscriptions sub', 'cus.id = sub.customer_id' )
                    ->join('cnhnwdSRppress_plans plan', 'sub.plan_id = plan.id' )
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
        $result = $query->get();
        return $result->getRowArray();
    }

    public function clone_wp_user($user,$fieldname=null,$update=null) {
        if(!$fieldname) {
            $names = explode(' ', $user['names']);
            $user['user_first_name'] = $names[0];
            $user['user_last_name'] = isset($names[1]) ? $names[1] : '';
            $user = \array_diff_key($user, ["names"=>"remove"]);
        }else {
            $fieldname = array_flip($fieldname);
            $user = array_intersect_key($user, $fieldname);
            if($update) $user['user_id'] = $update;
        }
        
        $userID = $this->save($user);
        return !empty($userID) ? $userID : 0;
    }
}