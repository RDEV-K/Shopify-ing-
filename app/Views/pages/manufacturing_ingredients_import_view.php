<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
    .collapse-horizontal {
        display: flex;
        flex-direction: row;
    }
    .filter-button:hover {
        cursor: pointer;
    }
</style>

<div class="row g-2">
    <div class="small-12 colums">
        <div class="container">
            <div class="row">
                <div class="col-md-12" id="mySidenav">
                    <select class="form-select" id="category-filter" aria-label="Default select example">
                        <option value="all" selected>All(category selection)</option>
                        <option value="one">One</option>
                        <option value="two">Two</option>
                        <option value="three">Three</option>
                    </select>
                    <a class="btn" id="new-button" data-bs-toggle="modal"
                    data-bs-target="#entryModal">New Ingredient</a>
                </div>
                <div class="col-md-12">
                    <table id="import" class="display text-center nowrap mt-3">
                        <thead>
                            <tr>
                                <th>Ingredient</th>
                                <th>INCI</th>
                                <th>Category</th>
                                <th>Options</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($ingredients): ?>
                                <?php foreach ($ingredients as $data): ?>
                                    <tr>
                                        <td><?php echo $data['title']; ?></td>
                                        <td><?php echo $data['body_html']; ?></td>
                                        <td><?php echo $data['product_type']; ?></td>
                                        <td>
                                            <a class="btn btn-success btn-sm" href="<?= base_url()?>/manufacturing/ingredients_api_show/<?= $data['id'] ?>">View</a>
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
                                <th>Options</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


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

<script>
    $(document).ready(function() {

        var table = $('#import').DataTable({
            "paging": true,
            "autowidth": true,
            "responsive": true,
            "order": [[0, "desc"]],
            "pageLength": 10,
            "lengthMenu": [10, 25, 50, 100],
            "pagingType": "full_numbers",
            "createdRow": function (row, data, dataIndex) {
                // Add a class to the row
                $(row).addClass('custom-row-class');

                // Example: Add a class to a specific cell (e.g., the first cell)
                $('td:eq(0)', row).addClass('custom-cell-class');

                // Example: Add a class to the last cell (Options)
                $('td:last', row).addClass('options-cell-class');
            }
        });
        $('#category-filter').on('change', function () {
            var selectedCategory = $(this).val();
            console.log(selectedCategory);
            if(selectedCategory == 'all') {
                table.column(2).search('').draw();
            } else {
                table.column(2).search(selectedCategory).draw(); // Assuming Category is the third column (index 2)
            }
        });
    });
</script>

<style>
    #category-filter {
        top: 300px;
        background-color: #555;
        position: absolute;
        left: -262px;
        transition: 0.3s;
        padding: 15px;
        width: 300px;
        text-decoration: none;
        font-size: 20px;
        color: white;
        border-radius: 0 5px 5px 0;
        z-index: 1;
    }
    #category-filter:hover {
        left: 0;
    }
    #new-button {
        position: absolute;
        top: 240px;
        left: -262px; /* Start hidden */
        width: 300px;
        transition: 0.3s;
        padding: 15px;
        font-size: 20px;
        color: white;
        background-color: #555; /* Button background color */
        border: none; /* Remove default border */
        border-radius: 5px; /* Rounded corners */
        cursor: pointer; /* Change cursor to pointer */
        z-index: 1;
    }

    #new-button:hover {
        left: 0; /* Slide in on hover */
    }

    /* Prevent overlay of dropdown */
    .dataTables_length {
        display: inline-block;
        margin-right: 20px;
    }

    .dataTables_length select {
        width: auto;
        min-width: 60px;
    }

    /* Remove black square on hover */
    .dataTables_paginate .paginate_button:hover {
        background: transparent;
        color: inherit;
    }

</style>