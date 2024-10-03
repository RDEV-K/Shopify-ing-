<div class="container">
    <table id="view-cart" class="display text-center nowrap mt-3">
        <thead>
            <tr>
                <th>Title</th>
                <th>Variants</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Qty</th>
            </tr>
        </thead>
        <tbody>
            <?php $index = 0; ?>
            <?php if($items): ?>
                <?php foreach ($items as $item): ?>
                    <tr>
                        <td class="title"><?php echo $item['productTitle']; ?></td>
                        <td class="size"><?php echo $item['variantTitle']; ?></td>
                        <td class="price" id="price<?=$index ?>"><?php echo $item['price']['amount']; ?></td>
                        <td class="totalPrice" id="totalPrice<?=$index ?>"><?php echo (float)$item['price']['amount'] * (float)$item['quantity']; ?></td>
                        <td style="width: 70px;">
                            <input type="number" class="form-control qty" id="qty<?=$index ?>" value="<?=$item['quantity'] ?>">
                            <input type="hidden" class="stock-qty" value="<?=$item['stockQty'] ?>">
                            <input type="hidden" class="id" value="<?=$item['variantId'] ?>">
                        </td>
                    </tr>
                    <?php $index++; ?>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
        <tfoot>
            <tr>
                <th>Title</th>
                <th>Variants</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Qty</th>
            </tr>
        </tfoot>
    </table>
    <div class="modal-footer">
        <a class="btn btn-success" href="<?=base_url() ?>/checkout">Checkout</a>
    </div>
</div>


<script>
    $(document).ready(function() {
        var table = $('#view-cart').DataTable({
            "paging": false,
            "autowidth": true,
            "responsive": true,
            "order": [[0, "desc"]],
        });
        $('#view-cart').on('input', '.qty', function() {
            var quantity = parseInt($(this).val(), 10);
            var stock_qty = $(this).closest('tr').find('.stock-qty').val();
            var id = $(this).closest('tr').find('.id').val();
            var inputId = $(this).attr('id');
            var index = inputId.slice(3);
            var price = $('#price'+index).text();
            
            console.log(price);
            
            // Check if the quantity is less than 1
            if (quantity < 1 || isNaN(quantity)) {
                $(this).val(1); // Set it to 1
                quantity = 1;
            }
            if(quantity > stock_qty) {
                $(this).val(stock_qty);
                quantity = stock_qty;
            }

            data = {
                'id': id,
                'quantity': quantity,
            };
            $.ajax({
                url: '<?= base_url() ?>/manufacturing/ingredients_quantity_edit', // Replace with your controller URL
                type: 'POST',
                data: data,
                success: function(response) {
                    // Use the response data
                    console.log('Data sent successfully:', response);

                    // Example: Update the UI based on the response
                    if (response.success) {
                        // Show a success message
                        var total = parseFloat(price) * parseFloat(quantity);
                        
                        console.log(total, typeof(total));
                        
                        $('#totalPrice'+index).text(total.toFixed(2));
                    } else {
                        // Handle any errors returned by the server
                        alert('Error: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error sending data:', error);
                    alert('An error occurred while adding to cart.');
                }
            });
        
        });
    })
</script>