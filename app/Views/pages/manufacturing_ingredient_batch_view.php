<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="row">
    <div class="col-lg-4 mb-3">
        <table id="example1" class="table table-striped border-top">
            <pre><?php //print_r($ingredientbatch);die; ?></pre>
            <tr>
                <th>Ingredient</th>
                <td><?=$ingredientbatch[0]->ingredient_name; ?></td>
            </tr>
            <tr>
                <th>Batch #</th>
                <td><?=$ingredientbatch[0]->ingredient_batch_no; ?></td>
            </tr>
            <tr>
                <th>Category</th>
                <td><?=$ingredientbatch[0]->ingredient_category; ?></td>
            </tr>
            <tr>
                <th>Qty (g)</th>
                <td><?=$ingredientbatch[0]->ingredient_batch_qty; ?></td>
            </tr>
            <tr>
                <th>Expiry date</th>
                <td class=""><?=$ingredientbatch[0]->ingredient_batch_expiry; ?></td>
            </tr>
            <tr>
                <th>Status</th>
                <td><?php
                    $now = date('Y-m-d H:i:s');
                    $exp = date('Y-m-d H:i:s', strtotime($ingredientbatch[0]->ingredient_batch_expiry));
                    echo strtotime($now) < strtotime($exp) ? "<strong class='text-success'> <i class='fa fa-check-circle-o'></i> Active</strong>" : "<strong class='text-danger'> <i class='fa fa-times-circle-o'></i> Expired</strong>";
                ?></td>
            </tr>    
        </table>
    </div>
    <div class="col-lg-8">

        <pre><?php //print_r($file_history); die; ?></pre>
        <?php $file_tmpName=null;$dir=null; if(!empty($file_history)){
            $fileCount = count($file_history);
            $file_tmpName = $file_history[$fileCount-1]->file_upload;
            $dir = $file_history[$fileCount-1]->file_directory;
            }
        ?>
        
        <?php if(!empty($file_history)) : $fileName = !$file_tmpName ? "No" : $file_tmpName;   $dr = !$dir ? "No" : $dir; ?>
            <iframe id="d_file" src="<?= base_url() ?>/preview_file/Ingredient Batches/<?= $fileName ?>/<?= $dr?>/" width="100%" height="650px"></iframe>
            <?php else : ?>
            <iframe id="d_file" src="<?= base_url() ?>/fetch_file/Ingredient Batches/invalid/<?= $dir?>/" width="100%" height="650px"></iframe>
        <?php endif ?>
    </div>
</div>