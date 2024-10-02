<div class="container">
    <?php if ($ingredient): ?>
        <div class="col-lg-12 text-center h3 lead">
            <?= $ingredient['body_html'] ?>
        </div>
        <div class="col-lg-12">
            <table id="import" class="display text-center nowrap mt-3">
                <thead>
                    <tr>
                        <th>Size</th>
                        <th>In Stock</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Options</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($ingredient['variants'] as $variant): ?>
                        <tr>
                            <td class="size"><?php echo $variant['title']; ?></td>
                            <td class="stock-qty"><?php echo $variant['inventory_quantity']; ?></td>
                            <td class="price"><?php echo $variant['price']; ?></td>
                            <td style="width: 70px;"><input type="number" class="form-control qty" id="numberInput" name="numberInput" min=1></td>
                            <td>
                                <button class="btn btn-success btn-sm add-cart">Add Cart</button>
                                <input type="hidden" class="id" value=<?=$variant['id'] ?>>
                                <input type="hidden" class="admin_graphql_api_id" value=<?=$variant['admin_graphql_api_id'] ?>>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Size</th>
                        <th>In Stock</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Options</th>
                    </tr>
                </tfoot>
            </table>
        </div>
    <?php else: ?>
        <div class="text-center display-3 lead">
            Not Available
        </div>
    <?php endif; ?>
</div>


<script>
    $(document).ready(function() {
        var table = $('#import').DataTable({
            "paging": false,
            "autowidth": true,
            "responsive": true,
            "order": [[0, "desc"]],
        });
        $('#import').on('click', '.add-cart', function() {
            var quantity = $(this).closest('tr').find('.qty').val();
            var size = $(this).closest('tr').find('.size').text();
            var stock_qty = $(this).closest('tr').find('.stock-qty').text();
            var price = $(this).closest('tr').find('.price').text();
            var id = $(this).closest('tr').find('.id').val();
            var admin_graphql_api_id = $(this).closest('tr').find('.admin_graphql_api_id').val();
            var title = '<?= $ingredient['title'] ?>';
            if(quantity < 0) {
                quantity = 0;
            }
            var data = {
                'title': title,
                'id': id,
                'admin_graphql_api_id': admin_graphql_api_id,
                'size': size,
                'price': price,
                'stock_qty': stock_qty,
                'quantity': quantity
            };
            // Log or use the values as needed
            console.log(data);
            if (quantity === '') {
                alert('Quantity field cannot be empty!');
                $(this).val(''); // Optionally, clear the input
                return; // Exit the function early
            }

            $.ajax({
                url: '<?= base_url() ?>/manufacturing/ingredients_add_cart', // Replace with your controller URL
                type: 'POST',
                data: data,
                success: function(response) {
                    // Use the response data
                    console.log('Data sent successfully:', response);

                    // Example: Update the UI based on the response
                    if (response.success) {
                        // Show a success message
                        alert('Item added to cart successfully!');
                        // location.reload();
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

<style>
     /* Prevent overlay of dropdown */
     .dataTables_length {
        display: inline-block;
        margin-right: 20px;
    }

    .dataTables_length select {
        width: auto;
        min-width: 60px;
    }

    /* Remove black square on hover */
    .dataTables_paginate .paginate_button:hover {
        background: transparent;
        color: inherit;
    }
</style>