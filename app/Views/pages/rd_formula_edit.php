<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/rd_formula_update">
    
    <input type="hidden" name="formula_id" id="formula_id" value="<?php echo $formula['formula_id']; ?>">   
  
    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Date</label>
        <div class="col-sm-9">
        <input type="date" class="form-control" id="formula_date" name="formula_date" value="<?php echo $formula['formula_date']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Product Type</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" id="formula_rdplan" name="formula_rdplan" value="<?php echo $formula['formula_rdplan']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Version</label>
        <div class="col-sm-9">
        <input type="text" class="form-control" id="formula_version" name="formula_version" value="<?php echo $formula['formula_version']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 col-form-label">Comments</label>
        <div class="col-sm-9">
        <textarea rows="5" class="form-control" id="formula_comments" name="formula_comments" required><?php echo $formula['formula_comments']; ?></textarea>
        </div>
    </div>
    
    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-3 col-form-label">Status</label>
        <div class="col-sm-9">
            <select class="form-select" id="formula_status" name="formula_status" required>
                <option selected>Choose...</option>
                <option <?=$formula['formula_status'] == "New" ? "selected" : "" ?>>New</option>
                <option <?=$formula['formula_status'] == "Pending" ? "selected" : "" ?>>Pending</option>
                <option <?=$formula['formula_status'] == "Approved" ? "selected" : "" ?>>Approved</option>
                <option <?=$formula['formula_status'] == "Rejected" ? "selected" : "" ?>>Rejected</option>
            </select>
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" class="btn btn-success">Save</button>
    </div>
</form>