<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.14.1/dist/cdn.min.js" defer type="module"></script>
<script src="<?=base_url() ?>/public/js/corporate_manufacturing.js"></script>
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

    @media (max-width:600px) {
        .so-form-label-sm {
            display: block;
        }

        .so-sm-none {
            display: none !important;
        }

        .table-data .row {
            margin-bottom: 0 !important;
        }

        .so-border {
            margin-top: 30px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
        }
    }
</style>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

    <form method="post" id="add_entry" name="add_entry" x-data="manufacturing"
        action="<?= base_url() ?>/corporate_models_manufacturing_update">
        <div class="row mt-4">

            <div class="col-md-6 col-lg-3 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Manufacturing Costs</div>
                    </strong>
                    <div class="card-body">
                        <div class="row table-data">
                            <?php $p = null;
                            $d = null;
                            $b = null;
                            if ($manufacturing):

                                $p = $manufacturing['model_manufacturing_productionfee'];
                                $d = $manufacturing['model_manufacturing_deliveryfee'];
                                $b = $manufacturing['model_manufacturing_bottlingfee']; ?>
                                <input type="hidden" name="model_manufacturing_id" id="model_manufacturing_id"
                                    value="<?= $manufacturing['model_manufacturing_id'] ?>">

                            <?php endif; ?>
                            <input type="hidden" name="models_id" id="models_id"
                                value="<?php echo $models['models_id']; ?>">

                            <div class="form-group row mb-3">
                                <label class="col-sm-7 col-form-label">Cost Per kg</label>
                                <div class="col-sm-5">
                                    <input type="number" value="<?= $p ?>" class="form-control"
                                        id="model_manufacturing_productionfee" name="model_manufacturing_productionfee"
                                        step="any" required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-7 col-form-label">Delivery (Flat Rate)</label>
                                <div class="col-sm-5">
                                    <input type="number" value="<?= $d ?>" class="form-control"
                                        id="model_manufacturing_deliveryfee" name="model_manufacturing_deliveryfee"
                                        step="any" required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-7 col-form-label">Unit Bottling Cost</label>
                                <div class="col-sm-5">
                                    <input type="number" value="<?= $b ?>" class="form-control"
                                        id="model_manufacturing_bottlingfee" name="model_manufacturing_bottlingfee"
                                        step="any" required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-7 col-form-label">Total Cost</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="emodel_manufacturing_productionfee"
                                        name="emodel_manufacturing_productionfee" step="any" required readonly>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-lg-4 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Total Manufacturing Costs</div>
                    </strong>
                    <div class="card-body">
                        <div class="row mb-3">
                            <div class="col-12">
                                <table id="calculationSummary_manuf" class="table display text-center">
                                    <thead class="table-data">
                                        <tr>
                                            <th>Total Qty (kg)</th>
                                            <th>Unit Qty (kg)</th>
                                            <th>No of Units</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-data">
                                        <tr>
                                            <td id="tot_q_F"></td>
                                            <td id="unit_q_F"></td>
                                            <td id="no_u_F"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <table id="calculationSummary_manuf" class="table display text-center">
                                    <thead class="table-data">
                                        <tr>
                                            <th>Total Cost</th>
                                            <th>Cost Per kg</th>
                                            <th>Cost Per unit</th>
                                        </tr>
                                    </thead>
                                    <tbody class="table-data">
                                        <tr>
                                            <td id="total_Cost"></td>
                                            <td id="total_kg"></td>
                                            <td id="total_unit"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-12 mb-3">
                <div class="card">
                    <strong>
                        <div class="card-header">Product Manufacturing Costs</div>
                    </strong>
                    <div class="card-body table-data">

                        <div class="row mb-3">
                            <div class="col"><strong>Product</strong></div>

                            <!-- Ingredient -->
                            <div class="col so-sm-none"><u><strong>Ingredient Total Cost</strong></u></div>
                            <div class="col so-sm-none"><strong>Ingredient kg Cost</strong></div>
                            <div class="col so-sm-none"><strong>Ingredient Unit cost </strong></div>

                            <!-- Packaging -->
                            <div class="col so-sm-none"><u><strong>Packaging Total Cost</strong></u></div>
                            <div class="col so-sm-none"><strong>Packaging kg Cost</strong></div>
                            <div class="col so-sm-none"><strong>Packaging Unit Cost</strong></div>

                            <!-- Production -->
                            <div class="col so-sm-none"><u><strong>Production Total Cost</strong></u></div>
                            <div class="col so-sm-none"><strong>Production kg Cost</strong></div>
                            <div class="col so-sm-none"><strong>Production Unit Cost</strong></div>

                            <!-- Total -->
                            <div class="col so-sm-none"><u><strong>Total Cost</strong></u></div>

                        </div>
                        <?php
                        $ng = 0;
                        $ps = 0;
                        function format_number($number = 0, $d = 0, $t = false)
                        {
                            if (!$number)
                                return "0.00";
                            if (!preg_match("/\d+/", $number))
                                return "0";
                            if ($t) {
                                $parts = explode(".", (round($number, $d) * 1));
                                $d = isset($parts[1]) ? strlen($parts[1]) : 0;
                            }
                            $f = number_format($number, $d);
                            return "" . $f;
                        }
                        if (!empty($formulas)):
                            $index = 0;
                            foreach ($formulas as $key => $formula):
                                $ptp = $formula->models_igtp ?? 0 + $formula->models_pktp; ?>
                                <div class="form-group row mb-3">
                                    <label class="col-sm col-form-label <?= $index > 0 ? 'so-border' : '' ?>"><i>(<?= $formula->formula_version ?>)
                                            <?= $formula->formula_rdplan ?></i></label>

                                    <!-- Ingredients -->
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Ingredient Total Cost
                                        </label>
                                        <input x-bind="models_igtp" type="text" class="form-control" id="models_igtp"
                                            value="<?php echo is_float($formula->models_igtp ?? 0) ? format_number($formula->models_igtp ?? 0, 2) ?? "0" : format_number($formula->models_igtp ?? 0, 2, true) ?? "0"; ?>"
                                            name="models_igtp" step="any" required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Ingredient Cost (kg)
                                        </label>
                                        <input type="text" class="form-control" id="models_igkp"
                                            value="<?php echo is_float($formula->models_igkp ?? 0) ? format_number($formula->models_igkp ?? 0, 2) ?? "0" : format_number($formula->models_igkp ?? 0, 2, true) ?? "0"; ?>"
                                            name="models_igkp" step="any" required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Ingredient Unit Cost
                                        </label>
                                        <input type="text" class="form-control" id="models_igup"
                                            value="<?php echo is_float($formula->models_igup ?? 0) ? format_number($formula->models_igup ?? 0, 2) ?? "0" : format_number($formula->models_igup ?? 0, 2, true) ?? "0"; ?>"
                                            name="models_igup" step="any" required readonly>
                                    </div>


                                    <!-- Packaging -->
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Packaging Total Cost
                                        </label>
                                        <input x-bind="pkg_t_cost" type="text" class="form-control models_pktp_<?= $key ?>" id="models_pktp" name="models_pktp"
                                            value="<?php echo is_float($formula->models_pktp) ? format_number($formula->models_pktp, 2) ?? "0" : format_number($formula->models_pktp, 2, true) ?? "0"; ?>"
                                            step="any" required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Packaging Cost (kg)
                                        </label>
                                        <input type="text" class="form-control" id="models_pkkp" name="models_pkkp"
                                            value="<?php echo is_float($formula->models_pkkp) ? format_number($formula->models_pkkp, 2) ?? "0" : format_number($formula->models_pkkp, 2, true) ?? "0"; ?>"
                                            step="any" required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Packaging Unit Cost
                                        </label>
                                        <input type="text" class="form-control" id="models_pkup" name="models_pkup"
                                            value="<?php echo is_float($formula->models_pkup) ? format_number($formula->models_pkup, 2) ?? "0" : format_number($formula->models_pkup, 2, true) ?? "0"; ?>"
                                            step="any" required readonly>
                                    </div>


                                    <!-- Production -->
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Production Total Cost
                                        </label>
                                        <input type="text" class="form-control" id="models_pdtp" name="models_pdtp" step="any"
                                            required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Production Cost (kg)
                                        </label>
                                        <input type="text" class="form-control" id="models_pdkp" name="models_pdkp" step="any"
                                            required readonly>
                                    </div>
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Production Unit Cost
                                        </label>
                                        <input type="text" class="form-control" id="models_pdup" name="models_pdup" step="any"
                                            required readonly>
                                    </div>

                                    <!-- Total Cost -->
                                    <div class="col-sm">
                                        <label for="" class="so-form-label-sm">
                                            Total Product Cost
                                        </label>
                                        <input type="hidden" value="<?= $formula->models_igtp ?? 0 + $formula->models_pktp + $formula->models_pktp ; ?>"
                                            class="models_ptp" required readonly>
                                        <input type="text" value="<?= $formula->models_igtp ?? 0 + $formula->models_pktp ?>"
                                            data-models_ptp_<?= $key ?>="<?= $ptp ? $ptp : 0 ?>"
                                            class="form-control models_ptp_<?= $key ?>" id="models_ptp" name="models_ptp"
                                            step="any" required readonly>
                                    </div>
                                </div>

                                <?php $index++; endforeach; endif; ?>

                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col justify-content-start align-items-center form-button">
                <button type="submit" class="btn btn-success">Save</button>
                <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                <a href="https://ingrevo.com/business-planning-part-5-manufacturing/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

    </form>
</main>
<script>
    function getTotal_manuf(kg, total_unit, total_Cost, unit_qty) {
        $('#tot_q_F').html(`${kg.format_number(2)}`);
        $('#no_u_F').html(`${(total_unit).format_number(2)}`);
        $('#unit_q_F').html(`${(<?= $unit_qty ?>).format_number(2)}`);

        $('#total_Cost').html(`${total_Cost.format_number(2)}`);
        $('#total_kg').html(`${(total_Cost / kg).format_number(2)}`);
        $('#total_unit').html(`${(total_Cost / total_unit).format_number(2)}`);
    }

    Number.prototype.format_number = function (n, x) {
        let re = `\\d(?=(\\d{${x || 3}})+${(n > 0 ? '\\.' : '$')})`;
        return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
    }

    async function getCalc_manf(kg = 0, total_unit = 0) {
        let total_calc = 0;
        let p = $('input#model_manufacturing_productionfee').val();
        let d = $('input#model_manufacturing_deliveryfee').val();
        let b = $('input#model_manufacturing_bottlingfee').val();
        total_calc = (parseFloat(p) * kg) + parseFloat(d) + (parseFloat(b) * total_unit);
        let no_fomulas = <?= $formula_counts ?>;
        let batch = kg / no_fomulas;
        let total_Cost = 0;
        if (!isNaN(total_calc)) {
            $('input#models_pdtp').each((i, v) => {
                $(v).val(`${(total_calc / no_fomulas).format_number(2)}`);
                let tC=0;
                let models_ptp_ = parseFloat(document.querySelector(`.models_ptp_${i}`).dataset[`models_ptp_${i}`]) + (total_calc / no_fomulas);

                total_Cost = total_Cost + parseFloat(document.querySelector(`.models_pktp_${i}`).value) + parseFloat(document.querySelector(`.models_ptp_${i}`).dataset[`models_ptp_${i}`]) + (total_calc / no_fomulas);
                tC = parseFloat(document.querySelector(`.models_pktp_${i}`).value) + parseFloat(document.querySelector(`.models_ptp_${i}`).dataset[`models_ptp_${i}`]) + (total_calc / no_fomulas);
                $(`.models_ptp_${i}`).val(''+ tC.format_number(2));

            });
            $('input#models_pdkp').each((i, v) => {
                $(v).val(`${(total_calc / kg).format_number(2)}`);
            })
            $('input#models_pdup').each((i, v) => {
                $(v).val(`${(total_calc / total_unit).format_number(2)}`);
            })
            $('#emodel_manufacturing_productionfee').val(`${total_calc.format_number(2)}`);
        }
        return new Promise((res, rej) => {
            res(total_Cost);
        })
    }
    $(document).ready(async function () {
        let unit_qty = 0;
        let count = 0;
        let kg = 0;
        if ('<?= $formula_counts ?>') {
            if ('<?= $batch_qty ?>' > 0) {
                kg = <?= $batch_qty ?> * <?= $formula_counts ?>;
                unit_qty = <?= $unit_qty ?>;
                total_unit = kg / unit_qty
                $('input[name^=model_manufacturing]').each((i, v) => {
                    $(v).attr('oninput', `getCalc_manf(${kg},${total_unit})`);
                })
                getCalc_manf(kg, total_unit).then((total_Cost) => getTotal_manuf(kg, total_unit, total_Cost));

            }
        } else {
            $(`
            <tfoot>
                <tr><td colspan="3" class="text-danger">No formulas are selected!</td></tr>
            </tfoot>
        `).appendTo('#calculationSummary_manuf');
        }
    })
</script>