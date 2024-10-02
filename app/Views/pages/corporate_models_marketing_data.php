<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>
<style>
    .so-row{
        padding-bottom: 10px;
        border-bottom: 1px solid #000;
    }
    .so-form-label-sm {
        padding-top: calc(.375rem + 1px);
        padding-bottom: calc(.375rem + 1px);
        margin-bottom: 0;
        font-size: inherit;
        line-height: 1.5;
        display: none;
        font-weight: bold;
    }
    .show-desktop{
        display: block;
    }
    .show-mobile{
        display: none;
    }
    @media (max-width:600px) {
        .show-desktop{
            display: none;
        }
        .show-mobile{
            display: block;
        }
        .so-row{
            display: none !important;
        }
        .so-form-label-sm {
            display: block;
        }

        .so-sm-none {
            display: none !important;
        }

        .table-data .row {
            margin-bottom: 0 !important;
        }
        .so-flex{
            display: flex;
            gap: 10px;
            align-items: center;
            p{
                margin-bottom: 0;
                padding-top: calc(.375rem + 1px);
                padding-bottom: calc(.375rem + 1px);
            }
        }
        .so-border {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
    }
</style>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">
<form method="post" id="add_entry" class="show-desktop" name="add_entry" action="<?= base_url('/corporate_models_marketing_update') ?>">
        <div class="row mt-3">    
            <input type="hidden" name="models_id" value="<?=$models_id ?>">

            <!-- Sales Overview -->
            <div class="col-md-5 mb-3">
                <div class="card">
                    <strong><div class="card-header">Quarterly Sales Overview</div></strong>
                    <div class="card-body">
                        <table id="example1" class="table display text-center">
                            <thead class="table-data">
                                <tr>
                                    <th></th>
                                    <th>Quartely</th>
                                    <th>Monthly</th>
                                    <th>Daily</th>

                                </tr>
                            </thead>
                            <tbody class="table-data" id="cashs">
                                <tr>
                                    <th>No. of Sales</th>
                                    <td id="cf_qs"><span>0</span></td>
                                    <td id="cf_ms"><span>0</span></td>
                                    <td id="cf_ds"><span>0</span></td>
                                </tr>
                                <tr>
                                    <th>Manufacturing</th>
                                    <td id="cf_qss">0</td>
                                    <td id="cf_mss">0</td>
                                    <td id="cf_dss">0</td>
                                </tr>
                                <tr>
                                    <th>Advertising</th>
                                    <td id="cf_qas">0</td>
                                    <td id="cf_mas">0</td>
                                    <td id="cf_das">0</td>
                                </tr>
                                <tr>
                                    <th>Revenue</th>
                                    <td id="cf_qr">0</td>
                                    <td id="cf_mr">0</td>
                                    <td id="cf_dr">0</td>
                                </tr>
                                <tr>
                                    <th>Profit</th>
                                    <td id="cf_qp">0</td>
                                    <td id="cf_mp">0</td>
                                    <td id="cf_dp">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Operational -->
            <div class="col-md-7 mb-3">
                <div class="card">
                    <strong><div class="card-header">Quartely Plan Summary</div></strong>
                    <div class="card-body">
                        <table id="costs" class="table text-center">
                            <thead class="table-data">
                                <tr>
                                    <th>Overheads</th>
                                    <th>Ingredients</th>
                                    <th>Packaging</th>
                                    <th>Manufacturing</th>
                                    <th>Marketing</th>
                                    <th>Interest</th>
                                    <th>Spend</th>
                                    
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <tr>
                                    <td id="models_oht" data-models_oht="<?=$models_oht ?>"><?=$models_oht ?></td>
                                    <td id="models_igt" data-models_igt="<?=$models_igt ?>"><?=$models_igt ?></td>
                                    <td id="models_pkt" data-models_pkt="<?=$models_pkt ?>"><?=$models_pkt ?></td>
                                    <td id="models_mft" data-models_mft="<?=$models_mft ?>"><?=$models_mft ?></td>
                                    <td id="models_mkt" data-mkt=""></td>
                                    <td id="models_lit"></td>
                                    <td class="op_spend" id="models_spend"></td>
                                   
                                </tr>
                            </tbody>
                        </table>

                        </br>

                        <table id="sales" class="table text-center">
                            <thead class="table-data">
                                <tr>
                                    <th>No. of Units</th>
                                    <th>Total kg</th>
                                    <th>Unit kg</th>
                                    <th>Break Even Units No.</th>
                                    <th>Return</th>
                                    <th>Profit</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <tr>
                                    
                                    <td id="models_nou" data-models_nou="<?= $tot_q_F ?>"><span><?= $tot_q_F ?></span></td>
                                    <td id="models_nqf"><span><?= $unit_q_F ?></span></td>
                                    <td id="models_nouk"><span><?= $no_u_F ?></span></td>
                                    <td id="brEvUnNo">0</td>
                                    <td id="models_return">0</td>  
                                    <td id="models_profit">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">

            <!-- Marketing -->
            <div class="col-md-2 mb-3">
                <div class="card">
                <strong><div class="card-header">Marketing</div></strong>
                    <div class="card-body table-data">
                        <?php $pp = null;$tr=null;$ir=null;$status=null;
                            if($marketing) : 
                                $pp = $marketing['models_sales_pp'];
                                $tr = $marketing['models_sales_tr'];
                                $ir = $marketing['models_li'];
                                $status = 1;
                        ?>
                            <input type="hidden" name="model_marketing_id" value="<?=$marketing['model_marketing_id']?>">
                        <?php endif; ?>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Profit %</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" value="<?=$pp?>" id="models_sales_pp" name="models_sales_pp" step="any" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">ROAS</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" value="<?=$tr ? $tr : 0?>" id="models_sales_tr" name="models_sales_tr" step="any" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Finance -->
            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong><div class="card-header">Financing</div></strong>
                    <div class="card-body table-data">

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Loan Amount</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" data-models_la="" id="models_la" name="models_la" step="any" required readonly>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Interest Rate</label>
                            <div class="col-sm-6">
                                <input type="number" value="<?=$ir ?>" class="form-control" id="models_li" name="models_li" step="any" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Total Repayable</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="models_lr" name="models_lr" step="any" placeholder="Total Repayable" required readonly>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Interest Repayable</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="models_ir" name="models_ir" step="any" placeholder="Interest Repayable" required readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales RRP-->
            <div class="col-md-7 mb-3">
                <div class="card">
                    <strong><div class="card-header">RRP</div></strong>
                    <div class="card-body">
                        <div class="col">
                            <table id="corping_tbl" class="table display text-center">
                                <thead class="table-data">
                                    <tr>
                                        <th>Product</th>
                                        <th>Unit Cost</th>
                                        <th>Break Even</th>
                                        <th>With Profit</th>
                                        <th>Set RRP</th>
                                        <th>Return</th>
                                        <th>Profit</th>
                                    </tr>
                                </thead>
                                <tbody class="table-data">
                                    <pre><?php //print_r($product_lists);die; ?></pre>
                                    <?php if($product_lists) : foreach($product_lists as $key => $prod ) : 
                                        $rrp = null;
                                        if($marketing) {
                                            $models_rrp = json_decode($marketing['models_rrp']);
                                            $formu_id = json_decode($marketing['formu_id']);
                                            foreach($formu_id as $f => $formu_) {
                                                if($prod->formula_id == $formu_) {
                                                    $rrp = $models_rrp[$f];
                                                }
                                            }
                                        }
                                    ?>
                                    <tr id="product_list">
                                        <td width="25%"><?= $prod->formula_version ?> <?= $prod->formula_rdplan ?></td>
                                        <td width="10%" id="models_puc" class="models_puc" data-models_puc="<?=$prod->models_puc ?>"><?=$prod->models_puc ?></td>
                                        <td width="10%" id="models_pbe" class="models_pbe">0</td>
                                        <td width="10%" id="models_pip" class="models_pip"></td>
                                        <td width="15%"><input id="models_rrp" data-models_rrp="<?= $prod->formula_id?>" value="<?=$rrp ?>" class="form-control models_rrp" type="number" step="any"></td>
                                        <td width="15%" id="models_str" class="models_str"></td>
                                        <td width="15%" id="models_ppa" class="models_ppa"></td>
                                    </tr>
                                    <?php endforeach; endif ?>
                                    <input type="hidden" name="models_rrp">
                                    <input type="hidden" name="formu_id">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col justify-content-start align-items-center form-button">
                <button type="submit" class="btn btn-success">Save</button>
                <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                <a href="https://ingrevo.com/business-planning-part-6-marketing/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

    </form>
    <form method="post" id="add_entry" class="show-mobile" name="add_entry" action="<?= base_url('/corporate_models_marketing_update') ?>">
        <div class="row mt-4">
            <input type="hidden" name="models_id" value="<?= $models_id ?>">

            <!-- Sales Overview -->
            <div class="col-md-4 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Quartely Sales Overview</div>
                    </strong>
                    <div class="card-body">
                        <table id="example1" class="table display text-center">
                            <thead class="table-data">
                                <tr>
                                    <th></th>
                                    <th>Quartely</th>
                                    <th>Monthly</th>
                                    <th>Daily</th>

                                </tr>
                            </thead>
                            <tbody class="table-data" id="cashs">
                                <tr>
                                    <th>Sales</th>
                                    <td id="cf_qs"><span>0</span></td>
                                    <td id="cf_ms"><span>0</span></td>
                                    <td id="cf_ds"><span>0</span></td>
                                </tr>
                                <tr>
                                    <th>Revenue</th>
                                    <td id="cf_qr">0</td>
                                    <td id="cf_mr">0</td>
                                    <td id="cf_dr">0</td>
                                </tr>
                                <tr>
                                    <th>Operational Spend</th>
                                    <td id="cf_qss">0</td>
                                    <td id="cf_mss">0</td>
                                    <td id="cf_dss">0</td>
                                </tr>
                                <tr>
                                    <th>Ad Spend</th>
                                    <td id="cf_qas">0</td>
                                    <td id="cf_mas">0</td>
                                    <td id="cf_das">0</td>
                                </tr>
                                <tr>
                                    <th>Profit</th>
                                    <td id="cf_qp">0</td>
                                    <td id="cf_mp">0</td>
                                    <td id="cf_dp">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Operational -->
            <div class="col-md-8 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Operational Information</div>
                    </strong>
                    <div class="card-body">
                            <div class="row mb-2 so-row">
                                <div class="col so-sm-none"><strong>Overheads</strong></div>
                                <div class="col so-sm-none"><strong>Ingredients</strong></div>
                                <div class="col so-sm-none"><strong>Packaging</strong></div>
                                <div class="col so-sm-none"><strong>Manufacturing</strong></div>
                                <div class="col so-sm-none"><strong>Marketing</strong></div>
                                <div class="col so-sm-none"><strong>Loan Interest</strong></div>
                                <div class="col so-sm-none"><strong>Operational Spend</strong></div>
                                <div class="col so-sm-none"><strong>Total Return</strong></div>
                                <div class="col so-sm-none"><strong>Gross Profit</strong></div>
                            </div>
                            <div id="costs" class="form-group row">
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Overheads
                                    </label>
                                    <p id="models_oht" data-models_oht="<?= $models_oht ?>"><?= $models_oht ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Ingredients
                                    </label>
                                    <p id="models_igt" data-models_igt="<?= $models_igt ?>"><?= $models_igt ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Packaging
                                    </label>
                                    <p id="models_pkt" data-models_pkt="<?= $models_pkt ?>"><?= $models_pkt ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Manufacturing
                                    </label>
                                    <p id="models_mft" data-models_mft="<?= $models_mft ?>"><?= $models_mft ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Marketing
                                    </label>
                                    <p id="models_mkt" data-mkt=""></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Loan Interest
                                    </label>
                                    <p id="models_lit"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Operational Spend
                                    </label>
                                    <p class="op_spend" id="models_spend"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Total Return
                                    </label>
                                    <p id="models_return">0</p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                        Gross Profit
                                    </label>
                                    <p id="models_profit">0</p>
                                </div>
                            </div>
                        </br>
                            <div class="row mb-2 so-row">
                                <div class="col so-sm-none"><strong>No of Units</strong></div>
                                <div class="col so-sm-none"><strong>Batch KG</strong></div>
                                <div class="col so-sm-none"><strong>Unit KG</strong></div>
                                <div class="col so-sm-none"><strong>Production Cost</strong></div>
                                <div class="col so-sm-none"><strong>Marketing Spend</strong></div>
                                <div class="col so-sm-none"><strong>Marketing Return</strong></div>
                                <div class="col so-sm-none"><strong>Break Even Units No.</strong></div>
                            </div>
                            <div id="sales" class="form-group row mb-0">
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    No of Units
                                    </label>
                                    <p id="models_nou" data-models_nou="<?= $tot_q_F ?>"><span><?= $tot_q_F ?></span>
                                    </p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Batch KG
                                    </label>
                                    <p id="models_nqf"><span><?= $unit_q_F ?></span></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Unit KG
                                    </label>
                                    <p id="models_nouk"><span><?= $no_u_F ?></span></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Production Cost
                                    </label>
                                    <p id="models_ouc">0</p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Marketing Spend
                                    </label>
                                    <p id="models_mst"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Marketing Return
                                    </label>
                                    <p id="models_mrt"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Break Even Units No.
                                    </label>
                                    <p id="brEvUnNo">0</p>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">

            <!-- Marketing -->
            <div class="col-md-2 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Marketing</div>
                    </strong>
                    <div class="card-body table-data">
                        <?php $pp = null;
                        $tr = null;
                        $ir = null;
                        $status = null;
                        if ($marketing):
                            $pp = $marketing['models_sales_pp'];
                            $tr = $marketing['models_sales_tr'];
                            $ir = $marketing['models_li'];
                            $status = 1;
                            ?>
                            <input type="hidden" name="model_marketing_id" value="<?= $marketing['model_marketing_id'] ?>">
                        <?php endif; ?>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Profit Percentage</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" value="<?= $pp ?>" id="models_sales_pp"
                                    name="models_sales_pp" step="any" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Target ROAS</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" value="<?= $tr ? $tr : 0 ?>"
                                    id="models_sales_tr" name="models_sales_tr" step="any" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Finance -->
            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Financing</div>
                    </strong>
                    <div class="card-body table-data">

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Loan Amount</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" data-models_la="" id="models_la"
                                    name="models_la" step="any" required readonly>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Interest Rate</label>
                            <div class="col-sm-6">
                                <input type="number" value="<?= $ir ?>" class="form-control" id="models_li"
                                    name="models_li" step="any" required>
                            </div>
                        </div>
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Total Repayable</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="models_lr" name="models_lr" step="any"
                                    placeholder="Total Repayable" required readonly>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Interest Repayable</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="models_ir" name="models_ir" step="any"
                                    placeholder="Interest Repayable" required readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sales RRP-->
            <div class="col-md-7 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">RRP</div>
                    </strong>
                    <div class="card-body">
                    <div class="row mb-2 so-row">
                                <div class="col so-sm-none"><strong>Product</strong></div>
                                <div class="col so-sm-none"><strong>Unit Cost</strong></div>
                                <div class="col so-sm-none"><strong>Break Even</strong></div>
                                <div class="col so-sm-none"><strong>Incl. Profit</strong></div>
                                <div class="col so-sm-none"><strong>RRP</strong></div>
                                <div class="col so-sm-none"><strong>Product Return</strong></div>
                                <div class="col so-sm-none"><strong>Product Profit</strong></div>
                            </div>
                            <?php if ($product_lists):
                             $index = 0;
                                        foreach ($product_lists as $key => $prod):
                                            $rrp = null;
                                            if ($marketing) {
                                                $models_rrp = json_decode($marketing['models_rrp']);
                                                $formu_id = json_decode($marketing['formu_id']);
                                                foreach ($formu_id as $f => $formu_) {
                                                    if ($prod->formula_id == $formu_) {
                                                        $rrp = $models_rrp[$f];
                                                    }
                                                }
                                            }
                                            ?>
                            <div id="product_list" class="form-group row <?= $index > 0 ? 'so-border' : '' ?>">
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Product
                                    </label>
                                    <p><?= $prod->formula_version ?>         <?= $prod->formula_rdplan ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Unit Cost
                                    </label>
                                    <p id="models_puc" class="models_puc"
                                    data-models_puc="<?= $prod->models_puc ?>"><?= $prod->models_puc ?></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Break Even
                                    </label>
                                    <p id="models_pbe" class="models_pbe">0</p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Incl. Profit
                                    </label>
                                    <p id="models_pip" class="models_pip"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    RRP
                                    </label>
                                    <p><input id="models_rrp" data-models_rrp="<?= $prod->formula_id ?>"
                                        value="<?= $rrp ?>" class="form-control models_rrp" type="number" step="any">
                                    </p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Product Return
                                    </label>
                                    <p id="models_str" class="models_str"></p>
                                </div>
                                <div class="col-sm so-flex">
                                    <label for="" class="so-form-label-sm">
                                    Product Profit
                                    </label>
                                    <p id="models_ppa" class="models_ppa"></p>
                                </div>
                            </div>
                            <?php $index++; endforeach; endif ?>
                            <input type="hidden" name="models_rrp">
                            <input type="hidden" name="formu_id">
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col justify-content-start align-items-center form-button">
                <button type="submit" class="btn btn-success">Save</button>
                <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                <a href="https://ingrevo.com/business-planning-part-6-marketing/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

    </form>
</main>
<script>
window.addEventListener('resize', soFunc);
  function soFunc(){
    let width = window.innerWidth;
    if (width <= 768 && $('.show-mobile').html()=="") {
        location.reload();
    }else if(width>768 && $('.show-desktop').html()==""){
        location.reload();
    }
    console.log(window.innerWidth);
    // console.log($('.show-desktop').html());
    // console.log($('.show-desktop').length);
    // console.log($('.show-mobile').html());
    // console.log($('.show-mobile').length);
  }
 var width = window.innerWidth;
 if (width <= 768) {
    $('.show-desktop').html('');
    
    function getCalc(unit_q_F, no_u_F, i) {
        let rrp_sum = 0;
        let str_sum = 0;
        let pro_count = 0;
        let rrp = [];
        let formu_id = [];
        let models_sales_tr = $('#models_sales_tr').val();
        let models_oht = '<?= $models_oht ?>';
        let models_li = $('#models_li').val();
        let models_la = 0;

        if (!models_li) models_li = 0;
        if (!models_sales_tr) models_sales_tr = 0;
        let models_puc = 0;

        let ir = 0;
        let lr = 0;
        if (models_li) {
            models_la = parseFloat(models_la);
            models_li = parseFloat(models_li);
            ir = models_la * (models_li / 100);
            lr = ir + models_la;
        }
        let oht = $('#models_oht').data('models_oht');
        if (!oht) oht = 0;

        let mkt = document.querySelector('#models_mkt').dataset.mkt;
        if (!mkt) mkt = 0;
        let igt = $('#models_igt').data('models_igt');
        if (!igt) igt = 0;
        let pkt = $('#models_pkt').data('models_pkt');
        if (!pkt) pkt = 0;
        let mft = $('#models_mft').data('models_mft');
        if (!mft) mft = 0;
        let nou = $('#models_nou').data('models_nou');
        if (!nou) nou = 0;
        let ouc = 0;
        let models_pbe = 0;
        $('.models_rrp').each((i, v) => {
            if ($(v).val()) {
                formu_id.push($(v).data('models_rrp'));
                rrp.push($(v).val());
                pro_count = pro_count + 1;
                let models_sales_pp = $('#models_sales_pp').val();
                if (!models_sales_pp) models_sales_pp = 0;
                // console.log(models_pbe + (models_pbe * parseFloat(models_sales_pp)))
                let models_rrp = $(v).val();
                models_rrp = parseFloat(models_rrp);
                rrp_sum = rrp_sum + models_rrp;
                let unit_no_u = unit_q_F / no_u_F;
                let models_str = models_rrp * unit_no_u;
                models_puc = $(v).parent().parent().parent().find('.models_puc').data('models_puc');
                models_puc = parseFloat(models_puc);
                str_sum = str_sum + models_str;
                ouc = (oht + mkt + ir) / nou;
                models_pbe = ouc + models_puc;

            } else {
                if (pro_count < 1) pro_count = 0;
            }
        });
        let models_mst = 0;
        if (models_sales_tr == 0) {
            models_mst = 0;
        } else {
            models_mst = str_sum / models_sales_tr;
        }

        let models_profit = 0;

        let m_spend = oht + mkt + igt + pkt + mft;
        let _la = document.querySelector('#models_la').dataset.models_la;
        if (!_la) _la = m_spend;
        // return;
        recalc(unit_q_F, no_u_F, _la, models_mst);
    }
    function recalc(unit_q_F, no_u_F, models_la, _mst) {
        /* Recalculate */
        let rrp_sum = 0;
        let str_sum = 0;
        let pro_count = 0;
        let rrp = [];
        let formu_id = [];
        let models_sales_tr = $('#models_sales_tr').val();
        let models_oht = $('#models_oht').data('models_oht');
        let models_li = $('#models_li').val();
        // let models_la = $('#models_la').data('models_la');
        $('#models_la').val(`${parseFloat(models_la).format_number(2)}`);
        if (!models_li) models_li = 0;
        if (!models_sales_tr) models_sales_tr = 0;
        let models_puc = 0;

        let ir = 0;
        let lr = 0;
        if (models_li) {
            models_la = parseFloat(models_la);
            models_li = parseFloat(models_li);
            ir = models_la * (models_li / 100);
            lr = ir + models_la;
            $('#models_lr').val(`${(lr).format_number(2)}`);
            $('#models_ir').val(`${(ir).format_number(2)}`);
            $('#models_lit').html(`${(ir).format_number(2)}`);
        } else {
            $('#models_lr').val(`${(0).format_number(2)}`);
            $('#models_ir').val(`${(0).format_number(2)}`);
            $('#models_lit').html(`${(0).format_number(2)}`);
        }

        let oht = $('#models_oht').data('models_oht');
        if (!oht) oht = 0;
        let igt = $('#models_igt').data('models_igt');
        if (!igt) igt = 0;
        let pkt = $('#models_pkt').data('models_pkt');
        if (!pkt) pkt = 0;
        let mft = $('#models_mft').data('models_mft');
        if (!mft) mft = 0;
        let nou = $('#models_nou').data('models_nou');
        if (!nou) nou = 0;
        let ouc = 0;
        let models_pbe = 0;
        let models_mst = 0;
        let models_sales_pp = $('#models_sales_pp').val();
        $('.models_rrp').each((i, v) => {
            models_puc = $(v).parent().parent().parent().find('.models_puc').data('models_puc');
            models_puc = parseFloat(models_puc);
            if ($(v).val()) {
                formu_id.push($(v).data('models_rrp'));

                if (!models_sales_pp) models_sales_pp = 0;
                rrp.push($(v).val());
                pro_count = pro_count + 1;
                // console.log(models_pbe + (models_pbe * parseFloat(models_sales_pp)))
                let models_rrp = $(v).val();
                models_rrp = parseFloat(models_rrp);
                rrp_sum = rrp_sum + models_rrp;
                let unit_no_u = unit_q_F / no_u_F;
                let models_str = models_rrp * unit_no_u;
                str_sum = str_sum + models_str;
               
                if (models_sales_tr && models_sales_tr > 0) {
                    // models_mst = str_sum / models_sales_tr;
                    models_mst = _mst;

                    $('#models_mst').html(`${(models_mst).format_number(2)}`);
                    $('#models_mkt').html(`${(models_mst).format_number(2)}`);
                    document.querySelector('#models_mkt').dataset.models_mkt = models_mst;
                    $('#cf_qas').html(`${(models_mst).format_number(2)}`);
                    $('#cf_mas').html(`${(models_mst / 3).format_number(2)}`);
                    $('#cf_das').html(`${(models_mst / 28).format_number(2)}`);
                } else {
                    $('#models_mkt').html(`${(0).format_number(2)}`);
                    $('#models_mst').html(`${(0).format_number(2)}`);
                    $('#cf_qas').html(`${(0).format_number(2)}`);
                    $('#cf_mas').html(`${(0).format_number(2)}`);
                    $('#cf_das').html(`${(0).format_number(2)}`);
                }
                ouc = (oht + _mst + ir) / nou;
                models_pbe = ouc + models_puc;
                $(v).parent().parent().parent().find('.models_pbe').html(`${(models_pbe).format_number(2)}`);
                $(v).parent().parent().parent().find('.models_str').html(`${models_str.format_number(2)}`);
                $(v).parent().parent().parent().find('.models_ppa').html(`${((models_str - (models_pbe * unit_no_u))).format_number(2)}`);
                $(v).parent().parent().parent().find('.models_pip').html(`${((models_pbe + (models_pbe * models_sales_pp) / 100)).format_number(2)}`);
                // console.log(" valid -> ",oht+" <-> "+_mst+" <-> "+ir+" <-> "+nou+" <-> = "+ouc,i)
            } else {
                models_puc = $(v).parent().parent().parent().find('.models_puc').data('models_puc');
                models_puc = parseFloat(models_puc);
                ouc = (oht + _mst + ir) / nou;
                if (!models_sales_pp) models_sales_pp = 0;
                models_pbe = ouc + models_puc;
                // console.log(" Else -> ",oht+" <-> "+_mst+" <-> "+ir+" <-> "+nou+" <-> = "+ouc,i)
                $(v).parent().parent().parent().find('.models_pbe').html(`${(models_pbe).format_number(2)}`);
                $(v).parent().parent().parent().find('.models_pip').html(`${((models_pbe + (models_pbe * models_sales_pp) / 100)).format_number(2)}`);
                $(v).parent().parent().parent().find('.models_str').html(`${(0).format_number(2)}`);
                $(v).parent().parent().parent().find('.models_ppa').html(`${(0).format_number(2)}`);
                if (pro_count < 1) pro_count = 0;
            }
        });

        $("[name='formu_id']").val(JSON.stringify(formu_id));
        $("[name='models_rrp']").val(JSON.stringify(rrp));
        let models_profit = 0;
        if (models_sales_tr && models_sales_tr > 0) {
        } else {
            $('#models_mkt').html(`${(0).format_number(2)}`);
            document.querySelector('#models_mkt').dataset.mkt = 0;
            $('#models_mst').html(`${(0).format_number(2)}`);
            $('#cf_qas').html(`${(0).format_number(2)}`);
            $('#cf_mas').html(`${(0).format_number(2)}`);
            $('#cf_das').html(`${(0).format_number(2)}`);
        }
        let m_spend = oht + models_mst + igt + pkt + mft;
        document.querySelector('#models_mkt').dataset.mkt = models_mst;
        document.querySelector('#models_la').dataset.models_la = m_spend;
        $('.op_spend').html(`${(m_spend).format_number(2)}`);
        $('#cf_qss').html(`${(m_spend).format_number(2)}`);
        $('#cf_mss').html(`${(m_spend / 3).format_number(2)}`);
        $('#cf_dss').html(`${(m_spend / 84).format_number(2)}`);
        $('#cf_qs').html(`${(nou).format_number(2)}`);
        $('#cf_ms').html(`${(nou / 3).format_number(2)}`);
        $('#cf_ds').html(`${(nou / 84).format_number(2)}`);

        if (pro_count) $('#brEvUnNo').html(`${(m_spend / (rrp_sum / pro_count)).format_number(2)}`);
        if (!pro_count) $('#brEvUnNo').html(`${(0).format_number(2)}`);

        $('#models_ouc').html(`${(ouc).format_number(2)}`);

        $('#models_mrt').html(`${(str_sum).format_number(2)}`);
        $('#models_return').html(`${(str_sum).format_number(2)}`);

        $('#cf_qr').html(`${(str_sum).format_number(2)}`);
        $('#cf_mr').html(`${(str_sum / 3).format_number(2)}`);
        $('#cf_dr').html(`${(str_sum / 84).format_number(2)}`);


        models_profit = str_sum - m_spend - ir;
        $('#models_profit').html(`${(models_profit).format_number(2)}`);
        $('#cf_qp').html(`${(models_profit).format_number(2)}`);
        $('#cf_mp').html(`${(models_profit / 3).format_number(2)}`);
        $('#cf_dp').html(`${(models_profit / 84).format_number(2)}`);


        // console.log(rrp_sum);
        // all_format_no();
    }

    // format all numbers 
    function all_format_no() {
        $('#cashs').children().each((i, v) => {
            if (!isNaN(parseFloat($(v).html()))) $(v).html(`${parseFloat($(v).html()).format_number(2)}`)
        });
        $('#product_list div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').html()))) $(v).find('p').html(`${parseFloat($(v).find('p').html()).format_number(2)}`);
        });
        $('#costs div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').html()))) $(v).find('p').html(`${parseFloat($(v).find('p').html()).format_number(2)}`);
        });
        $('#sales div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').html()))) $(v).find('p').html(`${parseFloat($(v).find('p').html()).format_number(2)}`);
        });

        /* Without currency symbol */
        $('#cashs td').children().each((i, v) => {
            if (!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
        });
        $('#product_list div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').find('span').html()))) $(v).find('p').find('span').html(parseFloat($(v).find('p').find('span').html()).format_number(2));
        });
        $('#costs div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').find('span').html()))) $(v).find('p').find('span').html(parseFloat($(v).find('p').find('span').html()).format_number(2));
        });
        $('#sales div').each((i, v) => {
            if (!isNaN(parseFloat($(v).find('p').find('span').html()))) $(v).find('p').find('span').html(parseFloat($(v).find('p').find('span').html()).format_number(2));
        });
    }
    Number.prototype.format_number = function (n, x) {
        // if(isNaN(n)) return console.log('Not a number')
        let re = `\\d(?=(\\d{${x || 3}})+${(n > 0 ? '\\.' : '$')})`;
        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
    }
    function recal(unit_q_F, no_u_F) {
        let count = 2;
        for (let i = 0; i < count; i++) {
            getCalc(unit_q_F, no_u_F, i);
        }
    }
    $(document).ready(function () {
        let unit_q_F = '<?= $unit_q_F ?>';
        let no_u_F = '<?= $no_u_F ?>';
        $('#product_list input').each((i, v) => {
            $(v).attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        });

        let count = 2;
        for (let i = 0; i < count; i++) {
        }
        $('#models_sales_pp').attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        $('#models_li').attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        $('#models_sales_tr').attr('oninput', `recal(${unit_q_F},${no_u_F})`);

        let models_sales_pp = $('#models_sales_pp').val();
        all_format_no();
        recal(unit_q_F, no_u_F);
        if ('<?= $status ?>') {
        }
    })
}else{
    $('.show-mobile').html('');
   
    function getCalc(unit_q_F,no_u_F,i) {
        let rrp_sum = 0;
        let str_sum = 0;
        let pro_count = 0;
        let rrp = [];
        let formu_id = [];
        let models_sales_tr = $('#models_sales_tr').val();
        let models_oht = '<?=$models_oht ?>';
        let models_li = $('#models_li').val();
        let models_la = 0;
        
        if(!models_li) models_li = 0;
        if(!models_sales_tr) models_sales_tr = 0;
        let models_puc = 0;
        
        let ir = 0;
        let lr = 0;
        if(models_li) {
            models_la = parseFloat(models_la);
            models_li = parseFloat(models_li);
            ir = models_la * (models_li/100);
            lr = ir + models_la;
        }
        let oht = $('#models_oht').data('models_oht');
        if(!oht) oht = 0;

        let mkt = document.querySelector('#models_mkt').dataset.mkt;
        if(!mkt) mkt = 0;
        let igt = $('#models_igt').data('models_igt');
        if(!igt) igt = 0;
        let pkt = $('#models_pkt').data('models_pkt');
        if(!pkt) pkt = 0;
        let mft = $('#models_mft').data('models_mft');
        if(!mft) mft = 0;
        let nou = $('#models_nou').data('models_nou');
        if(!nou) nou = 0;
        let ouc = 0;
        let models_pbe = 0;
        $('.models_rrp').each((i, v) => {
            if($(v).val()) {
                formu_id.push($(v).data('models_rrp'));
                rrp.push($(v).val());
                pro_count = pro_count + 1;
                let models_sales_pp = $('#models_sales_pp').val();
                if(!models_sales_pp) models_sales_pp = 0;
                // console.log(models_pbe + (models_pbe * parseFloat(models_sales_pp)))
                let models_rrp = $(v).val();
                models_rrp = parseFloat(models_rrp);
                rrp_sum = rrp_sum + models_rrp;
                let unit_no_u = unit_q_F / no_u_F;
                let models_str = models_rrp * unit_no_u;
                models_puc = $(v).parent().siblings('.models_puc').data('models_puc');
                models_puc = parseFloat(models_puc);
                str_sum = str_sum + models_str;
                ouc = (oht+mkt+ir)/nou;
                models_pbe = ouc + models_puc;
                
            }else {
                if(pro_count < 1) pro_count = 0;
            }
        });
        let models_mst = 0;
        if(models_sales_tr == 0) {
            models_mst = 0;
        }else{
            models_mst = str_sum / models_sales_tr;
        }

        let models_profit = 0;
        
        let m_spend = oht + mkt + igt + pkt + mft;
        let _la = document.querySelector('#models_la').dataset.models_la;
        if(!_la) _la = m_spend;
        // return;
        recalc(unit_q_F,no_u_F,_la,models_mst);
    }
    function recalc(unit_q_F,no_u_F,models_la,_mst) {
        /* Recalculate */
        let rrp_sum = 0;
        let str_sum = 0;
        let pro_count = 0;
        let rrp = [];
        let formu_id = [];
        let models_sales_tr = $('#models_sales_tr').val();
        let models_oht = $('#models_oht').data('models_oht');
        let models_li = $('#models_li').val();
        // let models_la = $('#models_la').data('models_la');
        $('#models_la').val(`${parseFloat(models_la).format_number(2)}`);
        if(!models_li) models_li = 0;
        if(!models_sales_tr) models_sales_tr = 0;
        let models_puc = 0;
        
        let ir = 0;
        let lr = 0;
        if(models_li) {
            models_la = parseFloat(models_la);
            models_li = parseFloat(models_li);
            ir = models_la * (models_li/100);
            lr = ir + models_la;
            $('#models_lr').val(`${(lr).format_number(2)}`);
            $('#models_ir').val(`${(ir).format_number(2)}`);
            $('#models_lit').html(`${(ir).format_number(2)}`);
        }else {
            $('#models_lr').val(`${(0).format_number(2)}`);
            $('#models_ir').val(`${(0).format_number(2)}`);
            $('#models_lit').html(`${(0).format_number(2)}`);
        }
        
        let oht = $('#models_oht').data('models_oht');
        if(!oht) oht = 0;
        let igt = $('#models_igt').data('models_igt');
        if(!igt) igt = 0;
        let pkt = $('#models_pkt').data('models_pkt');
        if(!pkt) pkt = 0;
        let mft = $('#models_mft').data('models_mft');
        if(!mft) mft = 0;
        let nou = $('#models_nou').data('models_nou');
        if(!nou) nou = 0;
        let ouc = 0;
        let models_pbe = 0;
        let models_mst = 0;
        let models_sales_pp = $('#models_sales_pp').val();
        $('.models_rrp').each((i, v) => {
            models_puc = $(v).parent().siblings('.models_puc').data('models_puc');
            models_puc = parseFloat(models_puc);
            if($(v).val()) {
                formu_id.push($(v).data('models_rrp'));
                
                if(!models_sales_pp) models_sales_pp = 0;
                rrp.push($(v).val());
                pro_count = pro_count + 1;
                // console.log(models_pbe + (models_pbe * parseFloat(models_sales_pp)))
                let models_rrp = $(v).val();
                models_rrp = parseFloat(models_rrp);
                rrp_sum = rrp_sum + models_rrp;
                let unit_no_u = unit_q_F / no_u_F;
                let models_str = models_rrp * unit_no_u;
                str_sum = str_sum + models_str;

                if(models_sales_tr && models_sales_tr > 0) {
                    // models_mst = str_sum / models_sales_tr;
                    models_mst = _mst;
                    
                    $('#models_mst').html(`${(models_mst).format_number(2)}`);
                    $('#models_mkt').html(`${(models_mst).format_number(2)}`);
                    document.querySelector('#models_mkt').dataset.models_mkt = models_mst;
                    $('#cf_qas').html(`${(models_mst).format_number(2)}`);
                    $('#cf_mas').html(`${(models_mst/3).format_number(2)}`);
                    $('#cf_das').html(`${(models_mst/28).format_number(2)}`);
                }else {
                    $('#models_mkt').html(`${(0).format_number(2)}`);
                    $('#models_mst').html(`${(0).format_number(2)}`);
                    $('#cf_qas').html(`${(0).format_number(2)}`);
                    $('#cf_mas').html(`${(0).format_number(2)}`);
                    $('#cf_das').html(`${(0).format_number(2)}`);
                }
                ouc = (oht+_mst+ir)/nou;
                models_pbe = ouc + models_puc;
                $(v).parent().siblings('.models_pbe').html(`${(models_pbe).format_number(2)}`);
                $(v).parent().siblings('.models_str').html(`${models_str.format_number(2)}`);
                $(v).parent().siblings('.models_ppa').html(`${((models_str - (models_pbe * unit_no_u))).format_number(2)}`);
                $(v).parent().siblings('.models_pip').html(`${((models_pbe + (models_pbe * models_sales_pp) / 100) ).format_number(2)}`);
                // console.log(" valid -> ",oht+" <-> "+_mst+" <-> "+ir+" <-> "+nou+" <-> = "+ouc,i)
            }else {
                models_puc = $(v).parent().siblings('.models_puc').data('models_puc');
                models_puc = parseFloat(models_puc);
                ouc = (oht+_mst+ir)/nou;
                if(!models_sales_pp) models_sales_pp = 0;
                models_pbe = ouc + models_puc;
                // console.log(" Else -> ",oht+" <-> "+_mst+" <-> "+ir+" <-> "+nou+" <-> = "+ouc,i)
                

                $(v).parent().siblings('.models_pbe').html(`${(models_pbe).format_number(2)}`);
                $(v).parent().siblings('.models_pip').html(`${((models_pbe + (models_pbe * models_sales_pp) / 100) ).format_number(2)}`);
                
                $(v).parent().siblings('.models_str').html(`${(0).format_number(2)}`);
                $(v).parent().siblings('.models_ppa').html(`${(0).format_number(2)}`);
                if(pro_count < 1) pro_count = 0;
            }
        });
        
        $("[name='formu_id']").val(JSON.stringify(formu_id));
        $("[name='models_rrp']").val(JSON.stringify(rrp));
        let models_profit = 0;
        if(models_sales_tr && models_sales_tr > 0) {
        }else {
            $('#models_mkt').html(`${(0).format_number(2)}`);
            document.querySelector('#models_mkt').dataset.mkt = 0;
            $('#models_mst').html(`${(0).format_number(2)}`);
            $('#cf_qas').html(`${(0).format_number(2)}`);
            $('#cf_mas').html(`${(0).format_number(2)}`);
            $('#cf_das').html(`${(0).format_number(2)}`);
        }
        let m_spend = oht + models_mst + igt + pkt + mft;
        document.querySelector('#models_mkt').dataset.mkt = models_mst;
        document.querySelector('#models_la').dataset.models_la = m_spend;
        $('.op_spend').html(`${(m_spend).format_number(2)}`);
        $('#cf_qss').html(`${(m_spend).format_number(2)}`);
        $('#cf_mss').html(`${(m_spend/3).format_number(2)}`);
        $('#cf_dss').html(`${(m_spend/84).format_number(2)}`);
        $('#cf_qs').html(`${(nou).format_number(2)}`);
        $('#cf_ms').html(`${(nou/3).format_number(2)}`);
        $('#cf_ds').html(`${(nou/84).format_number(2)}`);

        if(pro_count) $('#brEvUnNo').html(`${(m_spend / (rrp_sum/pro_count)).format_number(2)}`);
        if(!pro_count) $('#brEvUnNo').html(`${(0).format_number(2)}`);

        $('#models_ouc').html(`${(ouc).format_number(2)}`);

        $('#models_mrt').html(`${(str_sum).format_number(2)}`);
        $('#models_return').html(`${(str_sum).format_number(2)}`);
        
        $('#cf_qr').html(`${(str_sum).format_number(2)}`);
        $('#cf_mr').html(`${(str_sum/3).format_number(2)}`);
        $('#cf_dr').html(`${(str_sum/84).format_number(2)}`);
        
        
        models_profit = str_sum-m_spend-ir;
        $('#models_profit').html(`${(models_profit).format_number(2)}`);
        $('#cf_qp').html(`${(models_profit).format_number(2)}`);
        $('#cf_mp').html(`${(models_profit/3).format_number(2)}`);
        $('#cf_dp').html(`${(models_profit/84).format_number(2)}`);

        
        // console.log(rrp_sum);
        // all_format_no();
    }

    // format all numbers 
    function all_format_no() {
        $('#cashs').children().each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(`${parseFloat($(v).html()).format_number(2)}`)
        });
        $('#product_list td').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(`${parseFloat($(v).html()).format_number(2)}`);
        });
        $('#costs td').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(`${parseFloat($(v).html()).format_number(2)}`);
        });
        $('#sales td').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(`${parseFloat($(v).html()).format_number(2)}`);
        });

        /* Without currency symbol */
        $('#cashs td').children().each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
        });
        $('#product_list td span').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
        });
        $('#costs td span').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
        });
        $('#sales td span').each((i,v) => {
            if(!isNaN(parseFloat($(v).html()))) $(v).html(parseFloat($(v).html()).format_number(2));
        });
    }
    Number.prototype.format_number = function(n,x) {
        // if(isNaN(n)) return console.log('Not a number')
        let re = `\\d(?=(\\d{${x||3}})+${(n > 0 ? '\\.': '$')})`;
        return this.toFixed(Math.max(0,~~n)).replace(new RegExp(re,'g'), '$&,');
    }
    function recal(unit_q_F,no_u_F) {
        let count = 2;
        for (let i = 0; i < count; i++) {
            getCalc(unit_q_F,no_u_F,i);
        }
    }
    $(document).ready(function() {
        let unit_q_F = '<?=$unit_q_F ?>';
        let no_u_F = '<?=$no_u_F ?>';
        $('#product_list input').each((i,v) => {
            $(v).attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        });
        
        let count = 2;
        for (let i = 0; i < count; i++) {
        }
        $('#models_sales_pp').attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        $('#models_li').attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        $('#models_sales_tr').attr('oninput', `recal(${unit_q_F},${no_u_F})`);
        
        let models_sales_pp = $('#models_sales_pp').val();
        all_format_no();
        recal(unit_q_F,no_u_F);
        if('<?=$status?>') {
        }
    })
}
</script>