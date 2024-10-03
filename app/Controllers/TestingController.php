<?php

namespace App\Controllers;

use App\Models\AllFiles;
use App\Models\IngredientModel;
use App\Models\UserModel;
use App\Models\ModelsModel;
use App\Models\CorpFormulasModel;
use App\Models\CorpJournalModel;
use App\Models\CorpManufacturingModel;
use App\Models\CorpPackagingModel;
use App\Models\FormulaModel;
use App\Models\Formula_JournalModel;
use App\Models\RdProductionModel;
use App\Models\RdProduction_BatchModel;
use App\Models\Manuf_ProductionModel;
use App\Models\Manuf_ProductionBatchModel;
use App\Models\IngredientBatchModel;
use App\Models\SessionModel;
use App\Models\OverheadsModel;
use App\Models\CPNModel;
use App\Models\CorpMarketingModel;
use App\Models\CosmanModel;
use App\Models\JournalModel;
use App\Models\ProfilePress;
use App\Models\SubscriptionModel;
use CodeIgniter\Encryption\Encryption;
use Config\Encryption as ConfigEncryption;
use DateTime;
use DateTimeZone;
use Exception;
use stdClass;

class TestingController extends BaseController
{
    private $session;
    private $auth_btn;
    private $encrypter;
    private $subscription;
    private $apiKey;
    private $user_id;
    private $data = [];

    private function format_amount($number=0, $d = 0, $t=false,$cur='£',$df=null) {
        if(empty($number)) {if(!$df){return $cur."0";}else {return $df;}}
        if(!preg_match("/^[-]?[0-9\.]+$/",$number)) {
            if(!$df){return $cur."0";}else {return $df;};
        }
        if($t) {
            $parts = explode(".",(round($number,$d) * 1));
            $d = isset($parts[1]) ? strlen($parts[1]) : 0;
        }
        // dd($number);
        $f = number_format($number, $d);
        if($f[0] == '-') {
            return "-$cur".ltrim($f,$f[0]);
        }
        return "$cur".$f;
    }

    // Session 

    public function __construct()
    {
        $this->apiKey = env('LIVE_STRIPE_API_KEY') == '' ? env('TEST_STRIPE_API_KEY') : env('LIVE_STRIPE_API_KEY');
        $this->session = session();
        $userLog = $this->session->get('user_log');
        if(!empty($userLog)) {
            $this->user_id = $userLog['user_id'];
        }
        $sess = new SessionModel();
        $subs = new SubscriptionModel();
        $this->data['ViewTable'] = view('templates/TableViewer');
        $this->data['ejsyncfusion'] = view('templates/ej_syncfusion');

        if(isset($this->user_id)) {
            $this->subscription = $subs->subscription();
        }
        $this->session->set('elapse',$sess->sess_check());
        $this->genrateHashPwd();
        $user_log = $this->session->get('user_log');
    
        $encryption = new Encryption();
        // $key = bin2hex($encryption->createKey());
        // dd($key);
        $config = new ConfigEncryption();
        // $config->key = $key;
        $encrypter = $encryption->initialize($config);
        $this->encrypter = $encrypter;
    }

    public function safeEncrypt(string $message)
    {
        return bin2hex($this->encrypter->encrypt($message));
    }

    public function safeDecrypt($encrypt)
    {
        return $this->encrypter->decrypt($encrypt);
    }
    private function genrateHashPwd() {
        $userss = new UserModel();
        $fetchuserss = $userss->asObject()->findAll();
        foreach($fetchuserss as $users) {
            $checkPwd = password_get_info($users->user_password);
            if(isset($checkPwd['algoName'])) {
                if($checkPwd['algoName'] == 'unknown') {
                    $pass = password_hash($users->user_password, PASSWORD_DEFAULT);
                    $userss
                            ->builder()
                            ->where('user_email', $users->user_email)
                            ->update(['user_password' => $pass]);
                }
            }
        }
    }

// Session

public function testing()
    {
        $this->session->set('active', '4');
        $this->session->set('sub', '5');

        $allcpn = new CPNModel();
        $data['cpn'] = $allcpn->cpnWith();

        $allformulas = new FormulaModel();
        $data['formula'] =$allformulas->formulaWith();

        echo view('templates/header', $this->subscription);
        echo view('pages/rd');
        echo view('pages/rd_testing', $data);
        echo view('templates/footer');
    }

}