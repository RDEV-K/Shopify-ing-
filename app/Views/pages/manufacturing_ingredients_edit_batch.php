<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<form method="post" id="update_entry" name="update_entry" action="<?= base_url() ?>/manufacturing/ingredientbatch_update" enctype="multipart/form-data">
    <?php $batch = $ingredient_batch[0]; ?>
    <pre><?php //print_r($batch);die; ?></pre>

    <input type="hidden" name="ingredient_batch_id" id="ingredient_batch_id" value="<?php echo $batch->ingredient_batch_id; ?>">   

    <?php $invoice_file = !$batch->invoice_file ? "No/" : $batch->invoice_file ?>
    <input type="hidden" name="invoice_exist_file" id="invoice_exist_file" value="<?= $invoice_file; ?>">
  
    
    <div class="form-group row mb-3">
        <label for="inputPassword3" class="col-sm-4 col-form-label">Ingredient</label>
        <div class="col-sm-8">
            <select class="form-select delivery_s_item" id="delivery_ingredient_item" data-stock_name="ingredient" name="ingredient_id" required>
                <option selected value="0">Choose...</option>
                <?php foreach($ingredients as $data){?>
                    <option value="<?=$data['ingredient_id']?>" <?php echo $data['ingredient_id'] == $batch->ingredient_id ? "selected" : '' ?>><?=$data['ingredient_name']?> - <?=$data['ingredient_inci']?></option>
                <?php }?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Batch</label>
        <div class="col-sm-8">
            <input value="<?=$batch->ingredient_batch_no ?>" type="text" class="form-control" id="ingredient_batch_no" name="ingredient_batch_no" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Supplier</label>
        <div class="col-sm-8">
            <input value="<?=$batch->ingredient_batch_supplier_id ?>" type="text" class="form-control" id="ingredient_batch_supplier_id" name="ingredient_batch_supplier_id" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Expiry Date</label>
        <div class="col-sm-8">
            <input value="<?php echo date('Y-m-d', strtotime($batch->ingredient_batch_expiry)) ?>" type="date" class="form-control" id="ingredient_batch_expiry" name="ingredient_batch_expiry" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">Qty (g)</label>
        <div class="col-sm-8">
            <input value="<?=$batch->ingredient_batch_qty ?>" type="number" class="form-control" id="ingredient_batch_qty" name="ingredient_batch_qty" step="any" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-4 col-form-label">MSDS</label>
        <div class="col-sm-8">
            <input type="file" class="form-control file" id="invoice_file_update" name="invoice_file" accept=".pdf">
        </div>
    </div>

    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Discard</button>
        <button type="submit" id="insertdata" class="btn btn-success">Save</button>
    </div>
</form>

<script>
    
    var invoice_file_update = document.querySelector('#invoice_file_update');
    var form_update_entry = document.querySelector('#update_entry');
    
    $('button#insertdata').click(function (e) { 
        e.preventDefault();
        invoice_file_update.files[0] ? validateFile(invoice_file_update.files[0],form_update_entry, 1) : validateFile(invoice_file_update.files[0],form_update_entry);
    });

    function validateFile(file, form, req = null) {
    if (req) {
      if (!file) {
        alert("Please select a file to upload");
        return;
      }
      if (file.type !== 'application/pdf') {
        alert('File is not PDF format');
        return;
      }

      if (file.size > 2 * 1024 * 1024) {
        alert('File size exceeds the limit of 2MB');
        return;
      }

    }
    form.submit();
  }

    $('.delivery_s_item').change(function (){
        // ;
        if($('.delivery_s_item').val() == 0) {
            $('#insertdata').attr('disabled',true);
        }
        $('.delivery_ing').val('');
    });
    
    setTimeout(() => {
        queries($('#delivery_ingredient_item'));
    }, 1500);
    $('#delivery_ingredient_item').change(function() {
        queries(this);
    });

    $('.delivery_ing').on('input',function() {
        var qty = $(this).val();
        var tot = parseInt(rem) + parseInt(qty);
        $('.remQty small').html(`( <span><span>${from}</span> Qty: <b>${tot}</b></span>)`);
        var itemQty = $('.remQty small span b').html();

        if(itemQty < 0 || ($(this).val()).match('\b[0-9]\b') || $(this).val() == 0 || $(this).val() < 0 || $(this).val() == '' || $('[name="delivery_ingredient_item"]').val() == 0) {
            $('#insertdata').attr('disabled',true);
        }else {
            $('#insertdata').removeAttr('disabled');
        }
        if(itemQty < 0) {
            $('.remQty small').css('color','red')
        }else {
            $('.remQty small').css('color','gray')
        }
        
        if($(this).val() <= 0) {
            $(this).css('color','red');
        }else {
            $(this).css('color','black')
        }
    });

    jQuery.postCORS = function(data, func) {
        if(func == undefined) func = function() {};
        $.ajax({
            type: 'POST',
            url: "<?= base_url()?>/WebAppController/checkQty",
            data: data,
            dataType: 'json',
            contentType: 'application/x-www-form-urlencoded',
            xhrFields: { withCredentials: true},
            success: function(res) { extractData(res) },
            error: function () {
            func({})
            }
        });
    }

    function queries(e) {
        console.log($(e).val(), $(e).data('stock_name'));
        $.postCORS({
            "<?= csrf_token() ?>": "<?= csrf_hash() ?>",
            "item_id": parseInt($(e).val()),
            'item_name': $(e).data('stock_name')
        },function(obj) {
            return obj;
        });
    }
    function extractData(obj) {
        $('.remQty small').html(`( <span>${obj.remaining}</span> )`);
        $('.remQty small').html(`( <span>${obj.remaining}</span> )`);
        from = $('.remQty small span span').html();
        rem = $('.remQty small span b').html();
    }
</script>