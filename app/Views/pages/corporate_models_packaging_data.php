<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
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
        .col-form-label{
            font-weight: bold;
        }
        .col-form-label{
            margin-top: 1.25rem;
        }
    }
</style>
<main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">
    <?php
        $batch = 0;
        $each_qty = 0;
        $count = null;
        if ($status) {
            $each_qty = $unit_qty;
            $batch = $batch_qty;
            $count = $formula_counts;
        }
    ?>
    
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
    <form method="post" id="add_entry" name="add_entry" action="<?= base_url('corporate_models_packaging_save/' . $models['models_id']) ?>">
        <div class="row mt-4">

            <div class="col-md-9 mb-3">
                <div class="card">
                    <strong><div class="card-header">Packaging Costs</div></strong>
                    <div class="card-body table-data">

                        <div class="table_row row mb-3">
                            <div class="col-2 so-sm-none"><strong></strong></div>
                            <div class="col-2 so-sm-none"><strong>Description</strong></div>
                            <div class="col-2 so-sm-none"><strong>Required Qty</strong></div>
                            <div class="col-2 so-sm-none"><strong>Supplier</strong></div>
                            <div class="col-2 so-sm-none"><strong>Order Qty</strong></div>
                            <div class="col-2 so-sm-none"><strong>Price</strong></div>
                        </div>

                        <input type="hidden" name="models_id" id="models_id" value="<?php echo $models['models_id']; ?>">

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label mt-0">Container</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label> 
                                <input type="text" class="form-control" id="models_packaging_container_size" name="models_packaging_container_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_container_qty" name="models_packaging_container_qty" step="any" required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_container_supplier" name="models_packaging_container_supplier" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_container_order" name="models_packaging_container_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_container_price" name="models_packaging_container_price" step="any" required>
                            </div>
                        </div>

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label">Labels</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label> 
                                <input type="text" class="form-control" id="models_packaging_label_size" name="models_packaging_label_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_label_qty" name="models_packaging_label_qty" step="any"  required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_label_supplier" name="models_packaging_label_supplier" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_label_order" name="models_packaging_label_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                        </label>
                                <input type="number" class="form-control" id="models_packaging_label_price" name="models_packaging_label_price" step="any" required>
                            </div>
                        </div>

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label">Shipping Protection</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_shipping_size" name="models_packaging_shipping_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_shipping_qty" name="models_packaging_shipping_qty" step="any"  required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_shipping_supplier" name="models_packaging_shipping_supplier" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_shipping_order" name="models_packaging_shipping_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_shipping_price" name="models_packaging_shipping_price" step="any" required>
                            </div>
                        </div>

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label">Shipping Bags</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_bags_size" name="models_packaging_bags_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_bags_qty" name="models_packaging_bags_qty" step="any" required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_bags_supplier" name="models_packaging_bags_supplier" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_bags_order" name="models_packaging_bags_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_bags_price" name="models_packaging_bags_price" step="any" required>
                            </div>
                        </div>

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label">Packaging Notes</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_notes_size" name="models_packaging_notes_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_notes_qty" name="models_packaging_notes_qty" step="any" required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_notes_supplier" name="models_packaging_notes_supplier" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_notes_order" name="models_packaging_notes_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_notes_price" name="models_packaging_notes_price" step="any" required>
                            </div>
                        </div>

                        <div class="form-group table_row row mb-3">
                            <label class="col-sm-2 col-form-label">Delivery</label>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Description
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_delivery_size" name="models_packaging_delivery_size" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Required Qty
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_delivery_qty" name="models_packaging_delivery_qty" step="any" required readonly>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Supplier
                                        </label>
                                <input type="text" class="form-control" id="models_packaging_delivery_supplier" name="models_packaging_delivery_supplier" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Order Qty
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_delivery_order" name="models_packaging_delivery_order" step="any" required>
                            </div>
                            <div class="col-sm-2">
                            <label for="" class="so-form-label-sm">
                            Price
                                        </label>
                                <input type="number" class="form-control" id="models_packaging_delivery_price" name="models_packaging_delivery_price" step="any" required>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-md-3 mb-3">
                <div class="card">
                    <strong><div class="card-header">Packaging Costs</div></strong>
                    <div class="card-body">
                        <table id="calculationSummary_pkg" class="table display text-center">
                            <thead class="table-data">
                                <tr>
                                    <th>Total Cost</th>
                                    <th>Cost per Unit</th>
                                </tr>
                            </thead>
                            <tbody class="table-data">
                                <tr>
                                    <td id="tot_price_pkg">0</td>
                                    <td id="unit_price_pkg">0</td>
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
                <a href="https://ingrevo.com/business-planning-part-4-packaging/" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

    </form>
</main>
<script>
    var root_pkg = '<?=base_url()?>';
    
    function calcInputs(kg,total_unit) {
        let total_price_p = 0;
        $('input[name$=_price][name^=models_packaging_]').each((i,v) => {
            if($(v).val()) {total_price_p = total_price_p + parseFloat($(v).val())};
        });
        console.log(total_price_p);
        $('#tot_price_pkg').html(`${total_price_p.format_number(2)}`)
        $('#unit_price_pkg').html(`${(total_price_p/total_unit).format_number(2)}`)
        $('#kg_price').html(`${(total_price_p/kg).format_number(2)}`)
    }
    
    Number.prototype.format_number = function(n,x) {
        let re = `\\d(?=(\\d{${x||3}})+${(n > 0 ? '\\.': '$')})`;
        return this.toFixed(Math.max(0,~~n)).replace(new RegExp(re,'g'), '$&,');
    }
    $(document).ready(function() {
        $('input[name$=_qty][name^=models_packaging_]').each((i,v) => {
            // $(v).attr('id',`qty_${i}`)
        })
        let unit_qty = 0;
        let count = 0;
        let kg = 0;
        if('<?=$status ?>') {
            kg = <?=$batch ?> * <?=$count?>;
            unit_qty = <?=$unit_qty ?>;
            total_unit = (kg/unit_qty).toFixed(2);
            // $('input:not([name="models_id"])').val(total_unit).attr('readonly', true);
            //$('input#models_packaging_container_size').val(unit_qty).attr('readonly', true);
        
            $('input[name$=_qty][name^=models_packaging_]').val(total_unit).attr('readonly', true);
            assignFn();
        }else {
            let msg = 'Corporate Formulas Models is not set';
            $(`
                <tfoot>
                    <tr><td colspan="3" class="text-danger">${msg}!</td></tr>
                </tfoot>
            `).appendTo('#calculationSummary_pkg');
            $('#add_entry button:submit').prop('title',msg)
            $('#add_entry button:submit').prop('type','button')
        }
    
        // Assign function to price input
        function assignFn() {
            $('input[name$=_price][name^=models_packaging_]').attr('oninput', `calcInputs(${kg},${total_unit})`);
        }
        // Number formatting
            
        // For calculated models
        function updateInput() {
            return new Promise((res, rej) => {
                <?php if($packaging): foreach ($packaging as $key => $package) : ?>
                    // Assign value to each corresponding elements
                    if(!'<?=$key?>'.endsWith('_qty')) {
                        if('<?=$key?>' == 'models_packaging_container_size') {
                            $('#'+'<?=$key?>').val('<?=$unit_qty; ?>');
                        } else {		
                            $('#'+'<?=$key?>').val('<?=$package;?>');
                        }
                    }
                <?php endforeach; endif?>
                
               /*  $('input[name$=_size][name^=models_packaging_]').each((i,v) => {
                    if(i > 0) {
                        $(v).val('')
                        $(v).attr('placeholder', `${$(v).parent().parent().children('label').html()} - Req. Size`)
                        $(v).attr('title', `${$(v).parent().parent().children('label').html()} - Req. Size`)
                    }
                }); */
                res('Done');
            });
        }
    
         // Checking if models status
        // Execute if it is completed
        // @value must the same
        <?php if($packaging): ?>
            $('#calculationSummary_pkg').append(`<input type="hidden" name="model_package_id" id="model_package_id">`);
            updateInput().then((d) => {
                // call calculating function 
                calcInputs(kg,total_unit);
            });
        <?php else : ?>
            $('input[name$=_size][name^=models_packaging_]').each((i,v) => {
                    $(v).val('');
                    $(v).attr('placeholder', `${$(v).parent().parent().children('label').html()}`);
                    $(v).attr('title', `${$(v).parent().parent().children('label').html()}`);
                });
        <?php endif; ?>
    });

    
    // var columns = [
    //     { field: 'item', headerText: '', width: 90,},
    //     { field: 'kg_desc', headerText: 'Capacity (kg) / Description', textAlign: 'Center', width: 150, type: 'string' },
    //     { field: 'qty', headerText: 'Required Qty (kg)', textAlign: 'Center', width: 100, type: 'string' },
    //     { field: 'supplier', width: 90, headerText: 'Supplier', type: 'string' },
    //     { field: 'order_qty', width: 40, headerText: 'Order Qty', type: 'string' },
    //     { field: 'price', width: 40, headerText: 'Price', type: 'string' },
    // ];

    // function convert_to_grid() {
    //     let tbl_header = ["item","kg_desc","qty","supplier","order_qty","price"];
    //     let table_rows = $('.table_row');
    //     let rows = [];
    //     let t_columns = {};
    //     table_rows.each((i,row) => {
    //         let row_table = $(row).children();
    //         if(i>0) {
    //             row_table.map((row_index,row_columns) => {
    //                 if(row_columns.childElementCount) {
    //                     $(row_columns).children().map((col_id,col_children) => {
    //                         if(col_children.childElementCount == 0){
    //                             if(col_children.nodeName == 'INPUT'){
    //                                 t_columns = { ...t_columns, [tbl_header[row_index]]: ($(col_children)[0]).value };
    //                             }else {
    //                                 t_columns = { ...t_columns, [tbl_header[row_index]]: ($(col_children)[0]).innerHTML };
    //                             }
    //                         }
    //                     })
    //                 }else {
    //                     t_columns = {...t_columns, [tbl_header[row_index]]: row_columns.innerHTML};
    //                 }
    //             });
    //             rows.push(t_columns);
    //         }
    //     });
    //     return rows;
    // }
    
    // View Table
    // function viewTable(){
    //     $("#viewTable .modal-body").load(root_pkg+"/viewTable")
    //     var viewTableModal = new bootstrap.Modal(document.querySelector("#viewTable"))
    //     viewTableModal.show()
    // }

</script>
