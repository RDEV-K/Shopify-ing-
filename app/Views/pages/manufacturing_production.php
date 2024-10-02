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
                <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal"
                    data-bs-target="#entryModal">Create Product</button>
                <a href="https://ingrevo.com/production/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

        <!-- Modals -->

        <!-- Add Modal -->
        <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Create Product</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <form method="post" id="add_entry" name="add_entry"
                            action="<?= base_url() ?>/manufacturing/production_add">
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="manuf_product_date"
                                        name="manuf_product_date" value="<?php echo date('Y-m-d'); ?>" readonly
                                        required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label for="inputPassword3" class="col-sm-3 col-form-label">Product</label>
                                <div class="col-sm-9">
                                    <select class="form-select" id="manuf_product_formula" name="manuf_product_formula"
                                        required>
                                        <option selected>Choose...</option>
                                        <?php foreach ($formula as $data) { ?>
                                            <option value="<?php echo $data->formula_id ?>">
                                                <?php echo $data->formula_version ?>     <?php echo $data->formula_rdplan ?>
                                            </option>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Qty (g)</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="manuf_product_qty"
                                        name="manuf_product_qty" required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Batch #</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="manuf_product_batch"
                                        name="manuf_product_batch" required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Comments</label>
                                <div class="col-sm-9">
                                    <textarea rows="5" class="form-control" id="manuf_comments" name="manuf_comments"
                                        required></textarea>
                                </div>
                            </div>

                            <input type="hidden" id="manuf_product_creator" name="manuf_product_creator"
                                value="<?php echo $_SESSION['user_id'] ?>">
                            <input type="hidden" name="manuf_product_status" id="manuf_product_status"
                                value="In Progress">

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

        <!-- Edit Modal -->
        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Product</h5>
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
                        <th>Date</th>
                        <th>Batch #</td>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Qty (g)</th>
                        <th>Status</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>

                    <?php if ($manuf_production): ?>
                        <?php foreach ($manuf_production as $data): ?>
                            <tr>
                                <td><?= $data->manuf_product_date; ?></td>
                                <td><?= $data->manuf_product_batch; ?></td>
                                <td><?= $data->formula_rdplan; ?></td>
                                <td><?= $data->formula_version; ?> </td>
                                <td><?= $data->manuf_product_qty; ?></td>
                                <td><?= $data->manuf_product_status; ?></td>
                                <td>
                                    <a class="btn btn-success btn-sm"
                                        href="<?= base_url() ?>/manufacturing/manuf_production_batch/csv/<?= $data->manuf_product_id ?>">CSV</a>
                                    <a class="btn btn-success btn-sm"
                                        href="<?= base_url() ?>/manufacturing/manuf_production_batch/<?= $data->manuf_product_id ?>">View</a>
                                    <a class="btn btn-primary btn-sm" onclick="edit(<?= $data->manuf_product_id ?>)">Edit</a>
                                    <a href="<?= base_url() ?>/manufacturing/production_delete/<?= $data->manuf_product_id ?>"
                                        class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>

                </tbody>
                <tfoot>
                    <tr>
                        <th>Date</th>
                        <th>Batch #</td>
                        <th>Product</th>
                        <th>Version</th>
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
    // Table
    $(document).ready(function () {
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
                table.colReorder.order([1, 2, 3, 4, 5, 0, 6], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5, 6], true); // Default order
            }
        }
        
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });

    var root = '<?= base_url() ?>'

    // Edit
    function edit(manuf_product_id = null){
        $("#editModal .modal-body").load(root+"/manufacturing/manuf_production_edit/"+manuf_product_id)
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }

</script>