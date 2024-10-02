<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="row">
    <div class="col-lg-12">
        <table id="example1" class="table table-striped border-top">
            <tr>
                <th>ID</th>
                <td><?php echo $ingredient[0]->ingredient_id; ?></td>
            </tr>
            <tr>
                <th>Ingredient</th>
                <td><?php echo $ingredient[0]->ingredient_name; ?></td>
            </tr>
            <tr>
                <th>INCI</th>
                <td><?php echo $ingredient[0]->ingredient_inci; ?></td>
            </tr>
            <tr>
                <th>Category</th>
                <td><?php echo $ingredient[0]->ingredient_category; ?></td>
            </tr>
            <tr>
                <th>Qty</th>
                <td><?php echo $ingredient[0]->ingredient_qty; ?>g</td>
            </tr>
        </table>
    </div>
</div>

<div class="row mt-5">
    <div class="col">
        <h5>Ingredient Batches</h5>
        <table id="example2 mt-3" class="table table-striped">
            <thead>
                <th>Batch #</th>
                <th>Supplier</th>
                <th>Expiry</th>
                <th>Status</th>
            </thead>
            <tbody>
            <?php if($batchs) : 
                    foreach($batchs as $batch):     
                ?>
                    <tr>
                        <td><?=$batch->ingredient_batch_no ?></td>
                        <td><?=$batch->ingredient_batch_supplier_id ?></td>
                        <td><?=$batch->ingredient_batch_expiry ?></td>
                        <td><?php
                                $now = date('Y-m-d H:i:s');
                                $exp = date('Y-m-d H:i:s', strtotime($batch->ingredient_batch_expiry));
                                echo strtotime($now) < strtotime($exp) ? "<strong class='text-success'> <i class='fa fa-check-circle-o'></i> Active</strong>" : "<strong class='text-danger'> <i class='fa fa-times-circle-o'></i> Expired</strong>";
                            ?>
                        </td>
                    </tr>  
                <?php endforeach; endif?>

            </tbody>
        </table>
    </div>
</div>


<script>
    // Table
    $(document).ready(function() {
        $('#example1').DataTable( {
            "paging":   false,
            "autowidth": true,
            "responsive": true,
            "order": [[ 1, "asc" ]],
        } );
    } );
</script>
