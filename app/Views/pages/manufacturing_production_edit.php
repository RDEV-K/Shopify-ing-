<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/manufacturing/manuf_production_update">
    
    <input type="hidden" name="manuf_product_id" id="manuf_product_id" value="<?php echo $manuf_production['manuf_product_id']; ?>">

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label" required>Date</label>
            <div class="col-sm-9">
            <input type="date" class="form-control" id="manuf_product_date" name="manuf_product_date" value="<?php echo $manuf_production['manuf_product_date']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Product</label>
        <div class="col-sm-9">
            <select class="form-select" id="manuf_product_formula" name="manuf_product_formula" required>
                <option selected>Choose...</option>
                <?php foreach($formula as $data){?>
                    <option value="<?php echo $data->formula_id ?>" <?php if ($data->formula_id == $manuf_production['manuf_product_formula']){echo "selected";}?> ><?php echo $data->formula_version?> <?php echo $data->formula_rdplan?></option>
                <?php }?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label" required>Qty (g)</label>
        <div class="col-sm-9">
        <input type="number" class="form-control" id="manuf_product_qty" name="manuf_product_qty" value="<?php echo $manuf_production['manuf_product_qty']; ?>" step="any" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Batch #</label>
        <div class="col-sm-9">
        <input type="text" class="form-control" id="manuf_product_batch" name="manuf_product_batch" value="<?php echo $manuf_production['manuf_product_batch']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Comments</label>
        <div class="col-sm-9">
        <textarea rows="5" class="form-control" id="manuf_comments" name="manuf_comments" required><?php echo $manuf_production['manuf_comments']; ?></textarea>
        </div>
    </div>

    <input type="hidden" name="manuf_product_status" id="manuf_product_status" value="In Progress" readonly>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" onclick="update()" class="btn btn-success">Save</button>
    </div>
</form>
       
<script>
    function update() {

    var form = document.querySelector("form#update_entry")
    var data = $(form).serialize()

        $.post(root+"/manuf_production_update", data, function(d) {
            $(".modal.show").hide()
            $(".modal-backdrop").hide()
            console.log(d)
        })
        .fail(function(err) {
            console.log(err)
        })
    }
</script>
