<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

    <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/corporate_models_formulas/<?=$models_id ?>">
        <div class="row mt-3">
        
        <?php $batch_qty = null;$unit_qty = null;$formula_id = null;
                if($corpFormula && count($corpFormula) > 0) : 
                    $corpFormula = (object)$corpFormula;
                    $batch_qty = $corpFormula->batch_qty;
                    $unit_qty = $corpFormula->unit_qty;
                    $formula_id = $corpFormula->formula_id;
                    $formula_id = json_decode($formula_id);
                ?>
                <input type="hidden" name="corporate_formula_id" value="<?=$corpFormula->corporate_formula_id ?>">
                
            <?php endif?>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong><div class="card-header"> Manufacturing Qty (kg) </div></strong>
                    <div class="card-body table-data">
                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Per Formula</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control input_qty_f batch_qty_f" value="<?=$batch_qty; ?>" step="any" required>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-6 col-form-label">Per Sales Unit</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control input_qty_f unit_qty_f" value="<?=$unit_qty; ?>" step="any" required>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <div class="card">
                    <strong><div class="card-header">Formulas</div></strong>
                    <div class="card-body">
                        <table id="example1" class="table display text-center">
                            <thead class="table-data">
                                <tr>
                                    <th>Product</th>
                                    <th>Version</th>
                                    <th>Selection</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <?php 
                                    if($formulas && count($formulas) > 0) : 
                                ?>
                                    <?php foreach($formulas as $key => $formula): ?>
                                        <tr>
                                            <td><?=$formula->formula_rdplan ?></td>
                                            <td><?=$formula->formula_version ?></td>
                                            <td> <input class="form-check-input" type="checkbox"
                                                <?php if($formula_id) {
                                                    foreach($formula_id as $_id){
                                                        if($formula->formula_id == $_id){
                                                            echo 'checked=1';
                                                        }
                                                    }}
                                                ?>
                                            value="<?=$formula->formula_id ?>" id="formulaCheck" onclick="getTotal_formu()"></td>
                                        </tr>
                                    <?php endforeach ?>
                                <?php else: ?>
                                    <tr>
                                        <td colspan="3">No Formula Found</td>    
                                <?php endif ?>
                                <input type="hidden" name="formula_id" id="formu_id_f">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong><div class="card-header">Production Total</div></strong>
                    <div class="card-body">
                        <table id="example1" class="table display text-center">
                            <thead class=" table-data">
                                <tr>
                                    <th>Production kg</th>
                                    <th>No. of Sales Units</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <tr>
                                    <td id="total_qty_f">TBC</td>
                                    <td id="total_units_f">TBC</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col justify-content-start align-items-center form-button">
                <button type="submit" class="btn btn-success">Save</button>
                <button type="button" onclick="word()" class="btn btn-warning">Export</button>
                <a href="https://ingrevo.com/business-planning-part-2-formulas/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

    </form>
</main>

<script>
    function getTotal_formu() {
        $('.batch_qty_f').prop({id: 'batch_qty_f', name: 'batch_qty'});
        $('.unit_qty_f').prop({id: 'unit_qty_f', name: 'unit_qty'});
        let batch_qty = $('#batch_qty_f')
        let checked_no = $('#formulaCheck:checked').length

        // Calcalute total batchs quantity
        if(batch_qty.val()) {
            $('#total_qty_f').html(
                (parseFloat(batch_qty.val()) * checked_no).toFixed(2)
            ) 
        }
                
        let formu_id = [];
        $('.form-check-input').each((i,v) => {
            if($(v).is(':checked')) {
                formu_id.push($(v).val())
            }

        })
        $('#formu_id_f').val(JSON.stringify(formu_id));
// Calcalute total units quantity
        let unit_qty = $('#unit_qty_f');
        if(unit_qty.val()) {
            $('#total_units_f').html(
                ((parseFloat(batch_qty.val()) * checked_no)/unit_qty.val()).toFixed(2)
            ) 
        }
    }
    $('.input_qty_f').on('input', function() {
        console.log($(this).attr('id'))
        // getTotal_formu();
    });
    $(document).ready(function() {
        if('<?= $batch_qty ?>') {
            getTotal_formu();
        }
    });
</script>