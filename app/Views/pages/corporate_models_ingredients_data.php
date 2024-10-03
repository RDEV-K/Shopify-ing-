<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>
<style>
    .so-form-label-sm {
        padding-top: calc(.375rem + 1px);
        padding-bottom: calc(.375rem + 1px);
        margin-bottom: 0;
        font-size: inherit;
        line-height: 1.5;
        display: none;
    }
    @media (min-width:1000px) {
        
    
    .border-bottom-lg{
        border-bottom: 1px solid #000;
        padding-bottom: .5rem;
        margin-bottom: .5rem;
    }
    .border-bottom-light-lg{
        border-bottom: 1px solid #dee2e6;
        padding-bottom: .5rem;
        margin-bottom: .5rem;
    }
    .border-bottom-light-lg .form-control[readonly]{
        background-color: transparent;
        border: none;
        text-align: center;
        padding: 0;
    }
    }
    @media (max-width:600px) {
    .border-bottom-light-lg{
        margin-bottom: 2rem;
    }
        .so-form-label-sm {
            display: block;
        }

        .so-sm-none {
            display: none !important;
        }

        .col-form-label {
            margin-top: 1.25rem;
        }

        #corping_tbl_ingre {
            text-align: left !important;
        }

        #corping_tbl_ingre input {
            text-align: left !important;
        }
    }
</style>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

    <form method="post" id="add_entry" name="add_entry"
        action="<?= base_url() ?>/corporate_models_ingredients/<?= $models['models_id'] ?>">
        <div class="row mt-3">

            <pre><?php //print_r($corpIngredients) 
            function format_number($number = 0, $d = 0, $t = false)
            {
                if (!$number)
                    return "£0.00";
                if (!preg_match("/\d+/", $number))
                    return "0";
                if ($t) {
                    $parts = explode(".", (round($number, $d) * 1));
                    $d = isset($parts[1]) ? strlen($parts[1]) : 0;
                }
                $f = number_format($number, $d);
                return $f;
            }
            ?></pre>

            <!-- View Table -->
                <div class="modal fade" id="viewTable" tabindex="-1" aria-labelledby="viewTableLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="viewTableLabel">Business Plan</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body"></div>
                        </div>
                    </div>
                </div>
            <!-- View Table -->

            <div class="col-md-9 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Ingredient Amounts Required</div>
                    </strong>
                    <div class="card-body">
                        <?php $status = null;
                        $formula_count = null;
                        if ($corpIngredients && count($corpIngredients) > 0):
                            $formula_count = $formula_counts;
                            $status = 1 ?>
                            <input type="hidden" name="corporate_ingredient_id"
                                value="<?= $corpIngredients['corporate_ingredient_id'] ?>">
                        <?php endif ?>
                       
                        <div class="container-fluid px-1 table-data">
                            <div class="table_row row border-bottom-lg text-center">
                                <div class="col-2 so-sm-none"><strong>Ingredient</strong></div>
                                <div class="col-2 so-sm-none"><strong>INCI</strong></div>
                                <div class="col-2 so-sm-none"><strong>Required Qty (kg)</strong></div>
                                <div class="col-2 so-sm-none"><strong>Supplier</strong></div>
                                <div class="col-2 so-sm-none"><strong>Order Qty (kg)</strong></div>
                                <div class="col-2 so-sm-none"><strong>Price</strong></div>
                            </div>
                        </div>
                        <?php if ($f_ingredients && count($f_ingredients)):
                            $percent = null; ?>
                            <?php foreach ($f_ingredients as $key => $f_ingredient):
                                $percent = 100; ?>

                            <?php endforeach; ?>
                            <div id="corping_tbl_ingre" class="text-center">
                                <?php foreach ($f_ingredients as $key => $f_ingredient):
                                    $s = null;
                                    $p = null;
                                    $q = null; ?>
                                    <?php if ($corpIngredients && count($corpIngredients) > 0):
                                        // echo "<pre>";print_r($corpIngredients); echo "</pre>";die;
                            
                                        ?>

                                        <?php
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
                                        ?>
                                    <?php endif ?>

                                    <div class="container-fluid px-0 table-data">
                                        <div class="form-group table_row border-bottom-light-lg row ">
                                            <div class="col-sm-2 ">
                                                <label for="" class="so-form-label-sm">
                                                    Ingredient
                                                </label>
                                                <input type="text" class="form-control ingredient"
                                                    data-ingre_id="<?= $f_ingredient->f_ingredients_ingredients ?>"
                                                    value="<?= $f_ingredient->ingredient_name ?>" readonly>
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="so-form-label-sm">
                                                    INCI
                                                </label>
                                                <input type="text" class="form-control"
                                                    value="<?= $f_ingredient->ingredient_inci ?>" readonly>
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="so-form-label-sm">
                                                    Required Qty (kg)
                                                </label>
                                                <span class="form-control f_ingredients_qty" name="f_ingredients_qty"
                                                    id="f_ingredients_qty"><?= is_float(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty) ? format_number(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty, 2) ?? "0" : format_number(($f_ingredient->f_ingredients_qty / $percent) * $batch_qty, 2, true) ?? "0"; ?></span>
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="so-form-label-sm">
                                                    Supplier
                                                </label>
                                                <input type="text" onblur="getTotal_ingre()" value="<?= $s ?>"
                                                    class="form-control models_supplier text-center" id="models_supplier"
                                                    name="models_supplier">
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="so-form-label-sm">
                                                    Order Qty (kg)
                                                </label>
                                                <input type="number" oninput="getTotal_ingre()" value="<?= $q ?>"
                                                    class="form-control models_order_qty text-center" id="models_order_qty"
                                                    name="models_order_qty" step="any">
                                            </div>
                                            <div class="col-sm-2">
                                                <label for="" class="so-form-label-sm">
                                                    Price
                                                </label>
                                                <input type="number" oninput="getTotal_ingre()" value="<?= $p ?>"
                                                    class="form-control models_price text-center" id="models_price"
                                                    name="models_price" step="any">
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach ?>
                            </div>
                        <?php endif ?>

                    </div>
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Ingredient Costs</div>
                    </strong>
                    <div class="card-body">
                        <table id="calculationSummary_ingre" class="table display text-center">
                            <thead class="table-data">
                                <tr>
                                    <th>Total Cost</th>
                                    <th>Cost per kg</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <tr>
                                    <td id="total_price_ingre">0</td>
                                    <td id="total_kg_ingre">0</td>
                                </tr>
                            </tbody>

                        </table>
                    </div>

                    <input type="hidden" name="formula_ids_ingre">
                    <input type="hidden" name="suppliers_ingre">
                    <input type="hidden" name="order_qty_ingre">
                    <input type="hidden" name="prices_ingre">
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col justify-content-start align-items-center form-button">
                <button type="submit" class="btn btn-success">Save</button>
                <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                <a href="https://ingrevo.com/business-planning-part-3-ingredients/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>
    </form>
</main>

<script>
    function getInput() {
        return new Promise((res, rej) => {
            let formu_id = [];
            let formu_qty = [];
            let tot_qty = [];
            let tot_price = [];
            let supplier = [];
            let allInput = ['models_price', 'models_order_qty', 'models_supplier'];
            $('#corping_tbl_ingre .table_row').each(function (i, v) {
                if ($(v).children().children(`input.${allInput[0]}`).val() ||
                    $(v).children().children(`input.${allInput[1]}`).val() ||
                    $(v).children().children(`input.${allInput[2]}`).val()) {
                        // console.log($(v).find('.ingredient'));
                    formu_id.push($(v).find('.ingredient').data('ingre_id'));
                    formu_qty.push($(v).children().children('span.f_ingredients_qty').html());
                    tot_price.push($(v).children().children('input.models_price').val());
                    tot_qty.push($(v).children().children('input.models_order_qty').val());
                    supplier.push($(v).children().children('input.models_supplier').val());
                }
            });
            // console.log(formu_id);
            res({ formu_id, tot_qty, tot_price, supplier, formu_qty });
        })

    }
    function no_duplicate(formula_id) {
        return formula_id.filter((e, i, s) => i === s.indexOf(e));
    }

    if ('<?= $batch_qty ?>' == 0 || !'<?= $batch_qty ?>') {
        $(`
            <tfoot>
                <tr><td colspan="6" class="text-danger">Corporate Formulas Models is not set!</td></tr>
            </tfoot>
        `).appendTo('#corping_tbl_ingre');

        $(`
            <tfoot>
                <tr><td colspan="3" class="text-danger">Corporate Formulas Models is not set!</td></tr>
            </tfoot>
        `).appendTo('#calculationSummary_ingre');

    } else {
        getTotal_ingre();
    }

    function getTotal_ingre() {
        let batch_qty = 0;
        let unit_qty = 0;
        let formula_count = 0;

        if (!'<?= $unit_qty ?>') return;
        batch_qty = '<?= $batch_qty ?>';
        unit_qty = '<?= $unit_qty ?>';
        formula_count = '<?= $formula_counts ?>';
        getInput().then(results => {
            const { formu_id, tot_qty, tot_price, supplier, formu_qty } = results;
            // console.log(formu_id,tot_qty,tot_price,supplier,formu_qty);
            let total_price = 0;
            let total_unit = 0; let t_price = 0;
            if (tot_price.length > 0) {
                $.each(tot_price, function (i, v) {
                    let unit_qtys = 0
                    if (v.length > 0) {
                        unit_qtys = parseFloat(v) / parseFloat(formu_qty[i])
                        // total_unit = total_unit + unit_qtys;
                        total_price += parseFloat(unit_qtys) * parseFloat(formu_qty[i]);
                    }
                });
                let total_kg = total_price / (parseFloat(batch_qty) * parseFloat(formula_count));
                total_unit = ((parseFloat(batch_qty) * parseFloat(formula_count)) / parseFloat(unit_qty)) / parseFloat(total_price);
                // console.log(unit_qty, formu_id);
                $("[name='formula_ids_ingre']").val(JSON.stringify(formu_id));
                $("[name='suppliers_ingre']").val(JSON.stringify(supplier));
                $("[name='order_qty_ingre']").val(JSON.stringify(tot_qty));
                $("[name='prices_ingre']").val(JSON.stringify(tot_price));

                // $('#total_unit').html(`£${total_unit.format_number(2)}`);
                $('#total_kg_ingre').html(`${parseFloat(total_kg).format_number(2)}`);
                $('#total_price_ingre').html(`${total_price.format_number(2)}`);
            }
        })
    }
    Number.prototype.format_number = function (n, x) {
        let re = `\\d(?=(\\d{${x || 3}})+${(n > 0 ? '\\.' : '$')})`;
        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
        // if(isNaN(number)) return 0;
        // return (number).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
    }
    if ('<?= $status ?>') {
    }


    var root_ingre = '<?= base_url() ?>';
    var modelID = "<?= $models['models_id'] ?>";
    // var url = `${root_ingre}/corporate_models_ingredients_json/${modelID}`;

    // var columns = [
    //     { field: 'ingredient', headerText: 'Ingredient', width: 50,},
    //     { field: 'inci', headerText: 'INCI', textAlign: 'Center', width: 90, type: 'string' },
    //     { field: 'qty', headerText: 'Required Qty (kg)', textAlign: 'Center', width: 150, type: 'string' },
    //     { field: 'supplier', width: 90, headerText: 'Supplier', type: 'string' },
    //     { field: 'order', width: 90, headerText: 'Order Qty (kg)', type: 'string' },
    //     { field: 'price', width: 40, headerText: 'Price', type: 'string' },
    // ];

    // // View Table
    // function viewTable(){
    //     $("#viewTable .modal-body").load(root_ingre+"/viewTable")
    //     var viewTableModal = new bootstrap.Modal(document.querySelector("#viewTable"))
    //     viewTableModal.show()
    // }

</script>