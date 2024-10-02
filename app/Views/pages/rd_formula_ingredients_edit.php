<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/update_formula_ingredient/<?=$f_ingredients['f_ingredients_formula'] ?>">
    
    <input type="hidden" name="f_ingredients_formula" id="f_ingredients_formula" value="<?php echo $f_ingredients['f_ingredients_formula']?>">
    <input type="hidden" name="f_ingredients_id" id="f_ingredients_id" value="<?php echo $f_ingredients['f_ingredients_id']?>">
    
    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Phase</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="f_ingredients_phase" name="f_ingredients_phase" value="<?php echo $f_ingredients['f_ingredients_phase']?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Ingredient</label>
        <div class="col-sm-9">
            <select class="form-select" id="f_ingredients_ingredient" name="f_ingredients_ingredients" required>
                <option selected>Choose...</option>
                <?php foreach($ingredients as $data){?>
                    <option value="<?=$data['ingredient_id']?>" <?php if ($data['ingredient_id']==$f_ingredients['f_ingredients_ingredients']){echo "selected";}?>> <?=$data['ingredient_name']?> - <?=$data['ingredient_inci']?></option>
                <?php }?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">%</label>
        <div class="col-sm-9">
        <input type="number" class="form-control" id="f_ingredients_qty" name="f_ingredients_qty" value="<?php echo $f_ingredients['f_ingredients_qty']?>" step="any" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Instruction</label>
        <div class="col-sm-9">
        <textarea rows="5" class="form-control" id="f_ingredients_instructions" name="f_ingredients_instructions" required><?php echo $f_ingredients['f_ingredients_instructions']?></textarea>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" class="btn btn-success">Save</button>
    </div>
</form>