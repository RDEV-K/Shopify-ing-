<?php

namespace App\Controllers;

use App\Models\AllFiles;
use App\Models\IngredientModel;
use App\Models\UserModel;
use App\Models\ModelsModel;
use App\Models\CorpFormulasModel;
use App\Models\CorpIngredientsModel;
use App\Models\CorpManufacturingModel;
use App\Models\CorpPackagingModel;
use App\Models\FormulaModel;
use App\Models\Formula_IngredientsModel;
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
use App\Models\ProfilePress;
use App\Models\SubscriptionModel;
use CodeIgniter\Encryption\Encryption;
use CodeIgniter\HTTP\Response;
use App\Controllers\ApiController;
use Config\Encryption as ConfigEncryption;
use DateTime;
use DateTimeZone;
use Exception;
use stdClass;

class WebAppController extends BaseController
{
    private $session;
    private $auth_btn;
    private $encrypter;
    private $subscription;
    private $apiKey;
    private $user_id;
    private $data = [];
    private $items = [];

    private function format_amount($number = 0, $d = 0, $t = false, $cur = '£', $df = null)
    {
        if (empty($number)) {
            if (!$df) {
                return $cur . "0";
            } else {
                return $df;
            }
        }
        if (!preg_match("/^[-]?[0-9\.]+$/", $number)) {
            if (!$df) {
                return $cur . "0";
            } else {
                return $df;
            }
            ;
        }
        if ($t) {
            $parts = explode(".", (round($number, $d) * 1));
            $d = isset($parts[1]) ? strlen($parts[1]) : 0;
        }
        // dd($number);
        $f = number_format($number, $d);
        if ($f[0] == '-') {
            return "-$cur" . ltrim($f, $f[0]);
        }
        return "$cur" . $f;
    }

    // Dashboard //

    public function testemail()
    {

        $email = \Config\Services::email();

        $htmlString = view('pages/testemail');
        $message = $htmlString;

        $email->setFrom('hello@ingrevo.com', 'Ingrevo');
        $email->setTo('nl.rd@outlook.com');
        $email->setSubject('Login Details');
        $email->setMessage($message);
        if ($email->send()) {
            echo 'Email successfully sent';
        } else {
            $data = $email->printDebugger(['headers']);
            print_r($data);
        }
    }

    public function index()
    {
        $this->session->set('sub', '1');
        $this->session->set('active', '1');
        echo view('templates/header', $this->subscription);
        echo view('pages/dashboard');
        echo view('templates/footer');
    }

    // Dashboard //

    // Subscription //

    public function stripes()
    {
        // $this->Stripe_Customers();
        $stripe = json_encode($this->Stripe_Customers());
        if ($stripe) {
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    // Profile Press
    public function ppress()
    {
        $ppress = json_encode($this->ProfilePress());
        if ($ppress) {
            return redirect()->back();
        } else {
            return redirect()->back();
        }
    }

    private function randomPassword($len = 8)
    {
        $alphabet = 'abcdefghijkmnpqrstuvwxyz123456789ABCDEFGHJKLMNPQRSTUVWXYZ';
        $pass = array(); //remember to declare $pass as an array
        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
        for ($i = 0; $i < $len; $i++) {
            $n = rand(0, $alphaLength);
            $pass[] = $alphabet[$n];
        }
        return implode($pass); //turn the array into a string
    }

    private function stripeMessage($message)
    {
        // $message = "Oops! Something went wrong Could not connect to Stripe (https://api.stripe.com/v1/subscriptions). Please check your internet connection and try again. If this problem persists, you should check Stripe's service status at https://twitter.com/stripestatus, or let us know at support@stripe.com. (Network error [errno 28]: Failed to connect to api.stripe.com port 443: Timed out).";
        $substring = null;
        // Check if "Please check" is present in the message
        if (strpos($message, "Please check") !== false) {
            // Find the position of the first period after "Please check"
            $startPos = strpos($message, "Please check");
            $endPos = strpos($message, ".", $startPos);

            // Extract and print the substring
            if ($endPos !== false) {
                $substring = substr($message, $startPos, $endPos - $startPos + 1);
            }
            return $substring;
        }
        return $message;
    }

    private function ProfilePress($sub_id = null)
    {
        try {
            $user = new UserModel();

            $stripe = new \Stripe\StripeClient($this->apiKey); //pk_test_51KGSTIHe9x5IZmTs5V00zPub2ADN1jaJaP9qEjibM5FHIDK0Z2i2rW6JcwA8pxmuuyxNgD8iLFiqp6OrRjnjmwfJNt2uAA600mXt8w1Ov
            $inbox = [];
            if (!empty($sub_id)) {
                $cus_subscription = $stripe->subscriptions->retrieve(
                    $sub_id,
                    []
                );

                $products = $stripe->products->retrieve($cus_subscription['plan']['product']);

                $create_user = [
                    'stripe_customer_id' => $cus_subscription['customer'],
                    'stripe_subscription_id' => $cus_subscription['id'],
                    'stripe_subscription_status' => $cus_subscription['status'],
                    'stripe_product_id' => $cus_subscription['plan']['product'],
                    'stripe_product_name' => $products['name']
                ];
                $userBuilder = $user->builder();
                $userBuilder->where('stripe_subscription_id', $sub_id);
                $userBuilder->update($create_user);

                if (!empty($cus_subscription)) {
                    if ($cus_subscription['status'] == 'active' || $cus_subscription['status'] == 'trialing') {
                        return ['active' => true];
                    } else {
                        return ['active' => false];
                    }
                }
            } else {
                $user_email = $this->request->getPost('user_email');

                try {
                    $fetchUser = $user->where('user_email', $user_email)->first();

                    // if valid user then reset password
                    if (!empty($fetchUser) && in_array($fetchUser['stripe_product_name'], ["Free", "Starter"])) {
                        $this->reset_password($fetchUser);
                        return true;
                    } else {
                        $profilepress = new ProfilePress();
                        $cus_details = null;

                        $ppress = $profilepress->ingrevo($user_email);
                        if (!empty($ppress)) {
                            // Split names on customer details
                            $split_names = explode(' ', $ppress['names']);
                            $last_name = $split_names[count($split_names) - 1];
                            $first_name = trim(str_replace($last_name, '', $ppress['names']));
                            $ppress['user_first_name'] = $first_name;
                            $this->reset_password($ppress);
                            return true;
                        } else {
                            return session()->setFlashdata('msg', "Email `<i class=text-dark>$user_email</i>` not found.");
                        }
                    }
                    return;
                } catch (Exception $ex) {
                    return session()->setFlashdata('msg', "Oops! Something went wrong " . $this->stripeMessage($ex->getMessage()));
                }
            }
        } catch (Exception $ex) {
            return session()->setFlashdata('msg', "Oops! Something went wrong " . $this->stripeMessage($ex->getMessage()));
        }
    }

    private function Stripe_Customers($sub_id = null)
    {
        try {
            $user = new UserModel();

            $stripe = new \Stripe\StripeClient($this->apiKey); //pk_test_51KGSTIHe9x5IZmTs5V0Pub2ADN1jqEjibM5FHIDK0Z2i2rW6JcwA8pxmuuyxNgD8iLFiqp6OrRjnjmwfJNt2uAA600mXt8w1Ov
            $inbox = [];
            if (!empty($sub_id)) {
                $cus_subscription = $stripe->subscriptions->retrieve(
                    $sub_id,
                    []
                );

                $products = $stripe->products->retrieve($cus_subscription['plan']['product']);

                $create_user = [
                    'stripe_customer_id' => $cus_subscription['customer'],
                    'stripe_subscription_id' => $cus_subscription['id'],
                    'stripe_subscription_status' => $cus_subscription['status'],
                    'stripe_product_id' => $cus_subscription['plan']['product'],
                    'stripe_product_name' => $products['name']
                ];
                $userBuilder = $user->builder();
                $userBuilder->where('stripe_subscription_id', $sub_id);
                $userBuilder->update($create_user);

                if (!empty($cus_subscription)) {
                    if ($cus_subscription['status'] == 'active' || $cus_subscription['status'] == 'trialing') {
                        return ['active' => true];
                    } else {
                        return ['active' => false];
                    }
                }
            } else {
                $user_email = $this->request->getPost('user_email');

                try {
                    $fetchUser = $user->where('user_email', $user_email)->first();
                    if (!empty($fetchUser) && in_array($fetchUser['stripe_product_name'], ["Free", "Starter"])) {
                        $this->reset_password($fetchUser);
                        return true;
                    } else {

                        $subscriptions = $stripe->subscriptions->all();
                        $cus_details = null;
                        foreach ($subscriptions as $subscription) {
                            // get customer by subscription details
                            $customer = $stripe->customers->retrieve($subscription['customer'], []);
                            $products = $stripe->products->retrieve($subscription['plan']['product']);
                            // echo "<pre>"; print_r($customer);echo "</pre>";

                            // Split names on customer details
                            $split_names = explode(' ', $customer['name']);
                            $last_name = $split_names[count($split_names) - 1];
                            $first_name = trim(str_replace($last_name, '', $customer['name']));

                            // check if customer is already in our database
                            $fetchUser = $user->where('user_email', $customer['email'])->select('user_email')->find();

                            // If not in our database
                            // Create new user with customer details
                            // auto generate password
                            $password = $this->randomPassword();
                            $pass_hash = password_hash($password, PASSWORD_DEFAULT);

                            $create_user = [
                                'user_first_name' => $first_name,
                                'user_last_name' => $last_name,
                                'user_email' => $customer['email'],
                                'user_password' => $pass_hash,
                                'stripe_customer_id' => $subscription['customer'],
                                'stripe_subscription_id' => $subscription['id'],
                                'stripe_subscription_status' => $subscription['status'],
                                'stripe_product_id' => $subscription['plan']['product'],
                                'stripe_product_name' => $products['name']
                            ];

                            if (empty($fetchUser)) {
                                $user->insert($create_user);
                                return true;
                            } else {
                                array_push($inbox, [$customer['email'] => ['status' => false, 'message' => 'Registered already']]);
                            }

                            if ($customer['email'] == $user_email) {

                                $this->reset_password($create_user);
                                // $this->notifyEmail($create_user);
                                return true;
                            }
                        }
                        // dd("Done");
                    }
                    return;
                } catch (Exception $ex) {
                    session()->setFlashdata('msg', "Oops! Something went wrong " . $this->stripeMessage($ex->getMessage()));
                    return;
                }
            }
        } catch (Exception $ex) {
            session()->setFlashdata('msg', "Oops! Something went wrong " . $this->stripeMessage($ex->getMessage()));
            return ['active' => false];
        }
    }

    private function reset_password($details)
    {
        try {
            $password = $this->randomPassword();
            $session = session();
            extract($details);
            $user = new UserModel();
            $fetchUser = $user->where('user_email', $user_email)->select('user_id')->first();
            $updateUser = [
                'user_password' => $password
            ];
            $temp['email'] = $user_email;
            $temp['password'] = $password;
            $temp['firstname'] = $user_first_name;
            $htmlString = view('pages/mailTemplate', $temp);

            $sendMessage = [
                'email' => $user_email,
                'subject' => "Reset Password",
                'message' => $htmlString
            ];
            // dd($user,$updateUser);
            $notify = $this->notifyEmail($sendMessage);
            if ($notify) {
                $user->update($fetchUser['user_id'], $updateUser);
                $session->setFlashdata('msg', "Email sent to $user_email ");
                return true;
            } else {
                $session->setFlashdata('msg', "Unable to send email to $user_email ");
                return false;
            }
        } catch (Exception $e) {
            $session->setFlashdata('msg', "Oops!," . $this->stripeMessage($e->getMessage()) . " Unable to send email to $user_email ");
        }
        return false;
    }

    private function notifyEmail($customer)
    {
        try {
            $email = \Config\Services::email();
            $to = $customer['email'];
            $subject = $customer['subject'];
            $message = $customer['message'];
            $email->setFrom(env('EMAIL_FROM'), env('EMAIL_TITLE'));
            $email->setTo($to);
            $email->setSubject($subject);
            $email->setMessage($message);
            if ($email->send()) {
                return true;
            } else {
                return false;
            }
        } catch (\Throwable $ex) {
            echo "<pre>";
            print_r($ex);
            echo "</pre>";
        }
    }

    // Subscription //

    // Files //

    private function validateFile($file)
    {
        $result = [];
        if (isset($file)) {
            dd($file);
            if ($file['error'] === 0) {
                $fileType = mime_content_type($file['tmp_name']);
                if ($fileType === 'application/pdf') {
                    if ($file['size'] <= 2 * 1024 * 1024) {
                        $result = ['success' => 1];
                    } else {
                        $result = ['success' => 0, 'message' => 'The file size must not be more than 2MB.'];
                    }
                } else {
                    $result = ['success' => 0, 'message' => 'The file must be PDF.'];
                }
            } else {
                $result = ['success' => 0, 'message' => 'Uploading file error.'];
            }
        }
        return json_encode($result);
    }

    public function fileSpATH($msg, $filename, $dir = null, $mother = null)
    {

        if ($dir != null)
            $dir .= '/';
        if ($filename == "No")
            $filename = "";
        $filepath = WRITEPATH . 'uploads/' . $dir . $filename;
        if ($filename) {
            if (file_exists($filepath)) {
                $mime = mime_content_type($filepath);
                header('Content-Length: ' . filesize($filepath));
                header("Content-Type: $mime");
                header('Content-Disposition: inline; filename="' . $filepath . '";');
                readfile($filepath);
            } else {
                return view('errors/html/error_404', ['message' => "$mother $msg No File Found"]);
            }
        } else {
            return view('errors/html/error_404', ['message' => "$mother $msg No File Found"]);
        }
        exit();
    }

    public function preview_file($msg, $filename, $dir = null, $mother = null)
    {

        $filename = $this->safeDecrypt(hex2bin($filename));
        $dir = $this->safeDecrypt(hex2bin($dir));

        if ($dir != null)
            $dir .= '/';
        if ($filename == "No")
            $filename = "";
        $filepath = WRITEPATH . 'uploads/' . $dir . $filename;
        if ($filename) {
            if (file_exists($filepath)) {
                $mime = mime_content_type($filepath);
                header('Content-Length: ' . filesize($filepath));
                header("Content-Type: $mime");
                header('Content-Disposition: inline; filename="' . $filepath . '";');
                readfile($filepath);
            } else {
                return view('errors/html/error_404', ['message' => "$mother $msg No File Found"]);
            }
        } else {
            return view('errors/html/error_404', ['message' => "$mother $msg No File Found"]);
        }
        exit();
    }

    public function download_file($file, $dir)
    {
        // dd(hex2bin($dir),'il');
        $file = $this->safeDecrypt(hex2bin($file));
        $dir = $this->safeDecrypt(hex2bin($dir));
        if ($dir != null)
            $dir .= '/';
        if ($file == "No")
            $file = "";
        $filepath = WRITEPATH . 'uploads/' . $dir . $file;
        if ($file) {
            if (file_exists($filepath)) {
                $mime = mime_content_type($filepath);
                header('Content-Transfer-Encoding: utf-8');
                header("Content-Type: $mime");
                header('Content-Disposition: attachment; filename="' . basename($filepath) . '";');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($filepath));
                flush();
                readfile($filepath);
                die();
            } else {
                http_response_code(404);
                die();
            }
        } else {
            die("Invalid file name!");
        }
        exit();
    }

    private function upload_file_history($data)
    {
        $allFiles = new AllFiles();
        extract($data);
        if ($file_upload && $file_upload->isValid()) {
            $file_directory .= '/';
            $file_upload->move(WRITEPATH . 'uploads/' . $file_directory, $newfilename);
            $remv = [
                "newfilename" => "remove/",
                "file_upload" => "remove/"
            ];
            $data = \array_diff_key($data, $remv);
            $data['file_upload'] = $newfilename;

            $allFiles->save($data);
        }

        return;
    }

    private function file_history($data)
    {

        if (!empty($data["file_history"])) {
            foreach ($data["file_history"] as $file_key => $files) {
                $files->file_directory = $this->safeEncrypt($files->file_directory);
                $files->file_upload = $this->safeEncrypt($files->file_upload);
            }
            return $data;
        }
        return $data;
    }

    // Files

    // Manufacturing //

        // Ingredients //

            public function manufacturing_ingredients()
            {
                $this->session->set('active', '2');
                $this->session->set('sub', '1');
                $data = $this->subscription;
                $data['ingredients'] = $this->manufacturing_ingredients_data();
                echo view('templates/header', $this->subscription);
                echo view('pages/manufacturing', $this->subscription);
                echo view('pages/manufacturing_ingredients', $data);
                echo view('templates/footer');
            }

            public function all_ingredient_csv()
            {
                $csv = new ExportCSV();
                $api = json_decode($this->manufacturing_ingredients_api(), true);
                return $csv->exportcsv($api);
            }

            public function manufacturing_ingredients_data()
            {
                $allingredients = new IngredientModel();
                return $allingredients->ingredientsWith();
            }

            public function manufacturing_ingredients_api()
            {
                $data['data'] = $this->manufacturing_ingredients_data();
                $data['title'] = "All Ingredient";
                $data['header'] = [
                    "ingredient_name" => "Ingredient",
                    "ingredient_inci" => "INCI",
                    "ingredient_category" => "Catergory",
                    "ingredient_qty" => "Qty (kg)",
                ];
                $data['url'] = 'manufacturing/ingredients/csv';
                $data['id'] = null;
                return json_encode($data);
            }

            // CRUD //

                // Create Ingredient
                public function add_ingredient()
                {

                    //$file = $this->request->getFile('invoice_file');

                    $allingredients = new IngredientModel();

                    $ingredient_name = $this->request->getVar('ingredient_name');
                    $ingredient_date = $this->request->getVar('ingredient_date');
                    $ingredient_inci = $this->request->getVar('ingredient_inci');
                    $ingredient_category = $this->request->getVar('ingredient_category');
                    $ingredient_qty = $this->request->getVar('ingredient_qty');

                    $data = [
                        'ingredient_name' => isset($ingredient_name) ? $ingredient_name : '',
                        'ingredient_date' => isset($ingredient_date) ? $ingredient_date : '',
                        'ingredient_inci' => isset($ingredient_inci) ? $ingredient_inci : '',
                        'ingredient_category' => isset($ingredient_category) ? $ingredient_category : '',
                        'ingredient_qty' => isset($ingredient_qty) ? $ingredient_qty : 0,
                    ];
                    // echo "<pre>";print_r($data); echo "</pre>";die;

                    //if($file && $file->isValid()) {
                    //    $newfilename = $this->request->getVar('ingredient_inci')."-".$this->request->getVar('ingredient_date')."-".$this->request->getVar('ingredient_supplier');
                    //    $data['invoice_file'] = $newfilename;
                    //    $file->move(WRITEPATH . 'uploads/PR2-4 - Ingredients', $newfilename);
                    //}

                    $allingredients->insert($data);
                    return redirect()->back();
                }

                // Retrieve
                public function view_ingredient($ingredient_id)
                {
                    $allingredients = new IngredientModel();
                    $data["ingredient"] = $allingredients->ingredientsWithsupplier($ingredient_id);

                    $allbatchs = new IngredientBatchModel();
                    $data['batchs'] = $allbatchs->batchwithIng($ingredient_id);

                    echo view("pages/manufacturing_ingredients_view", $data);
                }

                // Update Ingredient - (View)
                public function edit_ingredient($ingredient_id)
                {

                    $allingredients = new IngredientModel();
                    $data["ingredient"] = $allingredients->find($ingredient_id);

                    echo view("pages/manufacturing_ingredients_edit", $data);
                }

                // Update Ingredient - (Save)
                public function update_ingredient()
                {

                    $ingredient_id = $this->request->getPost("ingredient_id");
                    $updateingredient = new IngredientModel();

                    $builder = $updateingredient->builder();
                    $builder->where("ingredient_id", $ingredient_id);

                    $data = $this->request->getPost();

                    //$dir = 'PR2-4 - Ingredients';
                    //$filename = $this->request->getFile("invoice_file");
                    //$existFile = $this->request->getPost("invoice_exist_file");
                    //$data = $this->request->getPost();
                    //$remv = [
                    //    "invoice_exist_file" => "remove/"
                    //];
                    //if(!$existFile) {
                    //    $existFile .= "no_file/";
                    //}
                    //$data = \array_diff_key($data,$remv);
                    //if($filename && $filename->isValid()) {
                    //    $newfilename = $filename->getRandomName();
                    //    $data['invoice_file'] = $newfilename;
                    //    $dir .='/';
                    //    $filepath = WRITEPATH.'uploads/'.$dir.$existFile;
                    //    if(file_exists($filepath)) {
                    //        unlink($filepath);
                    //        $filename->move(WRITEPATH . 'uploads/'.$dir,$newfilename);
                    //    }else {
                    //        $filename->move(WRITEPATH . 'uploads/'.$dir,$newfilename);
                    //    }
                    //
                    //}
                    $builder->update($data);
                    return redirect()->to('/manufacturing/ingredients');
                }

                // Delete Ingredient
                public function delete_ingredient($ingredient_id = null)
                {
                    $allingredients = new IngredientModel();
                    $data['ingredient'] = $allingredients->where('ingredient_id', $ingredient_id)->delete($ingredient_id);
                    return redirect()->back();
                }

            // CRUD //

        // Ingredients //

        // Formulas //

            public function rd_formula()
            {

                $this->session->set('active', '2');
                $this->session->set('sub', '2');

                $allformula = new FormulaModel();
                $formulas = $allformula->formulaWith();

                if (!empty($formulas)) {
                    $trace_id = 0;
                    $trace_data = [];
                    $dep_id = [];
                    $current_dep_id = null;
                    $dep_count = 0;
                    foreach ($formulas as $key => &$formula) {
                        if (!$formula->dependency_id) {
                            $trace_id += 1;
                            $formula->id = $trace_id;
                            $formula->parent_id = $trace_id;
                            $trace_data[$formula->formula_id] = $trace_id;
                        } else if ($formula->dependency_id) {
                            if (!array_key_exists($formula->dependency_id, $trace_data)) {

                                $trace_id += 1;
                                $data = ['dependency_id' => 0];
                                $formula->id = $trace_id;
                                $formula->parent_id = $trace_id;
                                $this->upd_formula($data, $formula->formula_id);
                                continue;
                            }

                            $parent_id = $trace_data[$formula->dependency_id];
                            if ($current_dep_id == $parent_id) {
                                $dep_count += 1;
                            } else {
                                $dep_count = 1;
                            }
                            if (!empty($parent_id)) {
                                $current_dep_id = $parent_id;
                            } else {
                                $current_dep_id = null;
                            }

                            $formula->parent_id = $parent_id;

                            $copied_id = $parent_id . " (" . $dep_count . ")";
                            $trace_data[$formula->formula_id] = $copied_id;

                        }
                    }
                    foreach ($formulas as $key => &$formula) {
                        if (!array_key_exists($formula->formula_id, $trace_data)) {
                            $data = ['dependency_id' => 0];
                            $this->upd_formula($data, $formula->formula_id);
                            continue;
                        }
                        $parent_id = $trace_data[$formula->formula_id];
                        $formula->id = $parent_id;
                    }
                }

                $data['formula'] = $formulas;
                echo view('templates/header', $this->subscription);
                echo view('pages/manufacturing', $this->subscription);
                echo view('pages/rd_formula', $data);
                echo view('templates/footer');
            }

            // CRUD

            // Add
            public function add_formula()
            {

                $allformula = new FormulaModel();
                $data = [
                    'formula_date' => $this->request->getVar('formula_date'),
                    'formula_version' => $this->request->getVar('formula_version'),
                    'formula_creator' => $this->request->getVar('formula_creator'),
                    'formula_comments' => $this->request->getVar('formula_comments'),
                    'formula_status' => $this->request->getVar('formula_status'),
                    'formula_rdplan' => $this->request->getVar('formula_rdplan'),
                ];
                $allformula->insert($data);
                return redirect()->back();
            }

            private function array_remove(array $data, array $element = [])
            {
                if (empty($element)) {
                    return $data;
                }

                return \array_diff_key($data, $element);
            }

            public function select(array $data, string $key): array
            {
                if (empty($key)) {
                    return $data;
                }

                $convert_key_array = explode(",", $key);
                $array_val = [];
                for ($i = 1; $i <= count($convert_key_array); $i++) {
                    array_push($array_val, $i);
                }
                $new_array = array_combine($convert_key_array, $array_val);
                return array_intersect_key($data, $new_array);

            }

            public function copy_formula($formula_id): Response
            {
                $formulaModel = new FormulaModel();
                $formula_data = $formulaModel->find($formula_id);
                $f_ingredient_data = $this->rd_formula_ingredients_data($formula_id);
                $formula_data['formula_date'] = date("Y-m-j");
                $formula_data['formula_version'] = str_ireplace(" - copy","",$formula_data['formula_version']);
                $formula_data['formula_version'] = $formula_data['formula_version']. ' - copy';
                $copied_formula_ingredient = [];

                $allformula = new Formula_IngredientsModel();

                if (!empty($formula_data)) {
                    $formula_data['dependency_id'] = $formula_id;
                    $copied_formula = $this->array_remove($formula_data, [
                        "formula_id" => "----remove----",
                        "created_at" => "----remove----",
                        "updated_at" => "----remove----",
                        "deleted_at" => "----remove----",
                    ]);

                    $copied_f_id = $formulaModel->insert($copied_formula);
                    
                    if (!empty($f_ingredient_data['f_ingredients'])) {
                        foreach ($f_ingredient_data['f_ingredients'] as $key => &$f_ingredient) {

                            $f_ing = (array) $f_ingredient;
                            $rem_per = strstr($f_ing['f_ingredients_qty'], '%', true);
                            if ($rem_per) {
                                $f_ing['f_ingredients_qty'] = $rem_per;
                            }

                            $f_ing['f_ingredients_formula'] = $copied_f_id;
                            array_push(
                                $copied_formula_ingredient,
                                $this->select(
                                    $f_ing,
                                    'f_ingredients_id,f_ingredients_formula,user_id,f_ingredients_ingredients,f_ingredients_qty,f_ingredients_phase,f_ingredients_instructions'
                                )
                            );

                        }
                    }
                    //dd($copied_formula_ingredient);

                    $allformula->insertBatch($copied_formula_ingredient);
                }

                return redirect()->back();
            }

            // Update (View)
            public function edit_formula($formula_id)
            {
                $allformula = new FormulaModel();
                $formula = $allformula->where("formula_id", $formula_id)->first();
                if (empty($formula))
                    return redirect()->back();
                $data["formula"] = $formula;
                echo view("pages/rd_formula_edit", $data);
            }

            // Update (Save)
            public function update_formula()
            {
                $formula_id = $this->request->getPost("formula_id");
                $data = $this->request->getPost();

                $this->upd_formula($data, $formula_id);
                return redirect()->back();
            }

            public function upd_formula($data, $formula_id): void
            {

                $updateformula = new FormulaModel();
                $builder = $updateformula->builder();
                $builder->where("formula_id", $formula_id);
                $builder->update($data);
            }

            // Delete
            public function delete_formula($formula_id = null)
            {
                $this->del_formula($formula_id);
                $f_ingModel = new Formula_IngredientsModel();
                $f_ingModel->del_FIng_formula_id($formula_id);
                return redirect()->back();
            }

            public function del_formula($formula_id = null): void
            {
                $allformula = new FormulaModel();
                $allformula->where('formula_id', $formula_id)->delete($formula_id);
            }



            // CRUD

        // Formulas //
    
    // Manufacturing //

    // Compliance //

        // Ingredient Batch //

            public function manuf_ingredient_batches_filtered_data($ingredient_id)
            {

                $allIngBatch = new IngredientBatchModel();
                $batchs = $allIngBatch->batchwithIng($ingredient_id);
                if (!empty($batchs)) {
                    foreach ($batchs as $key => $batch) {
                        $now = date('Y-m-d H:i:s');
                        $exp = date('Y-m-d H:i:s', strtotime($batch->ingredient_batch_expiry));
                        $batch->ingredient_batch_status = strtotime($now) < strtotime($exp) ? "Active" : "Expired";
                    }
                }
                return $batchs;
            }

            public function manuf_ingredient_batches_filtered($ingredient_id)
            {

                $this->session->set('active', '2');
                $this->session->set('sub', '1');
                $data["batchs"] = $this->manuf_ingredient_batches_filtered_data($ingredient_id);
                $allIng = new IngredientModel();
                $data['ingredients'] = $allIng->ingredientsWith();

                $ingredient = new IngredientModel();
                $data["ingredient"] = $ingredient->ingredientsWithsupplier($ingredient_id);

                echo view('templates/header', $this->subscription);
                echo view('pages/manufacturing', $this->subscription);
                echo view('pages/manufacturing_ingredients_filtered_batches', $data);
                echo view('templates/footer');
            }


            public function manuf_ingredient_batches_filtered_csv($ingredient_id)
            {
                $csv = new ExportCSV();
                $api = json_decode($this->manuf_ingredient_batches_filtered_api($ingredient_id), true);
                return $csv->exportcsv($api);
            }

            public function manuf_ingredient_batches_filtered_api($ingredient_id)
            {
                $data['data'] = $this->manuf_ingredient_batches_filtered_data($ingredient_id);
                $data['title'] = "Ingredient Batches";
                if (!empty($data['data'])) {
                    $data['title'] .= " [" . $data['data'][0]->ingredient_name . "]";
                }
                $data['header'] = [
                    "date_added" => "Date Added",
                    "ingredient_name" => "Ingredient",
                    "ingredient_inci" => "INCI",
                    "ingredient_batch_no" => "Batch #",
                    "ingredient_batch_supplier_id" => "Supplier",
                    "ingredient_batch_expiry" => "Expiry",
                    "ingredient_batch_qty" => "Qty (kg)",
                    "ingredient_batch_status" => "Status",
                ];
                $data['url'] = 'manufacturing_ingredients_view_batch/csv';
                $data['id'] = $ingredient_id;
                return json_encode($data);
            }

        // Ingredient Batch //

    // Compliance //

    // Formula Ingredients //
    public function rd_formula_ingredients_data($formula_id)
    {

        $allf_ingredients = new Formula_IngredientsModel();
        $data['f_ingredients'] = $allf_ingredients->f_ingredientsWith($formula_id);
        // dd($formula_id);
        $findFIng = $allf_ingredients->find();
        $qty = 0;
        $Tqty = 0;
        foreach ($findFIng as $key => $fIng) {
            $Tqty += (float) $fIng['f_ingredients_qty'];
        }
        if ($data['f_ingredients']) {
            foreach ($data['f_ingredients'] as $key => $manuf_batch) {
                $manuf_batch->f_ingredients_qty = $manuf_batch->f_ingredients_qty . '%';
                $manuf_batch->header = true;
                $manuf_batch->custom_ingredient = $manuf_batch->ingredient_name . ' / ' . $manuf_batch->ingredient_inci;
                if (gettype($manuf_batch) == 'array' || gettype($manuf_batch) == 'object') {
                    $qty += (float) $manuf_batch->f_ingredients_qty;
                }
            }
        }
        $data['total_percent'] = $qty;
        return $data;
    }

    public function rd_formula_ingredients_csv($formula_id)
    {
        $csv = new ExportCSV();
        $api = json_decode($this->rd_formula_ingredients_api($formula_id), true);
        return $csv->exportcsv($api);
    }

    public function rd_formula_ingredients_api($formula_id)
    {
        $data['data'] = $this->rd_formula_ingredients_data($formula_id);
        if (!empty($data['data'])) {
            $data['data'] = $data['data']['f_ingredients'];
        }
        $data['title'] = "Formula";
        $data['header'] = [
            "f_ingredients_phase" => "Phase",
            "custom_ingredient" => "Ingredient",
            "f_ingredients_qty" => "%",
            "f_ingredients_instructions" => "Instructions",
        ];
        $data['url'] = 'rd/formula_ingredients/csv';
        $data['id'] = $formula_id;
        return json_encode($data);
    }

    public function rd_formula_ingredients($formula_id)
    {

        $this->session->set('active', '2');
        $this->session->set('sub', '2');
        $data = $this->rd_formula_ingredients_data($formula_id);

        $allingredients = new IngredientModel();
        $data['ingredients'] = $allingredients->ingredientsWith();

        $allformula = new FormulaModel();
        $data['formula'] = $allformula->formulaWithf_ingredients($formula_id);

        echo view('templates/header', $this->subscription);
        echo view('pages/manufacturing', $this->subscription);
        echo view('pages/rd_formula_ingredients', $data);
        echo view('templates/footer');
    }

    // CRUD

    // Create
    public function add_formula_ingredient()
    {
        $allformula = new Formula_IngredientsModel();
        $data = [
            'f_ingredients_id' => $this->request->getVar('f_ingredients_id'),
            'f_ingredients_formula' => $this->request->getVar('f_ingredients_formula'),
            'f_ingredients_ingredients' => $this->request->getVar('f_ingredients_ingredients'),
            'f_ingredients_qty' => $this->request->getVar('f_ingredients_qty'),
            'f_ingredients_phase' => $this->request->getVar('f_ingredients_phase'),
            'f_ingredients_instructions' => $this->request->getVar('f_ingredients_instructions'),
        ];
        $allformula->insert($data);
        return redirect()->to("/rd/formula_ingredients/" . $data['f_ingredients_formula']);
    }

    // Update (View)
    public function edit_formula_ingredient($f_ingredients_id)
    {
        $allingredients = new IngredientModel();
        $data['ingredients'] = $allingredients->where(['user_id' => $this->user_id])->findAll();

        $allfingredients = new Formula_IngredientsModel();
        $data["f_ingredients"] = $allfingredients->where("f_ingredients_id", $f_ingredients_id)->first();
        echo view("pages/rd_formula_ingredients_edit", $data);
    }

    // Update (Save)
    public function update_formula_ingredient($f_ingredients_formula)
    {
        $f_ingredients_id = $this->request->getPost("f_ingredients_id");
        $updatefingredients = new Formula_IngredientsModel();
        $builder = $updatefingredients->builder();
        $builder->where("f_ingredients_id", $f_ingredients_id);
        $builder->update($this->request->getPost());
        return redirect()->to("/rd/formula_ingredients/" . $f_ingredients_formula);
    }

    // Delete
    public function delete_formula_ingredient($f_ingredients_id = null)
    {
        $allf_ingredients = new Formula_IngredientsModel();
        $data = $allf_ingredients->where('f_ingredients_id', $f_ingredients_id)->first();
        $allf_ingredients->where('f_ingredients_id', $f_ingredients_id)->delete($f_ingredients_id);
        return redirect()->to("/rd/formula_ingredients/" . $data['f_ingredients_formula']);
    }


    // CRUD

    // Formula Ingredients //

    // Production // 
    // Index
    public function manufacturing_production()
    {
        $this->session->set('active', '2');
        $this->session->set('sub', '3');

        $allformula = new FormulaModel();
        $data['formula'] = $allformula->formulaWithPlanManu();

        $allproduction = new Manuf_ProductionModel();
        $data['manuf_production'] = $allproduction->manufproductWith();

        echo view('templates/header', $this->subscription);
        echo view('pages/manufacturing', $this->subscription);
        echo view('pages/manufacturing_production', $data);
        echo view('templates/footer');
    }

    // CRUD

    // Create
    public function add_manuf_production()
    {
        $allproduction = new Manuf_ProductionModel();
        $data = [
            'manuf_product_date' => $this->request->getVar('manuf_product_date'),
            'manuf_product_formula' => $this->request->getVar('manuf_product_formula'),
            'manuf_product_creator' => $this->request->getVar('manuf_product_creator'),
            'manuf_product_qty' => $this->request->getVar('manuf_product_qty'),
            'manuf_product_status' => $this->request->getVar('manuf_product_status'),
            'manuf_comments' => $this->request->getVar('manuf_comments'),
            'manuf_product_batch' => $this->request->getVar('manuf_product_batch'),
        ];
        $allproduction->insert($data);
        return redirect()->back();
    }

    // Update - (View)
    public function edit_manuf_production($manuf_product_id)
    {
        $allformulas = new FormulaModel();
        $data['formula'] = $allformulas->formulaWithPlan();
        $allproductions = new Manuf_ProductionModel();
        $data["manuf_production"] = $allproductions->find($manuf_product_id);

        echo view("pages/manufacturing_production_edit", $data);
    }

    // Update - (Save)
    public function update_manuf_production()
    {
        $manuf_product_id = $this->request->getPost("manuf_product_id");
        $updateproduct = new Manuf_ProductionModel();
        $builder = $updateproduct->builder();
        $builder->where("manuf_product_id", $manuf_product_id);
        $builder->update($this->request->getPost());
        return redirect()->back();
    }

    // Delete
    public function delete_manuf_production($manuf_product_id = null)
    {
        $allproduction = new Manuf_ProductionModel();
        $data['manuf_production'] = $allproduction->where('manuf_product_id', $manuf_product_id)->delete($manuf_product_id);
        return redirect()->back();
    }

    // CRUD

    // Production Batch //

    public function manuf_production_batch($manuf_product_id)
    {
        $manuf_batch = $this->manuf_production_batch_data($manuf_product_id);
        $data['manuf_batch'] = $manuf_batch[0];
        $data['manuf_batchs'] = $manuf_batch[1];

        echo view('templates/header', $this->subscription);
        echo view('pages/manufacturing', $this->subscription);
        echo view('pages/manufacturing_production_batch', $data);
        echo view('templates/footer');
    }


    public function manuf_production_batch_data($manuf_product_id)
    {

        $allbatch = new Manuf_ProductionBatchModel();
        $allIngBatch = new IngredientBatchModel();

        $manuf_batch = [];
        $manuf_batchs = $allbatch->productionbatchWith($manuf_product_id);
        // dd($manuf_batchs);
        if ($manuf_batchs != null) {
            $checkBa = [];
            foreach ($manuf_batchs as $batch) {
                $batch = (array) $batch;
                $ba = $allbatch->where([
                    'manuf_production_batch_production' => $batch['manuf_product_id'],
                    'f_ingredients_id' => $batch['f_ingredients_id'],
                    'user_id' => $this->user_id
                ])->first();
                if ($ba != null) {
                    $checkBa[$ba['manuf_production_batch_id']] = 1;
                    $batch['manuf_production_batch_qty'] = $ba['manuf_production_batch_qty'];
                    $ingredient_batch = $allIngBatch->select('ingredient_batch_no')->asObject()->find($ba['production_batch_ingredient_batch']);
                    $batch['production_batch_ingredient_batch'] = isset($ingredient_batch->ingredient_batch_no) ? $ingredient_batch->ingredient_batch_no : '';
                } else {
                    $bas = $allbatch->where([
                        'manuf_production_batch_production' => $batch['manuf_product_id'],
                        'manuf_production_batch_ingredients' => $batch['ingredient_id'],
                        'user_id' => $this->user_id
                    ])->findAll();
                    if($bas != null) {
                        $compare = 9999999;
                        $compare_id = null;
                        $idealActual = (float)$batch['manuf_product_qty'] * (float)$batch['f_ingredients_qty'] / (float)100;
                        foreach($bas as $ba) {
                            if(isset($checkBa[$ba['manuf_production_batch_id']]) || $ba['f_ingredients_id']) continue;
                            $dif = abs((float)$idealActual-(float)$ba['manuf_production_batch_qty']);
                            
                            if($compare > $dif) {
                                $compare = $dif;
                                $compare_id = $ba['manuf_production_batch_id'];
                            }
                        }
                        if($compare == 9999999) {
                            $batch['production_batch_ingredient_batch'] = '';
                            $batch['manuf_production_batch_qty'] = '';
                        } else {
                            $checkBa[$compare_id] = 1;
                            $ba = $allbatch->where('manuf_production_batch_id', $compare_id)->first();
                            $batch['manuf_production_batch_qty'] = $ba['manuf_production_batch_qty'];
                            $ingredient_batch = $allIngBatch->select('ingredient_batch_no')->asObject()->find($ba['production_batch_ingredient_batch']);
                            $batch['production_batch_ingredient_batch'] = isset($ingredient_batch->ingredient_batch_no) ? $ingredient_batch->ingredient_batch_no : '';
                        }
                    } else {
                        $batch['production_batch_ingredient_batch'] = '';
                        $batch['manuf_production_batch_qty'] = '';
                    }
                }

                $ingreBatchs = $allIngBatch->where('ingredient_id', $batch['ingredient_id'])->select('ingredient_batch_no,ingredient_batch_id,ingredient_batch_expiry')->asObject()->findAll();
                $batch['manuf_batchs'] = null;
                if (!empty($ingreBatchs)) {
                    foreach ($ingreBatchs as $key => $ingreBatch) {
                        $now = date('Y-m-d H:i:s');
                        $exp = date('Y-m-d H:i:s', strtotime($ingreBatch->ingredient_batch_expiry));
                        if (strtotime($now) < strtotime($exp)) {
                            $ingreBatch->ingredient_batch_status = "Active";
                            $ingreBatch->isExpired = false;
                        } else {
                            $ingreBatch->ingredient_batch_status = "Expired";
                            $ingreBatch->isExpired = true;
                        }

                    }
                    $batch['manuf_batchs'] = $ingreBatchs;
                }
                array_push($manuf_batch, $batch);
            }
        }
        if (!empty($manuf_batch)) {
            foreach ($manuf_batch as $key => $batch) {
                $f_ingredients_qty = $batch['f_ingredients_qty'];
                $manuf_product_qty = $batch['manuf_product_qty'];
                $percent = 100;
                $manuf_batch[$key]['sum_total'] = (float)$manuf_product_qty * (float)$f_ingredients_qty / (float)$percent;
            }
        }

        // dd($manuf_batch);
        return [$manuf_batch, $manuf_batchs];
    }

    public function manuf_production_batch_api($manuf_product_id)
    {
        $manuf_batchs = $this->manuf_production_batch_data($manuf_product_id);
        $data['data'] = [];
        $data['title'] = "Production";
        if (!empty($manuf_batchs)) {
            $data['data'] = $manuf_batchs[0];
            $data['title'] .= " [#" . $manuf_batchs[0][0]['manuf_product_batch'] . " - " . $manuf_batchs[0][0]['manuf_product_status'] . "]";
        }

        $data['header'] = [
            "f_ingredients_phase" => "Phase",
            "ingredient_name" => "Ingredient",
            "ingredient_inci" => "INCI",
            "f_ingredients_instructions" => "Instructions",
            "f_ingredients_qty" => "%",
            "sum_total" => "Amount (g)",
            "manuf_production_batch_qty" => "Actual (g)",
            "production_batch_ingredient_batch" => "Ingredient Batch",
        ];
        $data['url'] = 'manufacturing/manuf_production_batch/csv';
        $data['id'] = $manuf_product_id;
        return json_encode($data);

    }

    public function manuf_production_batch_csv($manuf_product_id)
    {
        $csv = new ExportCSV();
        $api = json_decode($this->manuf_production_batch_api($manuf_product_id), true);
        return $csv->exportcsv($api);
    }

    // Batch CRUD

    // Add
    public function add_test_batch()
    {
        $alltestbatch = new RdProduction_BatchModel();
        $data = [
            'production_batch_qty' => $this->request->getVar('production_batch_qty'),
            'production_batch_production' => $this->request->getVar('production_batch_production'),
            'production_batch_ingredients' => $this->request->getVar('production_batch_ingredients'),
        ];
        $alltestbatch->insert($data);
        return redirect()->back();
    }

    // update
    public function add_manuf_batch()
    {
        $new_stock_data = [];
        $new_stock_batch = [];
        $f_ingredients = [];
        $productioncheck_data = [];
    //    $productioncheck_data = $this->request->getPost('data');
        $data_number = $this->request->getPost('data_number');
        for($i=0 ; $i<=$data_number ; $i++) {
            $productioncheck_data[$i] = array(
                $this->request->getPost('manuf_production_batch_production_' . $i),
                $this->request->getPost('manuf_production_batch_ingredients_' . $i),
                $this->request->getPost('production_name_' . $i),
                $this->request->getPost('manuf_production_batch_qty_' . $i),
                $this->request->getPost('f_ingredients_id_' . $i),
                $this->request->getPost('ingredients_batch_id_' . $i)
            );
        }
        $updateRdProd = new RdProductionModel();
        $updateManuf = new Manuf_ProductionModel();

        $insertRdProdBatch = new RdProduction_BatchModel();
        $insertManufProdBatch = new Manuf_ProductionBatchModel();
        $upt_f_ingredient = new Formula_IngredientsModel();
        $upd_f_ingredient = $upt_f_ingredient->builder();

        $rd_builder = $updateRdProd->builder();
        $mnf_builder = $updateManuf->builder();
        $qty = 0;

        // $productioncheck_data = null;
        if ($productioncheck_data != null) {
            foreach ($productioncheck_data as $row) {
                $tbl = $row[2] == "product" ? "product" : "manuf_product";
                if (preg_match('/^[0-9]+?$/', $row[3])) {
                    $qty += (float)$row[3];
                }
                array_push($new_stock_data, [
                    $tbl . "_id" => $row[0],
                    $tbl . "_qty" => $qty,
                    $tbl . "_status" => "Produced",
                ]);
                $tbl_b = $row[2] == "product" ? "production_batch" : "manuf_production_batch";
                array_push($new_stock_batch, [
                    $tbl_b . "_production" => $row[0],
                    $tbl_b . "_ingredients" => $row[1],
                    $tbl_b . "_qty" => $row[3],
                    "f_ingredients_id" => isset($row[4]) ? $row[4] : '',
                    "production_batch_ingredient_batch" => isset($row[5]) ? $row[5] : '',
                ]);
                array_push($f_ingredients, [
                    "f_ingredients_id" => $row[4],
                    "f_ingredients_qty" => $row[3]
                ]);
            }

            // echo "<pre>";print_r($new_stock_data);echo "</pre>";die;
            // echo gettype($f_ingredients);
            // echo "<pre>";print_r($f_ingredients);echo "</pre>";
            // die;


            /* 
             * Insert in Rd/Manuf Production Batch
             */

            // foreach ($f_ingredients as $ingredients) {
            //     $ings = $upt_f_ingredient->where("f_ingredients_id", $ingredients['f_ingredients_id'])->first();
            //     log_message('info', 'value----' . json_encode($ingredients));
            //     log_message('info', 'value****' . $ings['f_ingredients_qty']);
                
            //     $f_qty = isset($ings['f_ingredients_qty']) ? $ings['f_ingredients_qty'] : 0;
            //     $upd_f_ingredient->where("f_ingredients_id", $ingredients['f_ingredients_id']);
            //     if (preg_match('/^[0-9]+?$/', trim($f_qty)) && preg_match('/^[0-9]+?$/', trim($ingredients['f_ingredients_qty']))) {
            //         if ($f_qty != '' && $f_qty > 0) {
            //             $f_qty = $f_qty - isset($ingredients['f_ingredients_qty']) ? $ingredients['f_ingredients_qty'] : 0;
            //             log_message('info', 'value****-----' . $f_qty);
                        
            //             $upd_f_ingredient->update(['f_ingredients_qty' => $f_qty > 0 ? $f_qty : 0]);
            //         }
            //     }    
            // }
            foreach ($new_stock_batch as $key => $batchs) {

                $allingredients = new IngredientModel();
                $ing_builder = $allingredients->builder();
                if (isset($batchs['production_batch_production'])) {
                    $insertRdProdBatch->insert($batchs);
                    $ing = $allingredients->where("ingredient_id", $batchs['production_batch_ingredients'])->first();
                    $ing_builder->where('ingredient_id', $batchs['production_batch_ingredients']);
                    $qty = isset($ing['ingredient_qty']) ? $ing['ingredient_qty'] : 0;
                    // echo "<pre>";print_r($ing);echo "</pre>";

                    if (preg_match('/^[0-9]+?$/', trim($qty)) && preg_match('/^[0-9]+?$/', trim($batchs['production_batch_qty']))) {
                        if ($qty != '' || $qty > 0) {
                            $batch = isset($batchs['production_batch_qty']) ? (int) $batchs['production_batch_qty'] : 0;
                            $qty = (int) $qty - (int) $batch;
                            $ing_builder->update(['ingredient_qty' => $qty > 0 ? $qty : 0]);
                        }
                    }
                } else if (isset($batchs['manuf_production_batch_production'])) {
                    // $insertManufProdBatch->insert($batchs);
                    $mpb_id = $insertManufProdBatch->insert($batchs);
                    $upt_f_ingredient = new Formula_IngredientsModel();
                    $upd_f_ingredient = $upt_f_ingredient->builder();
                    $upd_f_ingredient->where("f_ingredients_id", $batchs['f_ingredients_id']);
                    $upd_f_ingredient->update(['manuf_production_batch' => $mpb_id]);
                    //echo "<pre>";print_r($batchs);echo "</pre>";
                    $ing = $allingredients->where("ingredient_id", $batchs['manuf_production_batch_ingredients'])->first();
                    $ing_builder->where('ingredient_id', $batchs['manuf_production_batch_ingredients']);

                    $qty = isset($ing['ingredient_qty']) ? $ing['ingredient_qty'] : 0;

                    if (preg_match('/^[0-9]+?$/', trim($qty)) && preg_match('/^[0-9]+?$/', trim($batchs['manuf_production_batch_qty']))) {
                        if ($qty != '' || $qty > 0) {
                            $batch = isset($batchs['manuf_production_batch_qty']) ? $batchs['manuf_production_batch_qty'] : 0;
                            $qty = (int) $qty - (int) $batch;
                            $ing_builder->update(['ingredient_qty' => $qty > 0 ? $qty : 0]);
                        }
                    }
                }

            }
            /* 
             *updating RD/Manu Production 
             */
            foreach ($new_stock_data as $key => $data) {

                $rd_manf_product_id = $data["manuf_product_id"] ?? $data["product_id"];
                if (isset($data["manuf_product_id"])) {
                    $findMan_Prod = $updateManuf->find($rd_manf_product_id);
                    $data["manuf_product_qty"] = isset($data["manuf_product_qty"]) ? $findMan_Prod["manuf_product_qty"] : $data["manuf_product_qty"];  //$findMan_Prod["manuf_product_qty"];
                    $batchNo = $findMan_Prod["manuf_product_batch"];
                    $data['manuf_product_batch'] = $batchNo;
                    $mnf_builder->where("manuf_product_id", $rd_manf_product_id);
                    // echo "<pre>";print_r($data);echo "</pre>";
                    $mnf_builder->update($data);
                } else if (isset($data["product_id"])) {
                    $findRd_Prod = $updateRdProd->find($rd_manf_product_id);
                    $data["product_qty"] = $findRd_Prod["product_qty"]; //!$data["product_qty"] ? $findRd_Prod["product_qty"] : $data["product_qty"];
                    $batchNo = $findRd_Prod["manuf_product_batch"];
                    $data['product_batch'] = $batchNo;
                    $rd_builder->where("product_id", $rd_manf_product_id);
                    $rd_builder->update($data);
                }
            }

        }
        return redirect()->back();
    //    echo json_encode(array("status" => "success"));

    }

    // Batch CRUD

    // Production Batch //

    // Production //

    // Manufacturing //

    // Compliance //

    // PIF //

    // Index

    public function rd_cpn()
    {

        $this->session->set('active', '3');
        $this->session->set('sub', '1');

        $allusers = new UserModel();
        $data['users'] = $allusers->where(['user_id' => $this->user_id])->findAll();

        $allformulas = new FormulaModel();
        $data['formula'] = $allformulas->formulaWith();

        $allcpn = new CPNModel();
        $data['cpn'] = $allcpn->cpnWith();

        echo view('templates/header', $this->subscription);
        echo view('pages/rd');
        echo view('pages/rd_cpn', $data);
        echo view('templates/footer');
    }

    // CRUD 

    // Create
    public function rd_cpn_add()
    {

        $allcpn = new CPNModel();

        $data = [
            'cpn_id' => $this->request->getPost('cpn_id'),
            'cpn_date' => $this->request->getPost('cpn_date'),
            'cpn_formula' => $this->request->getPost('cpn_formula'),
            'cpn_rp' => $this->request->getPost('cpn_rp'),
            'cpn_user' => $this->request->getPost('cpn_user'),
        ];


        $date = date('dhis');
        if ($this->validateFileIB($this->request->getFile("invoice_file"))) {

            $file = $this->request->getFile('invoice_file');
            $newfilename = $this->request->getPost('cpn_formula') . "_" . $this->request->getPost('cpn_date') . $date;

            $cpn_id = $allcpn->insert($data);
            $result = $this->upload_file_history([
                'file_directory' => 'PIF Files',
                'file_upload' => $file,
                'file_page_name' => 'PIF Files',
                'newfilename' => $newfilename . "." . $file->getExtension(),
                'page_id' => $cpn_id,
            ]);
        }
        return redirect()->back();
    }

    // Retrieve
    public function rd_cpn_view($cpn_id)
    {
        $allcpn = new CPNModel();
        $data["cpn"] = $allcpn->cpnWithformula($cpn_id);
        $allFiles = new AllFiles();

        $data["file_history"] = $allFiles->getFiles([
            'table' => 'tbl_cpn',
            'table_id' => 'cpn_id',
            'search_id' => $cpn_id,
            'page_name' => 'PIF Files'
        ]);

        if (!empty($data["file_history"])) {
            foreach ($data["file_history"] as $file_key => $files) {
                $files->file_directory = $this->safeEncrypt($files->file_directory);
                $files->file_upload = $this->safeEncrypt($files->file_upload);
            }
        }

        echo view('templates/header', $this->subscription);
        echo view('pages/rd');
        echo view("pages/rd_cpn_view", $data);
        echo view('templates/footer');
    }

    // Update (View)
    public function rd_cpn_edit($cpn_id)
    {

        $allusers = new UserModel();
        $data['users'] = $allusers->where(['user_id' => $this->user_id])->findAll();

        $allformulas = new FormulaModel();
        $data['formula'] = $allformulas->formulaWith();

        $allcpn = new CPNModel();
        $data['cpn'] = $allcpn->cpnWithformula($cpn_id);

        echo view("pages/rd_cpn_edit", $data);
    }


    // Update (Save)
    public function rd_cpn_update()
    {
        $cpn_id = $this->request->getPost("cpn_id");
        $dir = 'PIF Files';
        $filename = $this->request->getFile("invoice_file");
        $existFile = $this->request->getPost("invoice_exist_file");
        $updatecpn = new CPNModel();
        $builder = $updatecpn->builder();
        $data = $this->request->getPost();
        $remv = [
            "invoice_dir" => "/remove",
            "invoice_exist_file" => "remove/"
        ];

        if (!$existFile) {
            $existFile .= "no_file/";
        }
        $data = \array_diff_key($data, $remv);

        $date = date('dhis');
        if ($this->validateFileIB($this->request->getFile("invoice_file"))) {

            $newfilename = $this->request->getPost('cpn_formula') . "_" . $this->request->getPost('cpn_date') . $date;

            $result = $this->upload_file_history([
                'file_directory' => $dir,
                'file_upload' => $filename,
                'file_page_name' => 'PIF Files',
                'newfilename' => $newfilename . "." . $filename->getExtension(),
                'page_id' => $cpn_id,
            ]);
        }
        $builder->where("cpn_id", $cpn_id);
        $builder->update($data);
        return redirect()->back();
    }

    // Delete
    public function rd_cpn_delete($cpn_id = null)
    {
        $allcpn = new CPNModel();
        $data['cpn'] = $allcpn->where('cpn_id', $cpn_id)->delete($cpn_id);
        return redirect()->back();
    }

    // CRUD

    // PIF //

    // Ingredient Batch // 

    public function manuf_ingredient_batches()
    {
        $this->session->set('active', '3');
        $this->session->set('sub', '2');

        $data['batchs'] = $this->manuf_ingredient_batches_data();
        ;

        $allIng = new IngredientModel();
        $data['ingredients'] = $allIng->ingredientsWith();

        echo view('templates/header', $this->subscription);
        echo view('pages/rd');
        echo view('pages/manufacturing_ingredient_batch', $data);
        echo view('templates/footer');
    }

    public function manuf_ingredient_batches_data()
    {

        $allIngBatch = new IngredientBatchModel();
        $batchs = $allIngBatch->ingredientsWithBatch();
        if (!empty($batchs)) {
            foreach ($batchs as $key => $batch) {
                $now = date('Y-m-d H:i:s');
                $exp = date('Y-m-d H:i:s', strtotime($batch->ingredient_batch_expiry));
                $batch->ingredient_batch_status = strtotime($now) < strtotime($exp) ? "Active" : "Expired";
            }
        }
        return $batchs;
    }

    public function manuf_ingredient_batches_csv()
    {
        $csv = new ExportCSV();
        $api = json_decode($this->manuf_ingredient_batches_api(), true);
        return $csv->exportcsv($api);
    }

    public function manuf_ingredient_batches_api()
    {
        $data['data'] = $this->manuf_ingredient_batches_data();
        $data['title'] = "All Ingredient Batches";
        $data['header'] = [
            "date_added" => "Date Added",
            "ingredient_name" => "Ingredient",
            "ingredient_inci" => "INCI",
            "ingredient_batch_no" => "Batch #",
            "ingredient_batch_supplier_id" => "Supplier",
            "ingredient_batch_expiry" => "Expiry",
            "ingredient_batch_qty" => "Qty (kg)",
            "ingredient_batch_status" => "Status",
        ];
        $data['url'] = 'manufacturing/ingredientbatches/csv';
        $data['id'] = null;
        return json_encode($data);
    }

    // Create
    public function manuf_ingredient_batches_add()
    {

        $allbatch = new IngredientBatchModel();
        $file = $this->request->getFile('invoice_file');

        $data = [
            'ingredient_batch_id' => $this->request->getPost('ingredient_batch_id'),
            'ingredient_id' => $this->request->getPost('ingredient_id'),
            'ingredient_batch_no' => $this->request->getPost('ingredient_batch_no'),
            'ingredient_batch_expiry' => $this->request->getPost('ingredient_batch_expiry'),
            'ingredient_batch_supplier_id' => $this->request->getPost('ingredient_batch_supplier_id'),
            'user_id' => $this->request->getPost('user_id'),
            'ingredient_batch_qty' => $this->request->getPost('ingredient_batch_qty'),
            'date_added' => $this->request->getPost('date_added'),
        ];

        $ing_batch_id = $allbatch->insert($data);

        $date = date('dhis');
        if ($this->validateFileIB($this->request->getFile('invoice_file'), 'required')) {
            $newfilename = "IBN-" . $this->request->getPost('ingredient_id') . "-" . $this->request->getPost('ingredient_batch_expiry');

            $result = $this->upload_file_history([
                'file_directory' => 'PR2-5 - Ingredient Batches',
                'file_upload' => $file,
                'file_page_name' => 'Ingredient Batches',
                'newfilename' => $newfilename . "." . $file->getExtension(),
                'page_id' => $ing_batch_id,
            ]);
        }

        return redirect()->back();
    }


    public function checkQty($def = 0)
    {
        $item_id = $this->request->getPost('item_id');
        $item_name = $this->request->getPost('item_name');
        $item_qty = $this->request->getPost('item_qty');
        $total = 0;
        if ($item_name == 'ingredient') {
            $ingred = new IngredientModel();
            $meanQty = $ingred->find($item_id);
            // $itemsQty = $ingred->stockWithDelivery($item_id);
        } else {
            return json_encode(["remaining" => "Please select Item"]);
        }
        if ($item_id == 0) {
            return json_encode(["remaining" => "Please select Item"]);
        }

        $parQty = $meanQty[$item_name . '_qty'];
        $rem = (int) $parQty;
        return json_encode(["remaining" => "<span>" . strtoupper($item_name) . "</span> Qty: <b data-remain=$rem>" . $rem . "</b>"]);
    }

    // Retrieve
    public function view_ingredientbatch($ingredient_id)
    {
        $allingredientBatch = new IngredientBatchModel();
        $data["ingredientbatch"] = $allingredientBatch->ingredientsBatch($ingredient_id);
        $allFiles = new AllFiles();

        $data["file_history"] = $allFiles->getFiles([
            'table' => 'tbl_ingredients_batch',
            'table_id' => 'ingredient_batch_id',
            'search_id' => $ingredient_id,
            'page_name' => 'Ingredient Batches'
        ]);

        $datas = $this->file_history($data);
        $data = $datas;
        // if(!empty($data["file_history"])) {
        //     foreach($data["file_history"] as $file_key => $files) {
        //         $files->file_directory = $this->safeEncrypt($files->file_directory);
        //         $files->file_upload = $this->safeEncrypt($files->file_upload);
        //     }
        // }

        echo view("pages/manufacturing_ingredient_batch_view", $data);
    }

    // Update Ingredient batch - (View)
    public function edit_ingredientbatch($ingredient_batch_id)
    {
        $allingredients = new IngredientModel();
        $data['ingredients'] = $allingredients->where(['user_id' => $this->user_id])->findAll();

        $ingredient_batch = new IngredientBatchModel();
        $data['ingredient_batch'] = $ingredient_batch->ingredientsBatch($ingredient_batch_id);

        echo view("pages/manufacturing_ingredients_edit_batch", $data);
    }

    private function validateFileIB($file, $req = 'max_length[20000]')
    {

        $fileValidate = [
            "invoice_file" => [
                $req,
                'uploaded[invoice_file]',
                'max_size[invoice_file, 2048]',
                'ext_in[invoice_file,pdf]',
                'errors' => [
                    'max_size' => 'Too large file! File must not be more than 2MB.',
                    'ext_in' => 'File must be PDF format',
                    'required' => 'File is required',
                ]
            ],
        ];

        if ($file->isValid()) {
            if ($this->validate($fileValidate)) {
                return true;
            } else {
                // dd($this->validator->getErrors()['invoice_file']);
                return redirect()->back()->with('error', $this->validator->getErrors()['invoice_file']);
                exit(1);
            }
        }
        return false;
    }
    // Update Ingredient batch - (update)
    public function update_ingredientbatch()
    {
        $now = new DateTime("now", new DateTimeZone("Europe/London"));
        $ingredient_batch_id = $this->request->getPost("ingredient_batch_id");
        $updateingredient = new IngredientBatchModel();
        $builder = $updateingredient->builder();
        $builder->where("ingredient_batch_id", $ingredient_batch_id);

        $data = $this->request->getPost();

        $dir = 'PR2-5 - Ingredient Batches';

        if ($this->validateFileIB($this->request->getFile("invoice_file"))) {
            $filename = $this->request->getFile("invoice_file");
            $date = date('dhis');
            // $newfilename = $now->format('Y-m-d H:i:s')."_DID_".$this->request->getVar('delivery_id')."_IDI_".$this->request->getVar('delivery_ingredient_item')."_SID".$this->request->getVar('supplier_id');
            $newfilename = "IBN-" . $this->request->getPost('ingredient_id') . "-" . $this->request->getPost('ingredient_batch_expiry');
            $this->upload_file_history([
                'file_directory' => $dir,
                'file_upload' => $filename,
                'file_page_name' => 'Ingredient Batches',
                'newfilename' => $newfilename . "." . $filename->getExtension(),
                'page_id' => $ingredient_batch_id,
            ]);
        }
        $existFile = $this->request->getPost("invoice_exist_file");
        $data = $this->request->getPost();
        $remv = [
            "invoice_exist_file" => "remove/"
        ];
        if (!$existFile) {
            $existFile .= "no_file/";
        }
        $data = \array_diff_key($data, $remv);


        $builder->update($data);
        return redirect()->back();
    }

    // Delete Ingredient Batch
    public function delete_ingredientbatch($ingredientbatch_id)
    {
        $allingredientbatch = new IngredientBatchModel();
        $allingredientbatch->delete($ingredientbatch_id);
        return redirect()->back();
    }

    // Ingredient Batch //

    // Batch Certificates //
    public function manuf_batch_certificates()
    {

        $this->session->set('active', '3');
        $this->session->set('sub', '3');

        $allManProd = new Manuf_ProductionModel();
        $data['manuprod'] = $allManProd->manufproductWithBatch();

        echo view('templates/header', $this->subscription);
        echo view('pages/rd');
        echo view('pages/manufacturing_batch_certificates', $data);
        echo view('templates/footer');
    }

    public function batch_certificates_view_man($manuf_product_id)
    {

        $batch_cert = $this->batch_certificates_view_man_data_update($manuf_product_id);
        $data['manuprodIng'] = $batch_cert[0];
        $data['manuprod'] = $batch_cert[1];
        echo view("pages/manufacturing_batch_certificate_view_man", $data);
    }

    public function batch_certificates_view_man_data_update($manuf_product_id)
    {
        $allManProd = new Manuf_ProductionBatchModel();
        $allIngredient = new IngredientModel();
        $allIngredientBatch = new IngredientBatchModel();

        $manuprod = $allManProd->productionbatchWith($manuf_product_id);
        $manprodIng = [];
        $manuf_production_batchs = $allManProd->where('manuf_production_batch_production', $manuf_product_id)->find();
    
        if($manuf_production_batchs) {
            foreach($manuf_production_batchs as $batch) {
                $ingredient_name = '';
                $ingredient_batch_no = '';
                $ingredient_batch_supplier = '';
                $ingredient_name = $allIngredient->where('ingredient_id', $batch['manuf_production_batch_ingredients'])->select('ingredient_name')->first();
                if($ingredient_name) {
                    $ingredient_name = $ingredient_name['ingredient_name'];
                }
                $ingredientBatch = $allIngredientBatch->where('ingredient_batch_id', $batch['production_batch_ingredient_batch'])->first();
                
                if($ingredientBatch) {
                    $ingredient_batch_no = $ingredientBatch['ingredient_batch_no'];
                    $ingredient_batch_supplier = $ingredientBatch['ingredient_batch_supplier_id'];
                }
                $manprodIng[] = [
                    'ingredient_name' => $ingredient_name,
                    'ingredient_batch_no' => $ingredient_batch_no,
                    'ingredient_batch_supplier_id' => $ingredient_batch_supplier,
                    'manuf_production_batch_qty' => $batch['manuf_production_batch_qty']
                ];
            }
        }
        return [$manprodIng, $manuprod];
    }

    public function batch_certificates_view_man_data($manuf_product_id)
    {
        $allManProd = new Manuf_ProductionBatchModel();

        $manuprodIng = $allManProd->productionWithIngredients($manuf_product_id);
        $manuprod = $allManProd->productionbatchWith($manuf_product_id);
        $manprodIng = [];
        if ($manuprodIng != null) {
            $dup = [];
            $index = [];
            foreach ($manuprodIng as $batch) {
                $ba = $allManProd->where([
                    'manuf_production_batch_production' => $batch->manuf_product_id,
                    'manuf_production_batch_ingredients' => $batch->ingredient_id
                ])->find();
                if(array_key_exists($batch->ingredient_id, $index)) {
                    $index[$batch->ingredient_id]++;
                } else {
                    $index[$batch->ingredient_id] = 0;
                }
                $ingredient_index = $index[$batch->ingredient_id]; 
                if ($ba[$ingredient_index] != null) {
                    $batch->manuf_production_batch_qty = $ba[$ingredient_index]['manuf_production_batch_qty'];
                } else {
                    $batch->manuf_production_batch_qty = '';
                }
                if (!in_array($batch->manuf_production_batch_id, $dup)) {
                    array_push($manprodIng, $batch);
                    array_push($dup, $batch->manuf_production_batch_id);
                }

            }
        }

        return [$manprodIng, $manuprod];
    }

    public function batch_certificates_view_man_api($manuf_product_id)
    {
        $manuprod = $this->batch_certificates_view_man_data($manuf_product_id);
        // dd($manuprod[0]);

        $data['data'] = [];
        $data['title'] = "Production Batch Certificate";
        $data['headerInfo'] = null;
        if (!empty($manuprod)) {
            $data['data'] = $manuprod[0];
            $data['title'] .= " [ #" . $manuprod[1][0]->manuf_product_batch . " ]"; // - ". $manuprod[1][0]->user_first_name." ". $manuprod[1][0]->user_last_name."

            $data['headerInfo'] = [
                $manuprod[1][0],
                [
                    "manuf_product_batch" => "Batch ID",
                    "formula_rdplan" => "Product",
                    "manuf_product_date" => "Manufactured Date",
                    "user_first_name" => "Batch Creator",
                    "manuf_product_qty" => "Qty",
                ]
            ];
        }
        $data['header'] = [
            "ingredient_date" => "Date",
            "product_name" => "Product",
            "product_version" => "Version",
            "ingredient_name" => "Ingredient",
            "ingredient_batch_supplier_id" => "Supplier",
            "ingredient_batch_no" => "Batch #",
            "manuf_production_batch_qty" => "Qty (kg)",
        ];
        $data['url'] = 'batchcertificatesviewman/csv';
        $data['id'] = $manuf_product_id;
        return json_encode($data);

    }

    public function batch_certificates_view_man_csv($manuf_product_id)
    {
        $csv = new ExportCSV();
        $api = json_decode($this->batch_certificates_view_man_api($manuf_product_id), true);
        return $csv->exportcsv($api);
    }


    // Batch Certificates //

    // Compliance //

    // Planning //

    public function fetch_models($model_id)
    {
        $this->session->set('active', '4');
        $data['user_id'] = $this->user_id;
        $data['model_id'] = $model_id;

        echo view('templates/header', $this->subscription);
        echo view('pages/allModelDocument', $data);
        echo view('templates/footer');
    }

    public function fetch_models_api()
    {
        $model_id = $this->request->getPost('model_id');
        $overview = url_to('model_overview', $model_id);
        return json_encode([
            $overview
        ]);
    }

    public function planning()
    {

        $this->session->set('active', '4');
        $this->session->set('sub', '2');

        $allbudgets = new ModelsModel();
        $data['models'] = $allbudgets->where(['user_id' => $this->user_id])->findAll();

        $data['models_gets'] = array();

        $get_models = array();
        foreach ($data['models'] as $key => $model) {
            $corpModels = null;
            $getMktModel = $this->get_models_marketing($model['models_id']);
            
            if (!empty($getMktModel)) {
                array_push($data['models_gets'], $getMktModel);
                if(isset($data['models_gets'][$key])) {
                    $corpModels = new GetCorpModel($data['models_gets'][$key]);
                    if (isset($corpModels->export_var[0])) {
                        array_push($get_models, $corpModels->export_var[0]);
                    }
                }
            }
        }
        if ($data['models']) {
            foreach ($data['models'] as $key => $model) {
                $data['models'][$key]['get_overall'] = null;
                if (isset($get_models[$key])) {
                    $data['models'][$key]['get_overall'] = $get_models[$key];
                }
            }
        }
        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models', $data);
        echo view('templates/footer');
    }

    public function corporate_models()
    {

        $this->session->set('active', '4');
        $this->session->set('sub', '1');

        $allbudgets = new ModelsModel();
        $data['models'] = $allbudgets->where(['user_id' => $this->user_id])->findAll();

        $data['models_gets'] = array();

        $get_models = array();
        foreach ($data['models'] as $key => $model) {
            $corpModels = null;
            $getMktModel = $this->get_models_marketing($model['models_id']);
            if (!empty($getMktModel)) {
                array_push($data['models_gets'], $getMktModel);
                $corpModels = new GetCorpModel($data['models_gets'][$key]);
                if (isset($corpModels->export_var[0])) {
                    array_push($get_models, $corpModels->export_var[0]);
                }
            }
        }
        if ($data['models']) {
            foreach ($data['models'] as $key => $model) {
                $data['models'][$key]['get_overall'] = null;
                if (isset($get_models[$key])) {
                    $data['models'][$key]['get_overall'] = $get_models[$key];
                }
            }
        }
        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models', $data);
        echo view('templates/footer');
    }

    public function viewTable()
    {
        $data['ejsyncfusion'] = $this->data['ejsyncfusion'];
        $data['view_table'] = $this->data['ViewTable'];
        echo view('templates/viewTable', $data);
    }

    public function exportPDF()
    {

        $allbudgets = new ModelsModel();
        $data['models'] = $allbudgets->where(['user_id' => $this->user_id])->findAll();

        $data['models_gets'] = array();

        $get_models = array();
        foreach ($data['models'] as $key => $model) {
            $corpModels = null;
            $getMktModel = $this->get_models_marketing($model['models_id']);
            if (!empty($getMktModel)) {
                array_push($data['models_gets'], $getMktModel);
                $corpModels = new GetCorpModel($data['models_gets'][$key]);
                if (isset($corpModels->export_var[0])) {
                    array_push($get_models, $corpModels->export_var[0]);
                }
            }
        }
        if ($data['models']) {
            foreach ($data['models'] as $key => $model) {
                $data['models'][$key]['get_overall'] = null;
                if (isset($get_models[$key])) {
                    $data['models'][$key]['get_overall'] = $get_models[$key];
                }
            }
        }
        $dataExport = [];
        if ($data['models']) {
            foreach ($data['models'] as $data) {
                $export = [];
                $export['models_date'] = $data['models_date'];
                $export['models_name'] = $data['models_name'];
                $spend = 0;
                $revenue = 0;
                $profit = 0;
                $margin = 0;
                $qty = 0;
                if ($data['get_overall'])
                    extract($data['get_overall']);
                $export['qty'] = $qty;
                $export['spend'] = is_float($spend) ? $this->format_amount($spend, 2) ?? "£0" : $this->format_amount($spend, 2, true) ?? "£0";
                $export['revenue'] = is_float($revenue) ? $this->format_amount($revenue, 2) ?? "£0" : $this->format_amount($revenue, 2, true) ?? "£0";
                $export['profit'] = is_float($profit) ? $this->format_amount($profit, 2) ?? "£0" : $this->format_amount($profit, 2, true) ?? "£0";
                $export['margin'] = $margin . "%";
                array_push($dataExport, $export);
            }
        }
        ;
        return json_encode($dataExport);
    }
    // CRUD

    // Create
    public function add_models()
    {
        $allbudgets = new ModelsModel();
        $data = [
            'models_date' => $this->request->getVar('models_date'),
            'models_name' => $this->request->getVar('models_name'),
            'models_qty' => $this->request->getVar('models_qty'),
            'models_spend' => $this->request->getVar('models_spend'),
            'models_revenue' => $this->request->getVar('models_revenue'),
            'models_profit' => $this->request->getVar('models_profit'),
            'user_id' => $this->request->getVar('user_id'),
            'models_status' => 'New',
        ];
        $allbudgets->insert($data);
        return redirect()->back();
    }

    // Retrieve
    public function view_models($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        $allmodeloverheads = new OverheadsModel();
        $data['overheadmodels'] = $allmodeloverheads->overheadsWith($models_id);

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view("pages/corporate_models_view", $data);
        echo view('pages/corporate_models_overheads', $data);
        echo view('templates/footer');

    }

    // Update - (View)
    public function edit_models($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->find($models_id);
        echo view("pages/corporate_models_edit", $data);
    }

    // Update - (Save)
    public function update_models()
    {
        $models_id = $this->request->getPost("models_id");
        $updatemodels = new ModelsModel();
        $builder = $updatemodels->builder();
        $builder->where(["models_id" => $models_id, 'user_id' => $this->user_id]);
        $builder->update($this->request->getPost());
        return redirect()->back();
    }

    // Delete
    public function delete_models($models_id = null)
    {
        $allmodels = new ModelsModel();
        $data['models'] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->delete($models_id);
        return redirect()->back();
    }

    // CRUD

    // Overheads

    public function models_overheads($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        if (!$data["models"]) {
            echo view('templates/header', $this->subscription);
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return;
        }

        $allmodeloverheads = new OverheadsModel();
        $data['overheadmodels'] = $allmodeloverheads->overheadsWith($models_id);

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_overheads', $data);
        echo view('templates/footer');
    }

    public function models_overheads_data($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        if (!$data["models"]) {
            return;
        }

        $allmodeloverheads = new OverheadsModel();
        $data['overheadmodels'] = $allmodeloverheads->overheadsWith($models_id);
        echo view('pages/corporate_models_overview_data', $data);
    }

    // CRUD

    // Create
    public function add_models_overheads()
    {
        $allmodeloverheads = new OverheadsModel();
        $data = [
            'models_id' => $this->request->getVar('models_id'),
            'models_overheads_insurance' => $this->request->getVar('models_overheads_insurance'),
            'models_overheads_domain' => $this->request->getVar('models_overheads_domain'),
            'models_overheads_hosting' => $this->request->getVar('models_overheads_hosting'),
            'models_overheads_gdpr' => $this->request->getVar('models_overheads_gdpr'),
            'models_overheads_phone' => $this->request->getVar('models_overheads_phone'),
            'models_overheads_mail' => $this->request->getVar('models_overheads_mail'),
            'models_overheads_banking' => $this->request->getVar('models_overheads_banking'),
            'models_overheads_tech' => $this->request->getVar('models_overheads_tech'),
            'models_overheads_software' => $this->request->getVar('models_overheads_software'),
            'models_overheads_filing' => $this->request->getVar('models_overheads_filing'),
            'models_overheads_ops_rate' => $this->request->getVar('models_overheads_ops_rate'),
            'models_overheads_ops_hours' => $this->request->getVar('models_overheads_ops_hours'),
            'models_overheads_coms_rate' => $this->request->getVar('models_overheads_coms_rate'),
            'models_overheads_coms_hours' => $this->request->getVar('models_overheads_coms_hours'),
            'models_overheads_pub_rate' => $this->request->getVar('models_overheads_pub_rate'),
            'models_overheads_pub_hours' => $this->request->getVar('models_overheads_pub_hours'),
            'models_overheads_acc_rate' => $this->request->getVar('models_overheads_acc_rate'),
            'models_overheads_acc_hours' => $this->request->getVar('models_overheads_acc_hours'),
            'models_overheads_acc_yearly' => $this->request->getVar('models_overheads_acc_yearly'),
        ];
        $this->request->getVar('models_overheads_id') ?
            $data['models_overheads_id'] = $this->request->getVar('models_overheads_id') :
            '';

        $allmodeloverheads->save($data);

        $allmodels = new ModelsModel();
        $allmodels->update($data['models_id'], ['models_status' => 'Completed']);
        return redirect()->back();
    }

    // Overheads

    // Formulas

    public function models_formulas($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        if (!$data["models"]) {
            echo view('templates/header', $this->subscription);
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return;
        }
        $data['models_id'] = $models_id;
        $allformula = new FormulaModel();
        $data['formulas'] = $allformula->formulaWith();

        $corpFormula = new CorpFormulasModel();
        $data['corpFormula'] = $corpFormula->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['auth_btn'] = $this->auth_btn;

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_formulas', $data);
        echo view('templates/footer');
    }

    public function models_formulas_data($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        if (!$data["models"]) {
            return;
        }
        $data['models_id'] = $models_id;
        $allformula = new FormulaModel();
        $data['formulas'] = $allformula->formulaWith();

        $corpFormula = new CorpFormulasModel();
        $data['corpFormula'] = $corpFormula->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['auth_btn'] = $this->auth_btn;

        echo view('pages/corporate_models_formulas_data', $data);
    }

    public function models_formulas_save($models_id)
    {
        $data = $this->request->getPost();
        $data['models_id'] = $models_id;
        // echo "<pre>";print_r($data); echo "</pre>";die;
        $corpFormula = new CorpFormulasModel();
        $corpFormula->save($data);

        return redirect()->back();
    }

    // Formulas

    // Ingredients

    public function models_ingredients_api($models_id)
    {
        $allmodels = new ModelsModel();

        $allmodeloverheads = new OverheadsModel();
        $data['ingredients'] = $allmodeloverheads->where(['user_id' => $this->user_id])->findAll();
        $f_ingredients = [];
        $data['batch_qty'] = 0;
        $data['unit_qty'] = 0;
        $data['formula_counts'] = 0;
        $rd_formula = new FormulaModel();

        // corporate models ingredient
        $corpIngredients = new CorpIngredientsModel();
        $data['corpIngredients'] = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        // corporate models formula
        $corpFormula = new CorpFormulasModel();
        $formula_s = $corpFormula->where(["models_id" => $models_id, 'user_id' => $this->user_id])->select('formula_id,batch_qty,unit_qty')->first();
        $data['status'] = null;
        if ($formula_s) {
            $data['batch_qty'] = $formula_s['batch_qty'];
            $data['unit_qty'] = $formula_s['unit_qty'];
            $formula_ids = json_decode($formula_s['formula_id']);
        } else {
            $formula_ids = null;
        }

        $allf_ingredients = new Formula_IngredientsModel();

        if (!empty($formula_ids)) {
            $data['formula_counts'] = count($formula_ids);
            foreach ($formula_ids as $formula_id) {
                array_push($f_ingredients, $allf_ingredients->f_ingredientsWith($formula_id));
            }
        }
        $ingredients_list = [];
        $ingredients_listn = [];
        $data['f_ingredients'] = [];
        if (!empty($f_ingredients)) {
            foreach ($f_ingredients as $f_ingredient) {
                foreach ($f_ingredient as $key => $value) {
                    if (!in_array($value->ingredient_id, $ingredients_list)) {
                        array_push($ingredients_list, $value->ingredient_id);
                        $ingredients_listn[$value->ingredient_id] = $value->f_ingredients_qty;
                        array_push($data['f_ingredients'], $value);
                    } else {
                        $ingredients_listn[$value->ingredient_id] = (float)$ingredients_listn[$value->ingredient_id] + (float)$value->f_ingredients_qty;
                    }

                }
            }
        }
        if (!empty($data['f_ingredients'])) {
            foreach ($data['f_ingredients'] as $f) {
                if (array_key_exists($f->f_ingredients_ingredients, $ingredients_listn)) {
                    $f->f_ingredients_qty = $ingredients_listn[$f->ingredient_id];
                }
            }
        }
        return $data;
    }

    public function models_ingredients($models_id)
    {
        $allmodels = new ModelsModel();
        $data = $this->models_ingredients_api($models_id);
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        if (!$data["models"]) {
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return null;
        }
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_ingredients', $data);
        echo view('templates/footer');
    }

    public function models_ingredients_data($models_id)
    {
        $allmodels = new ModelsModel();
        $data = $this->models_ingredients_api($models_id);
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        if (!$data["models"]) {
            return;
        }

        echo view('pages/corporate_models_ingredients_data', $data);
    }

    public function models_ingredients_json($models_id)
    {

        $data = $this->models_ingredients_api($models_id);
        extract($data);
        $ingredients = [];

        if ($f_ingredients && count($f_ingredients)) {
            $percent = null;
            $ingredient = [];
            foreach ($f_ingredients as $key => $f_ingredient) {
                $percent = 100;

            }
            foreach ($f_ingredients as $key => $f_ingredient) {
                $s = null;
                $p = null;
                $q = null;
                if ($corpIngredients && count($corpIngredients) > 0) {

                    $formula_ids = json_decode($corpIngredients['formula_ids']);
                    $suppliers = json_decode($corpIngredients['suppliers']);
                    $prices = json_decode($corpIngredients['prices']);
                    $qty = json_decode($corpIngredients['order_qty']);
                    if ($formula_ids) {
                        foreach ($formula_ids as $key => $formula_id) {
                            if ($f_ingredient->f_ingredients_ingredients == $formula_id) {
                                $s = $suppliers[$key];
                                $q = $qty[$key];
                                $p = $prices[$key];
                            }
                        }
                    }

                }
                $ingredient['ingredient'] = $f_ingredient->ingredient_name;
                $ingredient['inci'] = $f_ingredient->ingredient_inci;
                $ingredient['qty'] = is_float(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty) ? $this->format_amount(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty, 2) ?? "0" : $this->format_amount(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty, 2, true) ?? "0";
                $ingredient['supplier'] = $s;
                $ingredient['order'] = $q;
                $ingredient['price'] = $p;
                array_push($ingredients, $ingredient);
            }
        }
        return json_encode($ingredients);
    }

    public function models_ingredients_save($models_id)
    {
        $data = $this->request->getPost();
        $data['models_id'] = $models_id;

        $data["formula_ids"] = $data["formula_ids_ingre"];
        $data["suppliers"] = $data["suppliers_ingre"];
        $data["order_qty"] = $data["order_qty_ingre"];
        $data["prices"] = $data["prices_ingre"];

        // corporate models ingredient
        $corpIngredients = new CorpIngredientsModel();

        // echo "<pre>";print_r($data); echo "</pre>";die;
        $corpIngredients->save($data);
        return redirect()->back();

    }
    // Ingredients

    // Manufacturing

    public function models_manufacturing($models_id)
    {
        // $data = $this->models_manufacturing_api($models_id);
        // dd($data);
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['user_id'] = $data['models']['user_id'];
        if (empty($data["models"])) {
            echo view('templates/header', $this->subscription);
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return;
        }
        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_manufacturing', $data);
        echo view('templates/footer');
    }

    public function models_manufacturing_data($models_id, $user_id)
    {
        if (session()->has('user_id')) {
            if (empty($user_id)) {
                $user_id = session()->get('user_id');
            }
        }
        // dd($user_id);
        $data = $this->models_manufacturing_api($models_id, $user_id);
        // dd($data);
        echo view('pages/corporate_models_manufacturing_data', $data);
    }

    public function models_manufacturing_api($models_id, $user_id = null)
    {
        if (session()->has('user_id')) {
            if (empty($user_id)) {
                $user_id = session()->get('user_id');
            }
        }
        if (empty($user_id))
            $user_id = $this->user_id;
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $user_id])->first();

        $allmodelManuf = new CorpManufacturingModel();
        $data['manufacturing'] = $allmodelManuf->where(["models_id" => $models_id, 'user_id' => $user_id])->first();
        // dd($data['manufacturing']);
        // corporate models formula
        $data['formulas'] = [];
        $data['batch_qty'] = 0;
        $data['unit_qty'] = 0;
        $corpFormula = new CorpFormulasModel();
        $formula_s = $corpFormula->where(["models_id" => $models_id, 'user_id' => $user_id])->select('formula_id,batch_qty,unit_qty')->first();
        if ($formula_s) {
            $data['batch_qty'] = $formula_s['batch_qty'];
            $data['unit_qty'] = $formula_s['unit_qty'];
            $formula_ids = json_decode($formula_s['formula_id']);
        } else {
            $formula_ids = null;
        }

        $obj['formulas'] = [];
        $data['formulas'] = [];
        $f_ingredients = [];
        $allf_ingredients = new Formula_IngredientsModel();
        $corpIngredients = new CorpIngredientsModel();
        $corpPackagings = new CorpPackagingModel();
        $data['formula_counts'] = null;

        if (!empty($formula_ids)) {
            $data['formula_counts'] = count($formula_ids);
            foreach ($formula_ids as $key => $formula_id) {

                $f = [];
                $fomulaWRD = $allf_ingredients->formulaWithRD_Plan($formula_id, $user_id);
                $f_ingWith = $allf_ingredients->f_ingredientsWith($formula_id, $user_id);
                if ($fomulaWRD) {
                    array_push($data['formulas'], $fomulaWRD);
                }
                if ($f_ingWith) {
                    array_push($f_ingredients, $f_ingWith);
                }
                // print_r($user_id); echo "user";
                // print_r($allf_ingredients->f_ingredientsWith($formula_id, $user_id )); //, $f);
                // print_r($formula_id); echo "formid";


                // Packagings Calculations
                $calPack = $corpPackagings->where(["models_id" => $models_id, 'user_id' => $user_id])
                    ->select('models_packaging_container_price,
                                models_packaging_label_price,models_packaging_shipping_price,
                                models_packaging_bags_price,
                                models_packaging_notes_price,
                                models_packaging_delivery_price')->first();
                // echo "<pre>";print_r($calPack); echo "</pre>";die;
                if (!empty($data['formulas'])) {
                    if (!empty($calPack)) {
                        $pkTotal_price = array_sum($calPack);
                        $pk_kg = $data['batch_qty'] * $data['formula_counts'];
                        $pk_unity_qty = $data['unit_qty'];
                        $pk_t_unity = $pk_kg / $pk_unity_qty;
                        // dd($pkTotal_price/$data['formula_counts']);
                        $data['formulas'][$key]->models_pktp = $pkTotal_price / $data['formula_counts'];
                        $data['formulas'][$key]->models_pkup = $pkTotal_price / $pk_t_unity;
                        $data['formulas'][$key]->models_pkkp = $pkTotal_price / $pk_kg;

                    } else {
                        if ($allf_ingredients->formulaWithRD_Plan($formula_id)) {
                            $data['formulas'][$key]->models_pktp = 0;
                            $data['formulas'][$key]->models_pkup = 0;
                            $data['formulas'][$key]->models_pkkp = 0;
                        }
                    }
                } else {
                    if ($allf_ingredients->formulaWithRD_Plan($formula_id)) {
                        $data['formulas'][$key]->models_pktp = 0;
                        $data['formulas'][$key]->models_pkup = 0;
                        $data['formulas'][$key]->models_pkkp = 0;
                    }
                }

                // Ingredients Calculations
                // $calIng = $corpIngredients->where(["models_id" => $models_id, 'user_id'=>$user_id])->first();
                // $formula_ids = json_decode($calIng['formula_ids']);
                // $formula_ids = json_decode($calIng['formula_ids']);


            }

        }

        $calPack = [];
        $totPer = [];

        // Calculate the total ingredients percentage that appear in each formula
        if (!empty($f_ingredients)) {
            foreach ($f_ingredients as $ing => $f_ingredient) {
                $totalPercer = 0;
                foreach ($f_ingredient as $key => $value) {
                    $calIng = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $user_id])->first();
                    if (!empty($calIng)) {
                        $formula_ids = json_decode($calIng['formula_ids']);
                        $prices = json_decode($calIng['prices']);
                        $fID = null;
                        if (!empty($formula_ids)) {
                            foreach ($formula_ids as $kF => $formula_ing) {
                                if ($value->f_ingredients_ingredients == $formula_ing)
                                    $fID = $kF + 1;
                            }
                            if ($fID) {
                                $totalPercer = $value->f_ingredients_qty;
                                if (array_key_exists($value->f_ingredients_ingredients, $totPer)) {
                                    $totalPercer = (float)$totPer[$value->f_ingredients_ingredients] + (float)$value->f_ingredients_qty;
                                }
                                $totPer[$value->f_ingredients_ingredients] = $totalPercer;
                            }
                        }
                    }


                }
            }

            foreach ($f_ingredients as $ing => $f_ingredient) {
                $calPk = [];
                if (!empty($f_ingredient)) {
                    foreach ($f_ingredient as $key => $value) {
                        // echo "<pre> $ing ->";print_r($value); echo "</pre>";
                        $calIng = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $user_id])->first();
                        if (!empty($calIng)) {
                            $formula_ids = json_decode($calIng['formula_ids']);
                            $prices = json_decode($calIng['prices']);
                            $fID = null;

                            if (!empty($formula_ids)) {
                                foreach ($formula_ids as $kF => $formula_ing) {
                                    if ($value->f_ingredients_ingredients == $formula_ing)
                                        $fID = $kF + 1;
                                }
                            }
                            if (!empty($fID)) {
                                if (array_key_exists($value->f_ingredients_ingredients, $totPer)) {
                                    $calPk[$value->f_ingredients_ingredients] = round(((float) $value->f_ingredients_qty * (int) $prices[$fID - 1]) / (float)$totPer[$value->f_ingredients_ingredients], 2);
                                }
                            } else {
                                $calPk[$value->f_ingredients_ingredients] = 0;
                            }
                        }


                    }
                }
                array_push($calPack, $calPk);

                if (!empty($calPack)) {
                    $ingTotal_price = array_sum($calPack[$ing]);
                    $ing_kg = $data['batch_qty']; // * $data['formula_counts'];
                    $ing_unity_qty = $data['unit_qty'];
                    $ing_t_unity = $ing_kg / $ing_unity_qty;

                    $data['formulas'][$ing]->models_igtp = $ingTotal_price;
                    $data['formulas'][$ing]->models_igup = $ingTotal_price / $ing_t_unity;
                    $data['formulas'][$ing]->models_igkp = $ingTotal_price / $ing_kg;
                    // $data['formulas'][]
                } else {
                    $data['formulas'][$ing]->models_igtp = 0;
                    $data['formulas'][$ing]->models_igup = 0;
                    $data['formulas'][$ing]->models_igkp = 0;
                }

            }
        }
        // echo "<pre> $ing ->";print_r($calPack); echo "</pre>";die;

        // $data['formula_counts'] = null;
        return $data;
    }

    public function save_models_manufacturing()
    {
        $manuf_model = new CorpManufacturingModel();
        $data = $this->request->getPost();
        $data['models_igtp'] = '';
        $data['models_pktp'] = '';
        $data['models_pdtp'] = '';
        $data['models_igkp'] = '';
        $data['models_pkkp'] = '';
        $data['models_pdkp'] = '';
        $data['models_igup'] = '';
        $data['models_pkup'] = '';
        $data['models_pdup'] = '';
        $data['models_ptp'] = '';
        $data['emodel_manufacturing_productionfee'] = '';

        // echo "<pre>";print_r($data); echo "</pre>";die;
        $manuf_model->save($data);
        return redirect()->back();
    }
    // Manufacturing

    // Packaging

    public function models_packaging_api($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['batch_qty'] = 0;
        $data['unit_qty'] = 0;

        // corporate models formula
        $corpFormula = new CorpFormulasModel();
        $formula_s = $corpFormula->where(["models_id" => $models_id, 'user_id' => $this->user_id])->select('formula_id,batch_qty,unit_qty')->first();
        $data['status'] = null;
        if ($formula_s) {
            $data['batch_qty'] = $formula_s['batch_qty'];
            $data['unit_qty'] = $formula_s['unit_qty'];
            $formula_ids = json_decode($formula_s['formula_id']);
        } else {
            $formula_ids = null;
        }


        $pack_model = new CorpPackagingModel();
        // $pack_model->delete();
        // $this->db->empty_table('tbl_models_packaging');
        // $builder = $pack_model->builder();
        // $builder->emptyTable('tbl_models_packaging');

        $data['packaging'] = $pack_model->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        if ($formula_ids) {
            $data['status'] = 1;
            $data['formula_counts'] = count($formula_ids);
        }
        return $data;
    }

    public function models_packaging_json($models_id)
    {
        $data = $this->models_packaging_api($models_id);
        extract($data);

    }

    public function models_packaging($models_id)
    {
        $data = $this->models_packaging_api($models_id);
        if (!$data["models"]) {
            echo view('templates/header', $this->subscription);
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return;
        }

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_packaging', $data);
        echo view('templates/footer');
    }

    public function models_packaging_data($models_id)
    {
        $data = $this->models_packaging_api($models_id);
        if (!$data["models"]) {
            return;
        }
        echo view('pages/corporate_models_packaging_data', $data);
    }

    public function save_models_packaging($model_id)
    {
        $pack_model = new CorpPackagingModel();
        $data = $this->request->getPost();
        // echo "<pre>";print_r($data); echo "</pre>";die;
        $pack_model->save($data);
        return redirect()->back();
    }
    // Packaging

    // Marketing

    public function models_marketing($models_id)
    {
        $data = $this->get_models_marketing($models_id);
        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        if (empty($data['models'])) {
            echo view('errors/html/error_404');
            echo view('templates/footer');
            return null;
        }
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_marketing', $data);
        echo view('templates/footer');
    }

    public function models_marketing_data($models_id)
    {
        $data = $this->get_models_marketing($models_id);
        if (empty($data['models'])) {
            ;
            return null;
        }
        echo view('pages/corporate_models_marketing_data', $data);
    }

    private function get_models_marketing($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        if (empty($data["models"])) {
            return null;
        }
        $data['models_oht'] = 0;
        $markt_models = new CorpMarketingModel();
        $data["marketing"] = $markt_models->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        /* Overheads Calculations */
        $allmodeloverheads = new OverheadsModel();
        $overheads = $allmodeloverheads->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        if ($overheads) {
            $yrNonRsr_exp = array(
                $overheads['models_overheads_insurance'],
                $overheads['models_overheads_domain'],
                $overheads['models_overheads_hosting'],
                $overheads['models_overheads_gdpr'],
                $overheads['models_overheads_phone'],
                $overheads['models_overheads_mail'],
                $overheads['models_overheads_banking'],
                $overheads['models_overheads_tech'],
                $overheads['models_overheads_software'],
                $overheads['models_overheads_filing'],
            );
            $yrRsr_exp = array(
                $overheads['models_overheads_ops_rate'] * $overheads['models_overheads_ops_hours'] * 52,
                $overheads['models_overheads_acc_rate'] * $overheads['models_overheads_acc_hours'] * 52,
                $overheads['models_overheads_coms_rate'] * $overheads['models_overheads_coms_hours'] * 52,
                $overheads['models_overheads_pub_rate'] * $overheads['models_overheads_pub_hours'] * 52,
                array_sum($yrNonRsr_exp),
            );
            $overhead_yr_Rsr_exp = array_sum($yrRsr_exp);
            $data['models_oht'] = $overhead_yr_Rsr_exp / 4;
        }

        /* Ingredients Calculations */

        // corporate models ingredient
        $corpIngredients = new CorpIngredientsModel();
        $corpIngredients = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['models_igt'] = null;
        if ($corpIngredients) {
            $data['models_igt'] = array_sum(json_decode($corpIngredients['prices']));
        }

        /* Manufacturing calculations */
        $allmodelManuf = new CorpManufacturingModel();
        $manufacturing = $allmodelManuf->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['batch_qty'] = 0;
        $data['unit_qty'] = 0;
        $obj['formulas'] = [];
        $data['formulas'] = [];
        $corpFormula = new CorpFormulasModel();
        $formula_s = $corpFormula->where(["models_id" => $models_id, 'user_id' => $this->user_id])->select('formula_id,batch_qty,unit_qty')->first();
        $data['status'] = null;
        if ($formula_s) {
            $data['batch_qty'] = $formula_s['batch_qty'];
            $data['unit_qty'] = $formula_s['unit_qty'];
            $formula_ids = json_decode($formula_s['formula_id']);
        } else {
            $formula_ids = null;
        }
        // dd($formula_ids);
        $f_ingredients = [];
        $allf_ingredients = new Formula_IngredientsModel();
        $corpIngredients = new CorpIngredientsModel();
        $corpPackagings = new CorpPackagingModel();
        $data['formula_counts'] = null;

        if ($formula_ids) {
            $data['formula_counts'] = count($formula_ids);
            if (!empty($formula_ids)) {
                foreach ($formula_ids as $key => $formula_id) {

                    $fomulaWRD = $allf_ingredients->formulaWithRD_Plan($formula_id);
                    $f_ingWith = $allf_ingredients->f_ingredientsWith($formula_id);

                    $f = [];
                    if ($allf_ingredients->formulaWithRD_Plan($formula_id)) {
                        array_push($obj['formulas'], $allf_ingredients->formulaWithRD_Plan($formula_id));
                    }

                    if ($allf_ingredients->f_ingredientsWith($formula_id)) {
                        array_push($f_ingredients, $allf_ingredients->f_ingredientsWith($formula_id));
                    }

                    // Packagings Calculations
                    $calPack = $corpPackagings->where(["models_id" => $models_id, 'user_id' => $this->user_id])
                        ->select('models_packaging_container_price,
                                models_packaging_label_price,models_packaging_shipping_price,
                                models_packaging_bags_price,
                                models_packaging_notes_price,
                                models_packaging_delivery_price')->first();
                    if (!isset($obj['formulas'][$key])) {
                        // Initialize as stdClass if not set
                        $obj['formulas'][$key] = new stdClass();
                    }
                    if (!empty($calPack)) {
                        $pkTotal_price = array_sum($calPack);
                        $pk_kg = (float)$data['batch_qty'] * (float)$data['formula_counts'];
                        $pk_unity_qty = $data['unit_qty'];
                        $pk_t_unity = $pk_kg / $pk_unity_qty;
                        $obj['formulas'][$key]->models_pktp = $pkTotal_price / $data['formula_counts'];
                        $obj['formulas'][$key]->models_pkup = $pkTotal_price / $pk_t_unity;
                        $obj['formulas'][$key]->models_pkkp = $pkTotal_price / $pk_kg;
                    } else {
                        if ($allf_ingredients->formulaWithRD_Plan($formula_id)) {
                            $obj['formulas'][$key]->models_pktp = 0;
                            $obj['formulas'][$key]->models_pkup = 0;
                            $obj['formulas'][$key]->models_pkkp = 0;
                        }
                    }
                }
            }
        }
        $calPack = [];
        $totPer = [];

        // Calculate the total ingredients percentage that appear in each formula
        if (!empty($f_ingredients)) {
            foreach ($f_ingredients as $ing => $f_ingredient) {
                $totalPercer = 0;
                if (!empty($f_ingredient)) {
                    foreach ($f_ingredient as $key => $value) {
                        $calIng = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
                        if ($calIng) {
                            $formula_ids = json_decode($calIng['formula_ids']);
                            $prices = json_decode($calIng['prices']);
                            $fID = null;
                            foreach ($formula_ids as $kF => $formula_ing) {
                                if ($value->f_ingredients_ingredients == $formula_ing)
                                    $fID = $kF + 1;
                            }
                            if ($fID) {
                                $totalPercer = $value->f_ingredients_qty;
                                if (array_key_exists($value->f_ingredients_ingredients, $totPer)) {
                                    $totalPercer = (float)$totPer[$value->f_ingredients_ingredients] + (float)$value->f_ingredients_qty;
                                }
                                $totPer[$value->f_ingredients_ingredients] = $totalPercer;
                            }
                        }


                    }
                }
            }
        }

        if (!empty($f_ingredients)) {
            foreach ($f_ingredients as $ing => $f_ingredient) {
                $calPk = [];
                if (!empty($f_ingredient)) {
                    foreach ($f_ingredient as $key => $value) {
                        // echo "<pre> $ing ->";print_r($value); echo "</pre>";
                        $calIng = $corpIngredients->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
                        if ($calIng) {
                            $formula_ids = json_decode($calIng['formula_ids']);
                            $prices = json_decode($calIng['prices']);
                            $fID = null;
                            foreach ($formula_ids as $kF => $formula_ing) {
                                if ($value->f_ingredients_ingredients == $formula_ing)
                                    $fID = $kF + 1;
                            }
                            if ($fID) {
                                if (array_key_exists($value->f_ingredients_ingredients, $totPer)) {
                                    $calPk[$value->f_ingredients_ingredients] = round(((float) $value->f_ingredients_qty * (int) $prices[$fID - 1]) / (float)$totPer[$value->f_ingredients_ingredients], 2);
                                }
                            } else {
                                $calPk[$value->f_ingredients_ingredients] = 0;
                            }
                        }


                    }
                }
                array_push($calPack, $calPk);

                if (!isset($obj['formulas'][$ing])) {
                    $obj['formulas'][$ing] = new stdClass();
                }
                if ($calPack) {
                    $ingTotal_price = array_sum($calPack[$ing]);
                    $ing_kg = $data['batch_qty']; // * $data['formula_counts'];
                    $ing_unity_qty = $data['unit_qty'];
                    $ing_t_unity = $ing_kg / $ing_unity_qty;

                    // if ($ingTotal_price && $ingTotal_price !== 0) {
                    
                    $obj['formulas'][$ing]->models_igtp = $ingTotal_price;
                    $obj['formulas'][$ing]->models_igup = $ingTotal_price / $ing_t_unity;
                    $obj['formulas'][$ing]->models_igkp = $ingTotal_price / $ing_kg;
                    // }
                    // else {
                    //     $obj['formulas'][$ing]->models_igtp = 0;
                    //     $obj['formulas'][$ing]->models_igup = 0;
                    //     $obj['formulas'][$ing]->models_igkp = 0;
                    // }
                } else {
                    $obj['formulas'][$ing]->models_igtp = 0;
                    $obj['formulas'][$ing]->models_igup = 0;
                    $obj['formulas'][$ing]->models_igkp = 0;
                }

            }
        }
        $bat_ = $data['batch_qty'];
        $f_count_ = $data['formula_counts'];
        $kg = (float)$bat_ * (float)$f_count_;
        $unit_qty = $data['unit_qty'];
        $total_unit = 0;
        if ($unit_qty)
            $total_unit = $kg / $unit_qty;
        $total_calc = 0;
        $data['models_mft'] = 0;
        if ($obj['formulas']) {
            /* Getting Production Total Price */
            $p = 0;
            $d = 0;
            $b = 0;
            if ($manufacturing) {
                $p = $manufacturing['model_manufacturing_productionfee'];
                $d = $manufacturing['model_manufacturing_deliveryfee'];
                $b = $manufacturing['model_manufacturing_bottlingfee'];
            }
            $total_calc = ((float)$p * (float)$kg) + (float)$d + ((float)$b * (float)$total_unit);
            // Production Total Price
            $ptp = $total_calc / $f_count_;
            /* End getting  */

            $manufs = $obj['formulas'];
            // $manuf_total = 0;
            foreach ($manufs as $key => $manuf) {
                // $ig_pk = array(
                //     $manuf->models_igtp,
                //     $manuf->models_pktp,
                // );
                // $manuf_total = $manuf_total + array_sum($ig_pk)+$ptp;
                // echo "<pre>";print_r($manuf); echo "</pre>";
            }
            $data['models_mft'] = $total_calc;
        }
        $data['models_mkt'] = 0.2;
        $data['models_lit'] = 1;

        /* Packaging Calculations */
        $pack_model = new CorpPackagingModel();
        $packaging = $pack_model->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();
        $data['models_pkt'] = 0;
        if ($packaging) {
            foreach ($packaging as $key => $pk) {
                if (preg_match('/_price$/', $key)) {
                    $data['models_pkt'] = (float)$data['models_pkt'] + (float)$pk;
                }
            }
        }
        $data['tot_q_F'] = $total_unit;
        $data['no_u_F'] = $unit_qty;
        $data['unit_q_F'] = $bat_;

        $data['models_puc'] = 0;
        $data['models_pbe'] = 0;
        $data['models_str'] = 0;
        $data['models_ppa'] = 0;

        /* Listing products */
        if (!empty($obj['formulas'])) {
            foreach ($obj['formulas'] as $key => $product) {
                // making it globally
                // dd(gettype($obj['formulas'][$key]));
                $igup = isset($obj['formulas'][$key]->models_igup) ? $product->models_igup : 0;
                $pkup = isset($product->models_pkup) ? $product->models_pkup : 0;
                $v_m = (float)$igup + (float)$pkup + ((float)$total_calc / (float)$total_unit);
                $data['models_puc'] = $v_m;
                $data['models_str'] = $v_m;
                $data['models_ppa'] = $v_m;
                // Assigning
                
                if (!isset($obj['formulas'][$key])) {
                    $obj['formulas'][$key] = new stdClass();
                }
                $obj['formulas'][$key]->models_puc = $v_m;//$data['models_puc'];
                $obj['formulas'][$key]->models_str = $v_m;
                $obj['formulas'][$key]->models_ppa = $v_m;
            }
        }

        $data['product_lists'] = $obj['formulas'];
        $data['models_id'] = $data["models"]['models_id'];
        // dd( $data);//['models_puc'], $data['models_str'], $data['models_ppa']
        return $data;
    }

    public function update_models_marketing()
    {
        $markt_models = new CorpMarketingModel();
        $data = $this->request->getPost();
        $remv = [
            "models_la" => "remove/",
            "models_lr" => "remove/",
            "models_ir" => "remove/",
        ];
        $data = \array_diff_key($data, $remv);
        // echo "<pre>";print_r($data); echo "</pre>";die;
        $markt_models->save($data);
        return redirect()->back();
    }
    // Marketing

    // Financing

    public function models_financing($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        $allmodeloverheads = new OverheadsModel();
        $data['financing'] = $allmodeloverheads->where(['user_id' => $this->user_id])->findAll();

        echo view('templates/header', $this->subscription);
        echo view('pages/corporate');
        echo view('pages/corporate_models_view', $data);
        echo view('pages/corporate_models_financing', $data);
        echo view('templates/footer');
    }

    public function models_financing_data($models_id)
    {
        $allmodels = new ModelsModel();
        $data["models"] = $allmodels->where(["models_id" => $models_id, 'user_id' => $this->user_id])->first();

        $allmodeloverheads = new OverheadsModel();
        $data['financing'] = $allmodeloverheads->where(['user_id' => $this->user_id])->findAll();

        echo view('pages/corporate_models_financing_data', $data);
    }

    // Financing

    // Planning //

    // Accounts //

    // Login //

    public function profile($user_id)
    {
        $this->session->set('sub', '1');
        $this->session->set('active', '6');

        $allusers = new UserModel();
        $data['users'] = $allusers->where("user_id", $user_id)->first();
        echo view('templates/header', $this->subscription);
        echo view('pages/profile', $data);
        echo view('templates/footer');
    }

    // Update (Save)
    public function update_staff()
    {
        $session = session();
        $user_id = $this->request->getPost("user_id");
        $updateuser = new UserModel();
        $builder = $updateuser->builder();
        $users = $this->request->getPost();
        if (!empty($users['user_password'])) {
            if (strlen($users['user_password']) >= 6) {
                $pass = password_hash($users['user_password'], PASSWORD_DEFAULT);
                $users['user_password'] = $pass;
            } else {
                $session->setFlashdata('msg', 'Minimum password is 6 characters');
                return redirect()->back();
            }
        }

        $builder->where("user_id", $user_id);
        $builder->update($users);

        return redirect()->back();
    }

    public function login()
    {
        helper(['form']);
        echo view('pages/login');
    }

    // Logout //

    public function logout()
    {
        session()->destroy();
        return redirect()->to('/login');
    }

    // Logout//

    // Login & Auth //

    public function autho()
    {
        try {
            //code...
            $session = session();
            $user = new UserModel();
            $cosmanModel = new CosmanModel();
            // support@cosmeticmanager.com
            $user_email = $this->request->getVar('user_email');
            $user_password = $this->request->getVar('user_password');
            $data = $user->where('user_email', $user_email)->first();
            $cosman = $cosmanModel->cosman($user_email);
            if ($data) {
                $status_change = false;
                $sub_id = 1;
                if (!empty($cosman)) {
                    $data_p_name = "Free";
                    if (in_array($data['stripe_product_name'], ["Free", "Starter"]))
                        $data_p_name = "Free";
                    if (in_array($data['stripe_product_name'], ["Pro", "Professional"]))
                        $data_p_name = "Pro";
                    if (in_array($cosman['stripe_product_name'], ["Free", "Starter"]))
                        $cosman_p_name = "Free";
                    if (in_array($cosman['stripe_product_name'], ["Pro", "Professional"]))
                        $cosman_p_name = "Pro";

                    if ($cosman_p_name != $data_p_name) {
                        $status_change = true;
                    }

                    if (!$cosman['stripe_subscription_id'] && in_array($cosman['stripe_product_name'], ['Free', 'Starter']))
                        $sub_id = 0;

                    if ($status_change) {
                        $cosmanModel->clone_wp_user($cosman, ['stripe_subscription_id', 'stripe_product_name', 'stripe_subscription_status'], $data['user_id']);
                    }
                    $verify_pass = password_verify($user_password, $data['user_password']);

                    if ($verify_pass) {
                        $ses_data = [
                            'user_first_name' => $data['user_first_name'],
                            'user_last_name' => $data['user_last_name'],
                            'user_email' => $data['user_email'],
                            'user_id' => $data['user_id'],
                            'logged_in' => TRUE
                        ];
                        $session->set('user_log', $ses_data);
                        $session->set($ses_data);
                        return redirect()->to('/dashboard');
                    } else {
                        $session->setFlashdata('msg', 'Your password is incorrect');
                        return redirect()->to('/login');
                    }
                } else {
                    $session->setFlashdata('msg', 'Sorry, you have no subscription plan');
                    return redirect()->to('/login');
                }
                /*
                $checkStripe = $sub_id ? $this->Stripe_Customers($cosman['stripe_subscription_id']) : ['active' => true];
                if(array_key_exists('active',$checkStripe)) {
                    if($checkStripe['active']) {
                        
                    }else {
                        $session->setFlashdata('msg', 'Sorry, your subscription is inactive');
                        return redirect()->to('/login');
                    }
                }else if(array_key_exists('error',$checkStripe)) {
                    $session->setFlashdata('msg', "Oops! Something went wrong, \nTry again ". $this->stripeMessage($checkStripe['error']));//$checkStripe['error']
                    return redirect()->to('/login');
                }*/

                $session->setFlashdata('msg', 'Sorry, you have no subscription plan');
                return redirect()->to('/login');
            } else {
                if (empty($cosman)) {
                    $session->setFlashdata('msg', 'Your email was not recongised');
                    return redirect()->to('/login');
                }
                $cosman['user_password'] = $user_password;
                $userID = $cosmanModel->clone_wp_user($cosman);

                $dataNew = $user->where('user_id', $userID)->first();
                if (!empty($dataNew)) {
                    $ses_data = [
                        'user_first_name' => $dataNew['user_first_name'],
                        'user_last_name' => $dataNew['user_last_name'],
                        'user_email' => $dataNew['user_email'],
                        'user_id' => $dataNew['user_id'],
                        'logged_in' => TRUE
                    ];
                    $session->set('user_log', $ses_data);
                    $session->set($ses_data);
                    return redirect()->to('/dashboard');
                }

                return redirect()->to('/request_password')->with('user_email', $user_email);
            }
        } catch (Exception $e) {
            return redirect()->to('/login')->with('msg', $this->stripeMessage($e->getMessage()));
        }
    }

    // Login & Auth //

    // Session 

    public function __construct()
    {
        $this->apiKey = env('LIVE_STRIPE_API_KEY') == '' ? env('TEST_STRIPE_API_KEY') : env('LIVE_STRIPE_API_KEY');
        $this->session = session();
        $userLog = $this->session->get('user_log');
        if (!empty($userLog)) {
            $this->user_id = $userLog['user_id'];
        }
        $sess = new SessionModel();
        $subs = new SubscriptionModel();
        $this->data['ViewTable'] = view('templates/TableViewer');
        $this->data['ejsyncfusion'] = view('templates/ej_syncfusion');

        if (isset($this->user_id)) {
            $this->subscription = $subs->subscription();
        }
        $this->session->set('elapse', $sess->sess_check());
        $this->genrateHashPwd();
        $user_log = $this->session->get('user_log');

        $encryption = new Encryption();
        // $key = bin2hex($encryption->createKey());
        // dd($key);
        $config = new ConfigEncryption();
        // $config->key = $key;
        $encrypter = $encryption->initialize($config);
        $this->encrypter = $encrypter;
        // $this->session->remove($this->user_id . 'cart');
        if($this->session->has($this->user_id . 'cart')) {
            $this->items = $this->session->get($this->user_id . 'cart');
        } else {
            $this->items = [];
            $this->items['totalQty'] = 0;
        }
    }

    public function safeEncrypt(string $message)
    {
        return bin2hex($this->encrypter->encrypt($message));
    }

    public function safeDecrypt($encrypt)
    {
        return $this->encrypter->decrypt($encrypt);
    }
    private function genrateHashPwd()
    {
        $userss = new UserModel();
        $fetchuserss = $userss->asObject()->findAll();
        foreach ($fetchuserss as $users) {
            $checkPwd = password_get_info($users->user_password);
            if (isset($checkPwd['algoName'])) {
                if ($checkPwd['algoName'] == 'unknown') {
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

    // Login //

    // Password //

    public function request_password()
    {
        helper(['form']);
        echo view('pages/password_request');
    }

    // Password //

    // Accounts //

    public function manufacturing_ingredients_api_show() {
        $apiController = new ApiController();
        $ingredients = $apiController->fetchProducts();
        $data = [
            'ingredients' => $ingredients
        ];
        // dd($data['ingredients']);
        echo view('templates/header', $this->subscription);
        echo view('pages/manufacturing', $this->subscription);
        echo view('pages/addCart', $this->items);
        echo view('pages/manufacturing_ingredients_import_view', $data);
        echo view('templates/footer');
    }

    public function manufacturing_specific_ingredients_api_show($id) {
        $apiController = new APiController();
        $ingredient = $apiController->fetchProductById($id);
        // dd($ingredient);
        $data = [
            'ingredient' => $ingredient
        ];
        $session = session();
        // $apiController->deleteCart('gid://shopify/Cart/Z2NwLWV1cm9wZS13ZXN0MzowMUo5NEtHWllGQ1FCSjFKRFIwMTVTOEExNQ?key=b5c1eef2d881f674ba05134209d5fe5d');
        // exit ;
        // var_dump($session->get($this->user_id . 'cart')); exit;
        echo view('templates/header', $this->subscription);
        echo view('pages/manufacturing', $this->subscription);
        echo view('pages/addCart', $this->items);
        echo view('pages/manufacturing_specific_ingredient_import_view', $data);
        echo view('templates/footer');
    }
}
