<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/manufacturing_ingredients_update" enctype="multipart/form-data">
    
    <input type="hidden" name="ingredient_id" id="ingredient_id" value="<?php echo $ingredient['ingredient_id']; ?>">   

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Name</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="ingredient_name" name="ingredient_name" value="<?php echo $ingredient['ingredient_name']; ?>" required>
        </div>
    </div>
    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">INCI</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="ingredient_inci" name="ingredient_inci" value="<?php echo $ingredient['ingredient_inci']; ?>" required>
        </div>
    </div>
    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Category</label>
        <div class="col-sm-9">
            <select class="form-select" id="ingredient_category" name="ingredient_category" required>
                <option selected>Choose...</option>
                <option <?=$ingredient['ingredient_category'] == "Additives" ? "selected" : "" ?>>Additives</option>
                <option <?=$ingredient['ingredient_category'] == "Antioxidant" ? "selected" : "" ?>>Antioxidant</option>
                <option <?=$ingredient['ingredient_category'] == "Base" ? "selected" : "" ?>>Base</option>
                <option <?=$ingredient['ingredient_category'] == "Botanicals" ? "selected" : "" ?>>Botanicals</option>
                <option <?=$ingredient['ingredient_category'] == "Butter" ? "selected" : "" ?>>Butter</option>
                <option <?=$ingredient['ingredient_category'] == "Carrier Oils" ? "selected" : "" ?>>Carrier Oils</option>
                <option <?=$ingredient['ingredient_category'] == "Colourant" ? "selected" : "" ?>>Colourant</option>
                <option <?=$ingredient['ingredient_category'] == "Emollient" ? "selected" : "" ?>>Emollient</option>
                <option <?=$ingredient['ingredient_category'] == "Emulsifier" ? "selected" : "" ?>>Emulsifier</option>
                <option <?=$ingredient['ingredient_category'] == "Essential Oil" ? "selected" : "" ?>>Essential Oil</option>
                <option <?=$ingredient['ingredient_category'] == "Exfoliant" ? "selected" : "" ?>>Exfoliant</option>
                <option <?=$ingredient['ingredient_category'] == "Fragrance Oil" ? "selected" : "" ?>>Fragrance Oil</option>
                <option <?=$ingredient['ingredient_category'] == "Humectant" ? "selected" : "" ?>>Humectant</option>            
                <option <?=$ingredient['ingredient_category'] == "Moisturiser" ? "selected" : "" ?>>Moisturiser</option>
                <option <?=$ingredient['ingredient_category'] == "Oil" ? "selected" : "" ?>>Oil</option>
                <option <?=$ingredient['ingredient_category'] == "Preservative" ? "selected" : "" ?>>Preservative</option>
                <option <?=$ingredient['ingredient_category'] == "Surfactant" ? "selected" : "" ?>>Surfactant</option>
                <option <?=$ingredient['ingredient_category'] == "Thickener" ? "selected" : "" ?>>Thickener</option>
                <option <?=$ingredient['ingredient_category'] == "Water" ? "selected" : "" ?>>Water</option>
                <option <?=$ingredient['ingredient_category'] == "Wax" ? "selected" : "" ?>>Wax</option>
            </select>
        </div>
    </div>
    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Qty (g)</label>
        <div class="col-sm-9">
        <input type="number" class="form-control" id="ingredient_qty" name="ingredient_qty" value="<?php echo $ingredient['ingredient_qty']; ?>" step="any" required>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" class="btn btn-success">Save</button>
    </div>
</form>

            