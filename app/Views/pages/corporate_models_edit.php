
<form method="post" id="udate_entry" name="update_entry" action="<?= base_url() ?>/corporate_models_update">

    <input type="hidden" id="models_id" name="models_id" value="<?php echo $models['models_id'] ?>">

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Date</label>
        <div class="col-sm-8">
            <input type="date" class="form-control" id="models_date" name="models_date" value="<?php echo $models['models_date']; ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Model Name</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="models_name" name="models_name" value="<?php echo $models['models_name']; ?>" required>
        </div>
    </div>
    
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" class="btn btn-success">Save</button>
    </div>
</form>  