<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/rd_cpn_update" enctype="multipart/form-data">

    <input type="hidden" name="cpn_id" id="cpn_id" value="<?php echo $cpn[0]->cpn_id; ?>">   

    <?php $invoice_file = !$cpn[0]->invoice_file ? "No/" : $cpn[0]->invoice_file ?>
    <input type="hidden" name="invoice_exist_file" id="invoice_exist_file" value="<?= $invoice_file; ?>">
  
    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Date</label>
        <div class="col-sm-8">
        <input type="date" class="form-control" id="cpn_date" name="cpn_date" value="<?php echo $cpn[0]->cpn_date ?>" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-4 col-form-label">Formula</label>
        <div class="col-sm-8">
            <select class="form-select" id="cpn_formula" name="cpn_formula" required>
                <option value="" selected>Choose...</option>
                <?php foreach($formula as $data){?>
                    <option value="<?php echo $data->formula_id ?>" <?php if ($data->formula_id == $cpn[0]->cpn_formula){echo "selected";}?>><?php echo $data->formula_version?> <?php echo $data->formula_rdplan?></option>
                <?php }?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-4 col-form-label">Responsible Person</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" id="cpn_rp" name="cpn_rp" value="<?php echo $cpn[0]->cpn_rp ?>" required>  
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Upload</label>
        <div class="col-sm-8">
            <input type="file" class="form-control file" id="invoice_file_update" name="invoice_file">
        </div>
    </div>

    <input type="hidden" name="cpn_user" id="cpn_user" value="<?php echo $_SESSION['user_id']; ?>">

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" onclick="update()" id="insertdata" class="btn btn-success">Save</button>
    </div>
</form>

<script>
    
    var invoice_file_update = document.querySelector('#invoice_file_update');
    var form_update_entry = document.querySelector('#update_entry');
    
    $('button#insertdata').click(function (e) { 
        e.preventDefault();
        invoice_file_update.files[0] ? validateFile(invoice_file_update.files[0],form_update_entry, 1) : validateFile(invoice_file_update.files[0],form_update_entry);
    });

</script>