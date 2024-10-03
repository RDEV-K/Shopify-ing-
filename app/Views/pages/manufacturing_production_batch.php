<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>

<style>
    .expire {
        color: red;
    }
</style>
<div class="expad no mt-3">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">
        <?php if ($manuf_batch) {
            $label = (object) $manuf_batch[0]; ?>

            <strong class>
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-5 col-10 d-flex justify-content-center">
                        Manufacturing: <?php echo $label->formula_version; ?>     <?php echo $label->formula_rdplan; ?>
                        </br>Qty: <?php echo $label->manuf_product_qty; ?>g // Batch #
                        <?php echo $label->manuf_product_batch; ?>
                    </div>
                    <div class="col-md-2 col-2">
                        <a href="https://ingrevo.com/production-creation/" target="_blank"><i id="help-icon"
                                class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
                    </div>
                </div>
            </strong>

            <form method="post" id="add_entry" name="add_entry"
                action="<?= base_url() ?>/manufacturing/manuf_production_batch_add">

                <table id="example1" class="display text-center mt-5">
                    <thead>
                        <tr>
                            <th>Phase</th>
                            <th>Ingredient</th>
                            <th>INCI</th>
                            <th>Instructions</th>
                            <th>%</th>
                            <th>Amount (g)</th>
                            <th>Actual (g)</th>
                            <th>Ingredient Batch</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($manuf_batch)):
                            $index = -1;
                            foreach ($manuf_batch as $b) {
                                $index++;
                                $b = (object) $b; ?>
                                <tr>
                                    <td><?php echo $b->f_ingredients_phase ?></td>
                                    <td><?php echo $b->ingredient_name ?></td>
                                    <td><?php echo $b->ingredient_inci ?></td>
                                    <td><?php echo $b->f_ingredients_instructions ?></td>
                                    <td><?php 
                                        if (preg_match('/(\d+)/', $b->f_ingredients_qty, $matches)) {
                                            $quantity = $matches[1]; // This will contain the numeric part
                                        } else {
                                            $quantity = ''; // No numeric part found
                                        }
                                        echo $quantity;
                                    ?></td>
                                    <td>
                                        <?php
                                            $first_number = $b->f_ingredients_qty;
                                            $second_number = $b->manuf_product_qty;
                                            $third_number = 100;
                                            $sum_total = (float)$second_number * (float)$first_number / (float)$third_number;

                                            print ($sum_total);
                                        ?>
                                    </td>
                                    <td>
                                        <input type="hidden" name="manuf_production_batch_production_<?php echo $index; ?>"
                                            value="<?php echo $b->manuf_product_id ?>">
                                        <input type="hidden" name="manuf_production_batch_ingredients_<?php echo $index; ?>"
                                            value="<?php echo $b->ingredient_id ?>">
                                        <input type="hidden" name="production_name_<?php echo $index; ?>" value="manuf_product">
                                        <input <?php if ($b->manuf_product_status == "Produced")
                                            echo "readonly"; ?> value="<?php if ($b->manuf_product_status == "Produced")
                                                   echo $b->manuf_production_batch_qty; ?>" type="text"
                                            class="form-control text-center" id="manuf_production_batch_qty"
                                            name="manuf_production_batch_qty_<?php echo $index; ?>" placeholder="Enter Actual Qty">
                                        <input type="hidden" name="f_ingredients_id_<?php echo $index; ?>" value="<?= $b->f_ingredients_id ?>">
                                    </td>
                                    <td>
                                        <select id="ingBat_<?= $b->f_ingredients_id ?>" <?php if ($b->manuf_product_status == "Produced")
                                              echo "disabled"; ?> class="form-select"
                                            name="ingredients_batch_id_<?php echo $index; ?>">
                                            <?php
                                            if ($b->manuf_product_status != "Produced"):
                                                if (!empty($b->manuf_batchs)): ?>
                                                    <option selected value="">Select Batch</option>
                                                    <?php $status = null;
                                                    foreach ($b->manuf_batchs as $batch): ?>
                                                        <option value="<?= $batch->ingredient_batch_id ?>" data-isexp="<?= $batch->isExpired ?>"
                                                            class="<?= $batch->isExpired ? 'text-danger' : '' ?>">
                                                            <?= $batch->ingredient_batch_no ?>
                                                            <?= $batch->isExpired ? $batch->ingredient_batch_status : '' ?>
                                                        </option>
                                                    <?php endforeach ?>
                                                <?php else: ?>
                                                    <option selected value="">No Batch found!</option>
                                                <?php endif; else: ?>
                                                <option value="">
                                                    <?php if (!empty($b->production_batch_ingredient_batch)) {
                                                        echo $b->production_batch_ingredient_batch;
                                                    } else {
                                                        echo 'No Batch Selected';
                                                    } ?>
                                                </option>
                                            <?php endif ?>
                                        </select>
                                    </td>
                                </tr>
                            <?php }endif; ?>
                    </tbody>
                </table>
                <input type="hidden" value=<?php echo $index; ?> name="data_number" />
                <p class="mt-4">By submitting this form I confirm that:
                    </br> 1) All actual quantities input are correct, accurate, free from error and are true to those
                    actually used during production.
                    </br> 2) To the best of my knowledge I have followed the formula and instruction therein.
                    </br> 3) This has been produced inline with the Good Manufacturing Practices.
                <p>

                <div class="container text-center mt-3">
                    <button type="submit" id="mnf_product_produce_" class="btn btn-sm btn-success mt-3 col-3" <?php if ($b->manuf_product_status == "Produced")
                        echo "disabled"; ?>>Submit</button>
                </div>

            <?php } else { ?>
                <strong class="text-center"> Not Available </strong>
            <?php } ?>
        </form>
    </main>

</div>

<!-- Page Specific Scripts -->
<script>

    $('select').on('change', (e) => {
        e.preventDefault();
        let select_id = e.target.id;

        var selected_opt = $('#' + select_id + " option:selected").data('isexp');
        if (selected_opt) {
            $(`#${select_id}`).addClass('text-danger');
        } else {
            $(`#${select_id}`).removeClass('text-danger');
        }
    });
    const extract_data = data => {
        return new Promise((res, rej) => {
            let processed_data = [];
            data.map((value, index) => {
                if (value[3] == "" || value[3] == " ") {
                } else {
                    processed_data.push(value);
                }
            });
            res(processed_data);
        })
    }
    async function stock_check() {
        var data = [];
        let form = $('form');           
        $.each(form.serializeArray(), function (ii, vv) {
            var value = vv.value;
            data.push(
                value
            );
        });
         
        let update_data_raw = split(data, 6);
        extract_data(update_data_raw).then(processed_data => {
            $.ajax({
                type: "post",
                url: "<?= base_url() ?>/batch/production",
                data: { data: processed_data },
                dataType: "JSON",
                beforeSend: function () {
                    $('button#stock_check').attr('disabled', true);
                },
                success: function (response) {
                    if (response.status != "success" || !response.status) {
                        $('button#stock_check').attr('disabled', false);
                    }
                    response.status == "success" ? window.history.back() : window.location.reload();
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    location.reload();
                    console.error('Ajax Error:', error);
                }
            });
        });
    }
    function split(array, n) {
        let [...arr] = array;
        let res = [];
        while (arr.length) {
            res.push(arr.splice(0, n));
        }
        return res;
    }
    $('#mnf_product_produce').on(`click`, function (e) {
        e.preventDefault();
        e.stopPropagation();
        stock_check();
    });
    $(document).ready(function () {
        // $('#example1').DataTable({
        //     "order": [[0, "asc"]],
        //     "paging": false,
        //     "autowidth": true,
        //     "responsive": true,
        //     "bFilter": false,
        //     "info": false,
        // });
       
        var table = $('#example1').DataTable({
            colReorder: true, // Enable column reordering
            responsive: true, // Enable responsive behavior
            paging: false, // Disable paging
            autowidth: true, // Enable auto width
            order: [[0, "asc"]], // Order by date descending by default
            bFilter: false,
            info: false,
            bSort: true,
        });
        
        function reorderColumns() {
            var screenWidth = window.innerWidth;
            if (screenWidth < 768) { // For mobile devices
                table.colReorder.order([0, 1, 4, 5, 3, 6, 7, 2], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5, 6, 7], true); // Default order
            }
        }
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });

</script>
<!-- Page Specific Scripts -->