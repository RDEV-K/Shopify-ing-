<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-J35T3JYF4D');
</script>
<style>
    @media (max-width:600px) {
        .dtr-details li {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dtr-details li .dtr-data {
            display: flex;
            align-items: center;
            gap: 3px;
        }
    }
</style>
<div class="expad no mt-3">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

        <div class="row mb-3 pb-3 text-center">
            <div class="col">
                <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal"
                    data-bs-target="#entryModal">Add Formula</button>
                <a href="https://ingrevo.com/formulas/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

        <!-- Modals -->

        <!-- Add Modal -->
        <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add New Formula</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/rd/formula_add">
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="formula_date" name="formula_date"
                                        value="<?php echo date('Y-m-d'); ?>" readonly required>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label for="inputPassword3" class="col-sm-3 col-form-label">Product Type</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="formula_rdplan" name="formula_rdplan"
                                        required>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Version</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="formula_version" name="formula_version"
                                        required>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Comments</label>
                                <div class="col-sm-9">
                                    <textarea rows="5" class="form-control" id="formula_comments"
                                        name="formula_comments" required></textarea>
                                </div>
                            </div>

                            <input type="hidden" id="formula_creator" name="formula_creator"
                                value="<?php echo $_SESSION['user_id']; ?>">

                            <input type="hidden" name="formula_status" id="formula_status" value="New">

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
                        <h5 class="modal-title" id="exampleModalLabel">Edit Formula</h5>
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
            <table id="example1" class="display text-center mt-3">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Version</th>
                        <th>Status</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($formula): ?>
                        <?php foreach ($formula as $key => $data): ?>
                            <tr class="pc" data-parent_id="<?= $data->parent_id; ?>" data-_id="<?= $data->id; ?>">
                                <td><?php echo ++$key; ?></td>
                                <td style="min-width:75px;"><?php echo $data->formula_date; ?></td>
                                <td><?php echo $data->formula_rdplan; ?></td>
                                <td style="min-width:100px;"><?php echo $data->formula_version; ?></td>
                                <td><?php echo $data->formula_status; ?></td>
                                <td>

                                    <a href="<?= base_url() ?>/rd/formula_ingredients/csv/<?= $data->formula_id ?>"
                                        class="btn btn-success btn-sm my-1">CSV</a>
                                    <a href="<?= base_url() ?>/rd/formula_ingredients/<?= $data->formula_id ?>"
                                        class="btn btn-success btn-sm">View</a>
                                    <a href="<?= url_to('copy_formula', $data->formula_id) ?>"
                                        class="btn btn-primary btn-sm">Copy</a>
                                    <a class="btn btn-primary btn-sm" onclick="edit(<?= $data->formula_id ?>)">Edit</a>
                                    <a href="<?= base_url() ?>/rd_formula_delete/<?= $data->formula_id ?>"
                                        class="btn btn-danger btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Product</th>
                        <th>Version</th>
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
                table.colReorder.order([0, 2, 3, 4, 1, 5], true); // Reorder columns
            } else { // For larger screens
                table.colReorder.order([0, 1, 2, 3, 4, 5], true); // Default order
            }
        }
        // Reorder columns on initial load and on resize
        reorderColumns();
        $(window).resize(reorderColumns);
    });



    $('.pc').each((i, v) => {
        $(v).hover(function (e) {
            $(`[data-parent_id]`).removeClass(`parent_children`);
            let _id = $(v).data('_id');
            $(`[data-parent_id="${_id}"]`).addClass(`parent_children`);
        });

    })
    var root = '<?= base_url() ?>'

    // Edit
    function edit(formula_id = null) {
        $("#editModal .modal-body").load(root + "/rd_formula_edit/" + formula_id)
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }

</script>