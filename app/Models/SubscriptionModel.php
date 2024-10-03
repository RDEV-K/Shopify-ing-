<?php

namespace App\Models;

use CodeIgniter\Model;

class SubscriptionModel extends Model
{
    
    public function subscription($sub_id=null) {
        $userModel = new UserModel();
        $id = null;
        if(!empty($sub_id)){
            $id = ['stripe_subscription_id'=>$sub_id];
        }else {
            $id = ['user_id'=> session()->get('user_id')];
        }
        $user = $userModel->select('stripe_product_name')->where($id)->first();
        if(!empty($user))
        {
            if(in_array($user['stripe_product_name'], ['Pro', 'Professional'])) {return $this->pro_plan();}
            if(in_array($user['stripe_product_name'], ['Free', 'Starter'])) {return $this->free_plan();}
        }
        return $this->free_plan();
    }

    private function free_plan() {
        return [
            "plan"      => ["Free","Starter"],
            "restrict"  => true,
        ];
    }

    private function pro_plan()
    {
        return [
            "plan"      => ["Pro","Professional"],
            "restrict"  => false
        ];
    }
}
