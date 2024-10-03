<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="expad no mt-3">
    <main role="main" class="col-md-12 ml-sm-auto col-lg-12 px-3">

    
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
                                <form method="post" id="add_entry" name="add_entry" action="<?= base_url() ?>/rd/formula_ingredients_add">    
                                    
                                    <div class="form-group row mb-3">
                                        <label for="inputPassword3" class="col-sm-3 col-form-label">Phase</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="f_ingredients_phase" name="f_ingredients_phase" required>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label for="inputPassword3" class="col-sm-3 col-form-label">Ingredient</label>
                                        <div class="col-sm-9">
                                            <select class="form-select" id="f_ingredients_ingredient" name="f_ingredients_ingredients" required>
                                                <option selected>Choose...</option>
                                                <?php foreach($ingredients as $data){?>
                                                    <option value="<?=$data->ingredient_id?>"><?=$data->ingredient_name?> - <?=$data->ingredient_inci?></option>
                                                <?php }?>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label class="col-sm-3 col-form-label">%</label>
                                        <div class="col-sm-9">
                                            <input type="number" class="form-control" id="f_ingredients_qty" name="f_ingredients_qty" step="any" required>
                                        </div>
                                    </div>

                                    <div class="form-group row mb-3">
                                        <label class="col-sm-3 col-form-label">Instruction</label>
                                        <div class="col-sm-9">
                                            <textarea rows="5" class="form-control" id="f_ingredients_instructions" name="f_ingredients_instructions" required></textarea>
                                        </div>
                                    </div>
                                    
                                    <input type="hidden" name="f_ingredients_formula" id="f_ingredients_formula" value="<?php echo $formula[0]->formula_id?>">

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
            <div class="col-md-12 mt-md-0 mt-lg-5 col-lg-3">
                <div class="text-center">
                    <table id="example2" class="table table-striped border-top">
                        <tr>
                            <th>Date</th>
                            <td><?php echo $formula[0]->formula_date?></td>
                        </tr>
                        <tr>
                            <th>Type</th>
                            <td><?php echo $formula[0]->formula_rdplan?></td>
                        </tr>
                        <tr>
                            <th>Version</th>
                            <td><?php echo $formula[0]->formula_version?></td>
                        </tr>
                        <tr>
                            <th>Volume</th>
                            <td><span class="<?= $total_percent > 100 ? 'text-danger' : '' ?>"><?= round($total_percent,2) ?>%</span> / 100%</td>
                        </tr>
                        <tr>
                            <th>Comment</th>
                            <td><?php echo $formula[0]->formula_comments?></td>
                        </tr>
                    </table>
                    <span></span>
                </div>
            </div>
        
        
            <div class="col-md-12 col-lg-9">
                <div class="row mb-3 mt-5 mt-lg-0 pb-3 text-center">
                    <div class="col">
                        <button type="button" class="btn btn-sm btn-success text-center" data-bs-toggle="modal" data-bs-target="#entryModal">Add Ingredient</button></button>
                        <a href="https://ingrevo.com/formula-creation//" target="_blank"><i id="help-icon" class="fa-solid fa-circle-info fa-2xl" data-toggle="tooltip" title="How To Guide"></i><a>
                    </div>

            <div class="col mt-3 mt-lg-5">
                <table id="example1" class="display text-center">
                    <thead>
                        <tr>
                            <th>Phase</th>
                            <th>Ingredient</th>
                            <th>%</th>
                            <th>Instructions</th>
                            <th>Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($f_ingredients): ?>
                            <?php foreach ($f_ingredients as $data) : ?>
                                <tr>
                                    <td><?php echo $data->f_ingredients_phase; ?></td>
                                    <td><?php echo $data->ingredient_name; ?> / <?php echo $data->ingredient_inci; ?></td>
                                    <td><?php echo strstr($data->f_ingredients_qty, '%', true); ?>%</td>
                                    <td><?php echo $data->f_ingredients_instructions; ?></td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" onclick="edit(<?=$data->f_ingredients_id?>)">Edit</a>
                                        <a href="<?= base_url() ?>/formula_ingredients_delete/<?php echo $data->f_ingredients_id ?>" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

    


</div>

<script>
    // Table
    $(document).ready(function() {
        $('#example1').DataTable( {
            "order": [[ 0, "asc" ]],
            "paging":   false,
            "autowidth": true,
            "responsive": true,
            "bFilter": false,
            "info": false,
        } );
    } );

    // Table 
      $(document).ready(function() {
      $('#example2').DataTable( {
        "paging":   false,
        "autowidth": true,
      });
    });

        // Table 
        $(document).ready(function() {
      $('#example3').DataTable( {
        "paging":   false,
        "autowidth": true,
      });
    });

    var root = '<?=base_url()?>'

    // Edit
    function edit(f_ingredients_id = null){
        $("#editModal .modal-body").load(root+"/formula_ingredients_edit/"+f_ingredients_id)
        var editModal = new bootstrap.Modal(document.querySelector("#editModal"))
        editModal.show()
    }
</script>