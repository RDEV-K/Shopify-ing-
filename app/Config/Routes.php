<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (file_exists(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers', ['filter'=>['subscription:Free']]);
$routes->setDefaultController('WebAppController', ['filter'=>['subscription:Free']]);
$routes->setDefaultMethod('index', ['filter'=>['subscription:Free']]);
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(true);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.

    //API

    $routes->get('/apiTest', 'ApiController::fetchProducts' , ['filter' => ['auth', 'subscription:Free']]);
    $routes->post('/proxy', 'ApiController::proxy' , ['filter' => ['auth', 'subscription:Free']]);
    $routes->get('/checkout', 'WebAppController::checkout');
    $routes->post('/payment/charge', 'Payment::charge');
    $routes->post('/payment/success', 'Payment::success');
    
    // Dashboard

        $routes->get('/dashboard', 'WebAppController::index' , ['filter' => ['auth','subscription:Free']]);

        // Files //
            $routes->get('/fetch_file/(.+)', 'WebAppController::fileSpATH/$1', ['filter'=>['subscription:Free']]);
            $routes->get('/preview_file/(.+)', 'WebAppController::preview_file/$1', ['filter'=>['subscription:Free']]);
            $routes->get('/download/(:any)/(:any)', 'WebAppController::download_file/$1/$2', ['filter'=>['subscription:Pro']]);
        // Files //

    // Manufacturing
        $routes->post('/testing', 'Testing::saveAsExcel', ['filter'=>['subscription:Free']]);

        // Ingredients
            $routes->get('/manufacturing/ingredients', 'WebAppController::manufacturing_ingredients', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing/ingredients/csv', 'WebAppController::all_ingredient_csv', ['filter'=>['subscription:Free','auth'],'as' => 'all_ing_csv']);
            $routes->post('/manufacturing/ingredients/csv', 'WebAppController::manufacturing_ingredients_api', ['filter'=>['subscription:Free','auth'],'as' => 'all_ing_api']);
            $routes->post('/manufacturing/ingredients_add', 'WebAppController::add_ingredient', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing_ingredients_edit/(:num)', 'WebAppController::edit_ingredient/$1', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing_ingredients_view/(:num)', 'WebAppController::view_ingredient/$1', ['filter'=>['subscription:Free','auth']]);
            $routes->post('/manufacturing_ingredients_update', 'WebAppController::update_ingredient', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing/ingredients_delete/(:num)', 'WebAppController::delete_ingredient/$1', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing/ingredients_api_show', 'WebAppController::manufacturing_ingredients_api_show', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing/ingredients_api_show/(:num)', 'WebAppController::manufacturing_specific_ingredients_api_show/$1', ['filter'=>['subscription:Free','auth']]);
            $routes->post('/manufacturing/ingredients_add_cart', 'WebAppController::manufacturing_ingredient_add_cart', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/manufacturing/ingredients_cart_view', 'WebAppController::manufacturing_ingredient_cart_view', ['filter'=>['subscription:Free','auth']]);
            $routes->post('/manufacturing/ingredients_quantity_edit', 'WebAppController::manufacturing_ingredient_cart_edit', ['filter'=>['subscription:Free','auth']]);
            
            // Ingredients Batch
                $routes->get('/manufacturing_ingredients_view_batch/(:num)', 'WebAppController::manuf_ingredient_batches_filtered/$1', ['filter'=>['subscription:Free','auth']]);
                $routes->get('/manufacturing_ingredients_view_batch/csv/(:num)', 'WebAppController::manuf_ingredient_batches_filtered_csv/$1', ['filter'=>['auth','subscription:Free']]);
                $routes->post('/manufacturing_ingredients_view_batch/csv/(:num)', 'WebAppController::manuf_ingredient_batches_filtered_api/$1', ['filter'=>['subscription:Free','auth']]);
            
        // Formulas
            $routes->get('/rd/formula', 'WebAppController::rd_formula', ['filter'=>['subscription:Free','auth']]);
            $routes->post('/rd/formula_add', 'WebAppController::add_formula', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/rd/formula_copy/(:num)', 'WebAppController::copy_formula/$1', ['filter'=>['subscription:Free','auth'], 'as'=> 'copy_formula']);
            $routes->get('/rd_formula_edit/(:num)', 'WebAppController::edit_formula/$1', ['filter'=>['subscription:Free','auth']]);
            $routes->post('/rd_formula_update', 'WebAppController::update_formula', ['filter'=>['subscription:Free','auth']]);
            $routes->get('/rd_formula_delete/(:num)', 'WebAppController::delete_formula/$1', ['filter'=>['subscription:Free','auth']]);
        
            // Formula Ingredients 
                $routes->get('/rd/formula_ingredients/(:num)', 'WebAppController::rd_formula_ingredients/$1', ['filter'=>['subscription:Free','auth']]);
                $routes->get('/rd/formula_ingredients/csv/(:num)', 'WebAppController::rd_formula_ingredients_csv/$1', ['filter'=>['subscription:Free','auth'],'as' => 'rd_formula_csv']);
                $routes->post('/rd/formula_ingredients/csv/(:num)', 'WebAppController::rd_formula_ingredients_api/$1', ['filter'=>['subscription:Free','auth'],'as' => 'rd_formula_api']);

                $routes->post('/rd/formula_ingredients_add', 'WebAppController::add_formula_ingredient', ['filter'=>['subscription:Free','auth']]);
                $routes->get('/formula_ingredients_edit/(:segment)', 'WebAppController::edit_formula_ingredient/$1', ['filter'=>['subscription:Free','auth']]);
                $routes->post('/update_formula_ingredient/(:num)', 'WebAppController::update_formula_ingredient/$1', ['filter'=>['subscription:Free','auth']]);
                $routes->get('/formula_ingredients_delete/(:num)', 'WebAppController::delete_formula_ingredient/$1', ['filter'=>['subscription:Free','auth']]);

        // Production
            $routes->get('/manufacturing/production', 'WebAppController::manufacturing_production', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/production_add', 'WebAppController::add_manuf_production', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/manuf_production_edit/(:num)', 'WebAppController::edit_manuf_production/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/manuf_production_update', 'WebAppController::update_manuf_production', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/production_delete/(:num)', 'WebAppController::delete_manuf_production/$1', ['filter'=>['subscription:Pro','auth']]);

            // Production Batch
                $routes->post('/batch/production','WebAppController::update_test_batch', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/manufacturing/manuf_production_batch/(:num)', 'WebAppController::manuf_production_batch/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/manufacturing/manuf_production_batch/csv/(:num)', 'WebAppController::manuf_production_batch_csv/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->post('/manufacturing/manuf_production_batch/csv/(:num)', 'WebAppController::manuf_production_batch_api/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->post('/manufacturing/manuf_production_batch_add', 'WebAppController::add_manuf_batch', ['filter'=>['subscription:Pro','auth']]);

        // Journal
            $routes->get('/manufacturing/journal', 'JournalController::journal_view', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/journal', 'JournalController::journal_save', ['filter'=>['subscription:Pro','auth'], 'as'=>'save_journal']);
        //upload
            $routes->post('/manufacturing/journal/image', 'JournalController::image_save');
    // Compliance

        // Policies
            $routes->get('/policies', 'PoliciesController::policies', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/policies_add', 'PoliciesController::policies_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/policies_view/(:num)', 'PoliciesController::policies_view/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/policies_edit/(:num)', 'PoliciesController::policies_edit/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/policies_update', 'PoliciesController::policies_update', ['filter'=>['subscription:Pro','auth']]); 
            $routes->get('/policies_delete/(:num)', 'PoliciesController::policies_delete/$1', ['filter'=>['subscription:Pro','auth']]); 

        // Testing
            $routes->get('/testing', 'TestingController::testing', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/testing_add', 'TestingController::testing_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/testing_view/(:num)', 'TestingController::testing_view/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/testing_edit/(:num)', 'TestingController::testing_edit/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/testing_update', 'TestingController::testing_update', ['filter'=>['subscription:Pro','auth']]); 
            $routes->get('/testing_delete/(:num)', 'TestingController::testing_delete/$1', ['filter'=>['subscription:Pro','auth']]); 

        // Product Information File 
            $routes->get('/rd/cpn', 'WebAppController::rd_cpn', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/rd_cpn_add', 'WebAppController::rd_cpn_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/rd_cpn_view/(:num)', 'WebAppController::rd_cpn_view/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/rd_cpn_edit/(:num)', 'WebAppController::rd_cpn_edit/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/rd_cpn_update', 'WebAppController::rd_cpn_update', ['filter'=>['subscription:Pro','auth']]); 
            $routes->get('/rd_cpn_delete/(:num)', 'WebAppController::rd_cpn_delete/$1', ['filter'=>['subscription:Pro','auth']]); 

        // Ingredient Batch Certificate
            $routes->get('/manufacturing/ingredientbatches/', 'WebAppController::manuf_ingredient_batches', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/ingredientbatches/csv', 'WebAppController::manuf_ingredient_batches_csv', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/ingredientbatches/csv', 'WebAppController::manuf_ingredient_batches_api', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/ingredientbatch_add', 'WebAppController::manuf_ingredient_batches_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/ingredientbatch_edit/(:num)', 'WebAppController::edit_ingredientbatch/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/ingredientbatch_view/(:num)', 'WebAppController::view_ingredientbatch/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/manufacturing/ingredientbatch_update', 'WebAppController::update_ingredientbatch', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/manufacturing/ingredientbatch_delete/(:num)', 'WebAppController::delete_ingredientbatch/$1', ['filter'=>['subscription:Pro','auth']]);

        // Production Batch Certificate
            $routes->get('/manufacturing/batchcertificates/', 'WebAppController::manuf_batch_certificates', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/batchcertificatesviewman/(:num)', 'WebAppController::batch_certificates_view_man/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/batchcertificatesviewman/csv/(:num)', 'WebAppController::batch_certificates_view_man_csv/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/batchcertificatesviewman/csv/(:num)', 'WebAppController::batch_certificates_view_man_api/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/batchcertificatesviewrd/(:num)', 'WebAppController::batch_certificates_view_rd/$1', ['filter'=>['subscription:Pro','auth']]);

    // Planning

        $routes->get('/planning', 'WebAppController::planning', ['filter'=>['subscription:Pro','auth']]);

        // Tasks
            $routes->get('/tasks', 'TasksController::tasks', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/tasks_add', 'TasksController::tasks_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/tasks_view/(:num)', 'TasksController::tasks_view/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/tasks_edit/(:num)', 'TasksController::tasks_edit/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/tasks_update', 'TasksController::tasks_update', ['filter'=>['subscription:Pro','auth']]); 
            $routes->get('/tasks_delete/(:num)', 'TasksController::tasks_delete/$1', ['filter'=>['subscription:Pro','auth']]); 

        // Calendar 
            $routes->get('/calendar', 'CalendarController::calendar', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/calendar_add', 'CalendarController::calendar_add', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/calendar_view/(:num)', 'CalendarController::calendar_view/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/calendar_edit/(:num)', 'CalendarController::calendar_edit/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/calendar_update', 'CalendarController::calendar_update', ['filter'=>['subscription:Pro','auth']]); 
            $routes->get('/calendar_delete/(:num)', 'CalendarController::calendar_delete/$1', ['filter'=>['subscription:Pro','auth']]); 

        // Convert all models to Ms Word
        $routes->get('/fetch_all_models/(:num)', 'WebAppController::fetch_models/$1', ['filter' => ['subscription:Pro','auth']]);
        $routes->post('/fetch_all_models', 'WebAppController::fetch_models_api', ['filter' => ['subscription:Pro','auth']]);
    
        // Export PDF
            $routes->get('/exportPDF', 'WebAppController::exportPDF', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/viewTable', 'WebAppController::viewTable', ['filter'=>['subscription:Pro','auth']]);

        // Business Models
            $routes->get('/corporate/models', 'WebAppController::corporate_models', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/corporate_models_add', 'WebAppController::add_models', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_models_edit/(:num)', 'WebAppController::edit_models/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_models_view/(:num)', 'WebAppController::view_models/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/corporate_models_update', 'WebAppController::update_models', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_models_delete/(:num)', 'WebAppController::delete_models/$1', ['filter'=>['subscription:Pro','auth']]);

            // Models - Overheads 
                $routes->get('/corporate_models_overheads/(:num)', 'WebAppController::models_overheads/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'model_overview']);
                $routes->get('/corporate_models_overheads_data/(:num)', 'WebAppController::models_overheads_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'model_overview_data']);
                $routes->post('/corporate_models_overheads_add', 'WebAppController::add_models_overheads', ['filter'=>['subscription:Pro','auth']]);

            // Models - Formulas 
                $routes->get('/corporate_models_formulas/(:num)', 'WebAppController::models_formulas/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_formulas_data/(:num)', 'WebAppController::models_formulas_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_formulas_data']);
                $routes->post('/corporate_models_formulas/(:num)', 'WebAppController::models_formulas_save/$1', ['filter'=>['subscription:Pro','auth']]);
                
            // Models - Ingredients 
                $routes->get('/corporate_models_ingredients/(:num)', 'WebAppController::models_ingredients/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_ingredients_data/(:num)', 'WebAppController::models_ingredients_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_ingredients_data']);
                $routes->get('/corporate_models_ingredients_json/(:num)', 'WebAppController::models_ingredients_json/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->post('/corporate_models_ingredients/(:num)', 'WebAppController::models_ingredients_save/$1', ['filter'=>['subscription:Pro','auth']]);
            
            // Models - Manufacturing 
                $routes->get('/corporate_models_manufacturing/(:num)', 'WebAppController::models_manufacturing/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_manufacturing_data/(:num)/(:num)', 'WebAppController::models_manufacturing_data/$1/$2', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_manufacturing_data']);
                $routes->post('/corporate_models_manufacturing_update', 'WebAppController::save_models_manufacturing', ['filter'=>['subscription:Pro','auth']]);

            // Models - Packaging 
                $routes->get('/corporate_models_packaging/(:num)', 'WebAppController::models_packaging/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_packaging_data/(:num)', 'WebAppController::models_packaging_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_packaging_data']);
                $routes->post('/corporate_models_packaging_save/(:num)', 'WebAppController::save_models_packaging/$1', ['filter'=>['subscription:Pro','auth']]);

            // Models - Marketing 
                $routes->get('/corporate_models_marketing/(:num)', 'WebAppController::models_marketing/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_marketing_data/(:num)', 'WebAppController::models_marketing_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_marketing_data']);
                $routes->post('/corporate_models_marketing_update', 'WebAppController::update_models_marketing', ['filter'=>['subscription:Pro','auth']]);

            // Models - Financing 
                $routes->get('/corporate_models_financing/(:num)', 'WebAppController::models_financing/$1', ['filter'=>['subscription:Pro','auth']]);
                $routes->get('/corporate_models_financing_data/(:num)', 'WebAppController::models_financing_data/$1', ['filter'=>['subscription:Pro','auth'], 'as'=> 'models_financing_data']);
                $routes->post('/corporate_models_financing_update', 'WebAppController::update_models_financing', ['filter'=>['subscription:Pro','auth']]);
   
    // Accounts
    
        // User
            $routes->get('/corporate/staff', 'WebAppController::corporate_staff', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/corporate/staff_add', 'WebAppController::add_staff', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_staff_edit/(:num)', 'WebAppController::edit_staff/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_staff_view/(:num)', 'WebAppController::view_staff/$1', ['filter'=>['subscription:Pro','auth']]);
            $routes->post('/corporate_staff_update', 'WebAppController::update_staff', ['filter'=>['subscription:Pro','auth']]);
            $routes->get('/corporate_staff_delete/(:num)', 'WebAppController::delete_staff/$1', ['filter'=>['subscription:Pro','auth']]);

        // Login
            $routes->get('/profile/(:num)', 'WebAppController::profile/$1' , ['filter' => ['auth','subscription:Free']]);
            $routes->get('/login', 'WebAppController::login');
            $routes->get('/', 'WebAppController::login');
            $routes->post('/stripe', 'WebAppController::stripes', ['filter'=>['subscription:Free']]);
            $routes->post('/ppress', 'WebAppController::ppress', ['filter'=>['subscription:Free']]);
            $routes->post('/login/auth', 'WebAppController::autho');
            $routes->get('/testemail', 'WebAppController::testemail', ['filter'=>['subscription:Pro']]);
            $routes->get('/request_password', 'WebAppController::request_password', ['filter'=>['subscription:Pro']]);

        // logout
            $routes->get('/logout', 'WebAppController::logout');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (file_exists(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
