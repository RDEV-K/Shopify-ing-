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
                    data-bs-target="#entryModal">Add Ingredient</button>
                <a class="btn btn-success btn-sm" href="<?= url_to('all_ing_csv') ?>">CSV Export</a>
                <a href="https://ingrevo.com/ingredients/" target="_blank"><i id="help-icon"
                        class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
            </div>
        </div>

        <!-- Modals -->

        <!-- Add Modal -->
        <div class="modal fade" id="entryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Ingredient</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" id="add_entry" name="add_entry"
                            action="<?= base_url() ?>/manufacturing/ingredients_add" enctype="multipart/form-data">
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Date</label>
                                <div class="col-sm-9">
                                    <input type="date" class="form-control" id="ingredient_date" name="ingredient_date"
                                        value="<?php echo date('Y-m-d'); ?>" readonly required>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Name</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ingredient_name" name="ingredient_name"
                                        required>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">INCI</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="ingredient_inci" name="ingredient_inci"
                                        required>
                                </div>
                            </div>
                            <div class="form-group row mb-3">
                                <label for="inputPassword3" class="col-sm-3 col-form-label">Category</label>
                                <div class="col-sm-9">
                                    <select class="form-select" id="ingredient_category" name="ingredient_category"
                                        required>
                                        <option selected>Choose...</option>
                                        <option>Additives</option>
                                        <option>Antioxidant</option>
                                        <option>Base</option>
                                        <option>Botanicals</option>
                                        <option>Butter</option>
                                        <option>Carrier Oils</option>
                                        <option>Colourant</option>
                                        <option>Emollient</option>
                                        <option>Emulsifier</option>
                                        <option>Essential Oil</option>
                                        <option>Exfoliant</option>
                                        <option>Fragrance Oil</option>
                                        <option>Humectant</option>
                                        <option>Moisturiser</option>
                                        <option>Oil</option>
                                        <option>Preservative</option>
                                        <option>Surfactant</option>
                                        <option>Thickener</option>
                                        <option>Water</option>
                                        <option>Wax</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row mb-3">
                                <label class="col-sm-3 col-form-label">Qty (g)</label>
                                <div class="col-sm-9">
                                    <input type="number" class="form-control" id="ingredient_qty" name="ingredient_qty"
                                        step="any" required>
                                </div>
                            </div>

                            <input type="hidden" id="staff_name" name="staff_name" value="<?= $_SESSION['user_id'] ?>">

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

        <!-- View Modal -->
        <div class="modal fade" id="viewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewModal">View Ingredient Record</h5>
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
                        <h5 class="modal-title" id="exampleModalLabel">Edit Ingredient</h5>
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
            <div class="col-md-12">
                <table id="example1" class="display text-center nowrap mt-3">
                    <thead>
                        <tr>
                            <th>Ingredient</th>
                            <th>INCI</th>
                            <th>Category</th>
                            <th>Qty (g)</th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($ingredients): ?>
                            <?php foreach ($ingredients as $data): ?>
                                <tr>
                                    <td><?php echo $data->ingredient_name; ?></td>
                                    <td><?php echo $data->ingredient_inci; ?></td>
                                    <td><?php echo $data->ingredient_category; ?></td>
                                    <td><?php echo $data->ingredient_qty; ?></td>
                                    <td>
                                        <a class="btn btn-success btn-sm"
                                            href="<?= base_url() ?>/manufacturing_ingredients_view_batch/<?php echo $data->ingredient_id ?>">View</a>
                                        <a class="btn btn-primary btn-sm" onclick="edit(<?= $data->ingredient_id ?>)">Edit</a>
                                        <a href="<?= base_url() ?>/manufacturing/ingredients_delete/<?php echo $data->ingredient_id ?>"
                                            class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Ingredient</th>
                            <th>INCI</th>
                            <th>Catergory</th>
                            <th>Qty (g)</th>
                            <th>Options</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </main>
</div>

<script>
    // Table
    $(document).ready(function () {
        $('#example1').DataTable({
            "paging": false,
            "autowidth": true,
            "responsive": true,
            "order": [[0, "desc"]],
        });

        $('#expSpreedsheet').DataTable({
            "paging": false,
            "responsive": true,
            "order": [[1, 'asc']],
            "columnDefs": [
                { "visible": false, "targets": 1 }
            ],
            "rowGroup": {
                "dataSrc": 1
            },
            createdRow: function (row, data, dataIndex) {
                $('td', row).eq(0).html(dataIndex + 1);
            }

        });

    });

    var root = '<?= base_url() ?>'

    // Edit
    function edit(ingredient_id = null) {
        $("#editModal .modal-body").load(root + "/manufacturing_ingredients_edit/" + ingredient_id)
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }

    // View
    function view(ingredient_id = null) {
        $("#viewModal .modal-body").load(root + "/manufacturing_ingredients_view_batch/" + ingredient_id)
        var viewModal = new bootstrap.Modal(document.querySelector("#viewModal"))
        viewModal.show()
    }
</script>