<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>

<div class="expad no mt-3">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

        <div class="row mb-3 pb-3 text-center">
            <div class="col">
                <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal" data-bs-target="#entryModal">Add Ingredient Batch</button>
                <a class="btn btn-success btn-sm" href="<?= base_url() ?>/manufacturing/ingredientbatches/csv">CSV Export</a>
                <a href="https://ingrevo.com/ingredient-batches/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>
        <?php if (session()->has('error')): ?>

            <div class="d-flex justify-content-center err">
                <span class="text-center mt-3 alert alert-info"><?= session()->get('error') ?></span>
            </div>
        <?php endif; ?>

        <!-- Modals -->

        <!-- Add Modal -->
        <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Ingredient Batch</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="add_entry" name="add_entry"
                            action="<?= base_url() ?>/manufacturing/ingredientbatch_add" enctype="multipart/form-data">

                            <!-- Ingredient -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Ingredient</label>
                                <div class="col-sm-9">
                                    <select class="form-select" id="ingredient_id" name="ingredient_id" required>
                                        <option selected>Choose...</option>
                                        <?php foreach ($ingredients as $data) { ?>
                                            <option value="<?php echo $data->ingredient_id ?>">
                                                <?php echo $data->ingredient_name ?> - <?php echo $data->ingredient_inci ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <!-- Batch # -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Batch #</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ingredient_batch_no"
                                        name="ingredient_batch_no" required>
                                </div>
                            </div>

                            <!-- Supplier -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Supplier</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ingredient_batch_supplier_id"
                                        name="ingredient_batch_supplier_id" required>
                                </div>
                            </div>

                            <!-- Expiry -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Expiry Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="ingredient_batch_expiry"
                                        name="ingredient_batch_expiry" required>
                                </div>
                            </div>

                            <!-- Qty -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Qty (g)</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="ingredient_batch_qty"
                                        name="ingredient_batch_qty" step="any" required>
                                </div>
                            </div>

                            <!-- MSDS -->
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">MSDS</label>
                                <div class="col-sm-9">
                                    <input type="file" class="form-control file file_add" id="invoice_file"
                                        name="invoice_file" accept=".pdf">
                                </div>
                            </div>

                            <input type="hidden" id="user_id" name="user_id" value="<?= $_SESSION['user_id'] ?>">
                            <input type="hidden" id="date_added" name="date_added" value="<?php echo date('Y-m-d'); ?>">

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
                                <button type="submit" name="insertdata" class="btn btn-success add_ib">Save</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal -->

        <!-- View Modal -->
        <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewModal">View Ingredient Batch</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- View Modal -->

        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Ingredient Batch</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                    </div>
                </div>
            </div>
        </div>
        <!-- Edit Modal -->

        <!-- Modals -->

        <div class="row">
            <table id="example1" class="display text-center nowrap mt-3">
                <thead>
                    <tr>
                        <th>Date Added</th>
                        <th>Ingredient</th>
                        <th>INCI</th>
                        <th>Batch #</td>
                        <th>Supplier</td>
                        <th>Expiry</th>
                        <th>Qty (g)</th>
                        <th>Status</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($batchs):
                        foreach ($batchs as $batch):
                            ?>
                            <tr>
                                <td><?= $batch->date_added ?></td>
                                <td><?= $batch->ingredient_name ?></td>
                                <td><?= $batch->ingredient_inci ?></td>
                                <td><?= $batch->ingredient_batch_no ?></td>
                                <td><?= $batch->ingredient_batch_supplier_id ?></td>
                                <td><?= $batch->ingredient_batch_expiry ?></td>
                                <td><?= $batch->ingredient_batch_qty ?></td>
                                <td><?php
                                $now = date('Y-m-d H:i:s');
                                $exp = date('Y-m-d H:i:s', strtotime($batch->ingredient_batch_expiry));
                                echo strtotime($now) < strtotime($exp) ? "<strong class='text-success'> <i class='fa fa-check-circle-o'></i> Active</strong>" : "<strong class='text-danger'> <i class='fa fa-times-circle-o'></i> Expired</strong>";
                                ?>
                                </td>
                                <td>
                                    <a class="btn btn-success btn-sm"
                                        onclick="view(<?= $batch->ingredient_batch_id ?>)">View</a>
                                    <a class="btn btn-primary btn-sm"
                                        onclick="edit(<?= $batch->ingredient_batch_id ?>)">Edit</a>
                                    <a href="<?= base_url() ?>/manufacturing/ingredientbatch_delete/<?php echo $batch->ingredient_batch_id ?>"
                                        class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; endif ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Date Added</th>
                        <th>Ingredient</th>
                        <th>INCI</th>
                        <th>Batch #</td>
                        <th>Supplier</td>
                        <th>Expiry</th>
                        <th>Qty (g)</th>
                        <th>Status</th>
                        <th>Options</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </main>
</div>

<script>
    let invoice = document.querySelector('.file_add');
    let form = document.querySelector('#add_entry');
    $('button.add_ib').click(function (e) {
        e.preventDefault();
        validateFile(invoice.files[0], form, 1);
    });
    function validateFile(invoice, form, req = null) {
        if (req) {
            if (!invoice) {
                alert("Please select a file to MSDS");
                return;
            }
            if (invoice.type !== 'application/pdf') {
                alert('File is not PDF format');
                return;
            }

            if (invoice.size > 2 * 1024 * 1024) {
                alert('File size exceeds the limit of 2MB');
                return;
            }
        }
        form.submit();
    }

    setTimeout(() => {
        $('.err').fadeOut();
        $('.alert-info').fadeOut();
    }, 6000);
    // Table
    $(document).ready(function () {
        // $('#example1').DataTable( {
        //     "paging":   false,
        //     "autowidth": true,
        //     "responsive": true,
        //     "order": [[ 0, "desc" ]],
        // } );
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
                table.colReorder.order([3, 1, 2, 4, 5, 6, 7, 0, 8], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5, 6, 7, 8], true); // Default order
            }
        }
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });

    var root = '<?= base_url() ?>'
    // Edit
    function edit(ingredient_id = null) {
        $("#editModal .modal-body").load(root + "/manufacturing/ingredientbatch_edit/" + ingredient_id)
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }

    // View
    function view(ingredient_id) {
        $("#viewModal .modal-body").load(root + "/manufacturing/ingredientbatch_view/" + ingredient_id)
        var viewModal = new bootstrap.Modal(document.querySelector("#viewModal"))
        viewModal.show()
    }

</script>