<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>

<style>
    #viewTable .modal-dialog {
        margin: 0 auto;

    }

    #viewTable .modal {
        border: none;
    }

    #viewTable .modal-body {
        padding: 0;
    }

    #toMsWord .modal-body .hide-content {
        display: none;
    }
</style>

<div class="no px-3 mt-4 expad">

    <div class="row mb-3 text-center">
        <div class="col">
            <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal"
                data-bs-target="#entryModal">Add Business Plan</button>
            <a href="https://ingrevo.com/business-planning-intro/" target="_blank"><i id="help-icon"
                    class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
        </div>
    </div>

    <!-- Modals -->

    <!-- Add Modal -->
    <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Business Plan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/corporate_models_add">
                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Date</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="models_date" name="models_date"
                                    value="<?php echo date('Y-m-d'); ?>" required>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <label class="col-sm-4 col-form-label">Plan Name</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="models_name" name="models_name" required>
                            </div>
                        </div>

                        <input type="hidden" id="models_user" name="models_user"
                            value="<?php echo $_SESSION['user_id'] ?>">
                        <input type="hidden" name="models_qty" id="models_qty" value="TBC">
                        <input type="hidden" name="models_spend" id="models_spend" value="TBC">
                        <input type="hidden" name="models_revenue" id="models_revenue" value="TBC">
                        <input type="hidden" name="models_profit" id="models_profit" value="TBC">

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
                            <button type="submit" name="insertdata" class="btn btn-success">Save</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <!-- Add Modal -->

    <!-- View Table -->
    <div class="modal fade" id="viewTable" tabindex="-1" aria-labelledby="viewTableLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewTableLabel">Business Plan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                </div>
            </div>
        </div>
    </div>
    <!-- Edit Modal -->

    <!-- Export Data to MsWord -->
    <div class="modal fade" id="toMsWord" tabindex="-1" aria-labelledby="toMsWordLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="toMsWordLabel">Export to Doc [<b>Business Plan</b>]</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <div class="d-flex align-items justify-content-center align-content-around">
                        <span class="export_message" style="font-size: 28px;">Please wait, business plan is exporting
                            `<span id="plans"></span>` <br><small class="text-info" style="font-size: smaller;"> This
                                might take a few minutes</small> </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span class="export_status">
                            <i class="spinner-grow fa-solid text-danger "></i>
                        </span>
                    </div>
                    <div class="hide-content"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Export Data to MsWord -->

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Business Plan</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>
    <!-- Edit Modal -->

    <!-- Modals -->
    <?php

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
    ?>
    <div class="row">
        <div class="col-12">
            <table id="example1" class="display text-center nowrap">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Plan</th>
                        <th>Qty (kg)</th>
                        <th>Spend</th>
                        <th>Revenue</th>
                        <th>Profit</th>
                        <th>Margin</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($models): ?>
                        <?php foreach ($models as $data): ?>
                            <tr id="plan_<?= $data['models_id'] ?>">
                                <td><?= $data['models_date']; ?></td>
                                <td class="plan_name"><?= $data['models_name']; ?></td>
                                <?php $spend = 0;
                                $revenue = 0;
                                $profit = 0;
                                $margin = 0;
                                $qty = 0;
                                if ($data['get_overall'])
                                    extract($data['get_overall']); ?>
                                <td><?= $qty; ?></td>
                                <td><?php echo is_float($spend) ? format_number($spend, 2) ?? "0" : format_number($spend, 2, true) ?? "0"; ?>
                                </td>
                                <td><?php echo is_float($revenue) ? format_number($revenue, 2) ?? "0" : format_number($revenue, 2, true) ?? "0"; ?>
                                </td>
                                <td><?php echo is_float($profit) ? format_number($profit, 2) ?? "0" : format_number($profit, 2, true) ?? "0"; ?>
                                </td>
                                <td><?= $margin; ?>%</td>
                                <td>
                                    <!-- <a onclick="viewTable('/exportPDF')" type="button" class="btn btn-primary btn-sm">Export PDF</a> -->
                                    <a onclick="toMsWordFn('<?= $data['models_id'] ?>')" type="button"
                                        class="btn btn-warning btn-sm">Export</a>
                                    <a class="btn btn-success btn-sm"
                                        href="<?= base_url() ?>/corporate_models_view/<?php echo $data['models_id']; ?>">View</a>
                                    <a class="btn btn-primary btn-sm" onclick="edit('<?= $data['models_id'] ?>')">Edit</a>
                                    <a class="btn btn-danger btn-sm"
                                        href="<?= base_url() ?>/corporate_models_delete/<?php echo $data['models_id'] ?>">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Date</th>
                        <th>Plan</th>
                        <th>Qty (kg)</th>
                        <th>Spend</th>
                        <th>Revenue</th>
                        <th>Profit</th>
                        <th>Margin</th>
                        <th>Options</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</div>

<pre>
<?php
// if($models_gets) {

//     foreach($models_gets as $key => $models_get){
//         extract($models_get);
//         if($marketing) { 
//             require 'corp_models_main.php';
//         }
//     }
//     print_r($da);
// }
?>
</pre>
<script>

    $(document).ready(function () {
        // $('#example1').DataTable({
        //     "paging": false,
        //     "autowidth": true,
        //     "responsive": true,
        //     "order": [[0, "desc"]],
        // });
        var table = $('#example1').DataTable({
            colReorder: true, // Enable column reordering
            responsive: true, // Enable responsive behavior
            paging: false, // Disable paging
            autowidth: true, // Enable auto width
            order: [[0, "desc"]], // Order by date descending by default
        });
        function reorderColumns() {
            var screenWidth = window.innerWidth;
            if (screenWidth < 768) { // For mobile devices
                table.colReorder.order([1, 3, 5, 4, 2, 6, 0, 7], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5, 6, 7], true); // Default order
            }
        }
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });

    var root = '<?= base_url() ?>'

    // let url = `${root}/exportPDF`;

    // let columns = [
    //     { field: 'models_date', headerText: 'Date', width: 90, format: 'yMd' },
    //     { field: 'models_name', headerText: 'Plan', textAlign: 'Center', width: 150, type: 'string' },
    //     { field: 'qty', headerText: 'Qty', textAlign: 'Center', width: 50, type: 'string' },
    //     { field: 'profit', width: 90, headerText: 'Profit', type: 'string' },
    //     { field: 'revenue', width: 90, headerText: 'Revenue', type: 'string' },
    //     { field: 'spend', width: 90, headerText: 'Spend', type: 'string' },
    //     { field: 'margin', headerText: 'Margin', textAlign: 'Right', width: 90, type: 'string' },
    // ];
    // Edit
    function edit(model_id = null) {
        $("#editModal .modal-body").load(root + "/corporate_models_edit/" + model_id);
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }

    // View Table
    function viewTable() {
        // $("#viewTable .modal-body").load(root+"/viewTable")
        // var viewTableModal = new bootstrap.Modal(document.querySelector("#viewTable"))
        // viewTableModal.show()
    }

    // View Table
    function toMsWordFn(model_id) {
        var plan_name = $(`#plan_${model_id} .plan_name`).html();
        $('#plans').html(plan_name);
        let thisUrl = `${root}/fetch_all_models/${model_id}`;
        $("#toMsWord .hide-content").load(thisUrl)
        var toMsWord = new bootstrap.Modal(document.querySelector("#toMsWord"))
        toMsWord.show();
    }

</script>