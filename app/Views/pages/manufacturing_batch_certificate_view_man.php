<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-J35T3JYF4D"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-J35T3JYF4D');
</script>

<div class="row">
    <div class="col-12">

        <button onclick="window.print()" class="mb-3 btn btn-primary">Print Certificate</button>
        <?php if ($manuprod):?>
            <table class="table table-striped border-top">
                <tr>
                    <th>Batch ID</th>
                    <td><?= $manuprod[0]->manuf_product_batch ?></td>
                </tr>
                <tr>
                    <th>Product</th>
                    <td><?= $manuprod[0]->formula_rdplan ?></td>
                </tr>

                <tr>
                    <th>Manufactured Date</th>
                    <td><?= $manuprod[0]->manuf_product_date ?></td>
                </tr>
                <tr>
                    <th>Batch Creator</th>
                    <td><?= $manuprod[0]->user_first_name?> <?= $manuprod[0]->user_last_name ?> </td>
                </tr>
                <tr>
                    <th>Qty</th>
                    <td><?= $manuprod[0]->manuf_product_qty ?>g</td>
                </tr>
            </table>
        <?php endif; ?>
        <br><br>
        
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Ingredient</th>
                    <th>Supplier</th>
                    <th>Batch #</td>
                    <th>Qty (g)</th>
                </tr>
            </thead>
            <?php if ($manuprodIng):?>
                <?php foreach ($manuprodIng as $data) : 
                    ?>
                    <tr>
                        <td><?= $data['ingredient_name']; ?></td>
                        <td><?= $data['ingredient_batch_supplier_id']; ?></td>
                        <td><?= $data['ingredient_batch_no']; ?></td>
                        <td><?= $data['manuf_production_batch_qty']; ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <th colspan="4"><center><h5>No Batch Selected in Manufacturing Production</h5></center></th>
            <?php endif; ?>
        </table>
    </div>  
</div>

<script>

  // Table 

    // $(document).ready(function() {
    //   $('#example1').DataTable( {
    //     "paging":   false,
    //     "autowidth": true,
    //     "responsive": true,
    //   });

    //   $('#example2').DataTable( {
    //     "paging":   false,
    //     "autowidth": true,
    //     "responsive": true,
    //   });
    // });
</script>