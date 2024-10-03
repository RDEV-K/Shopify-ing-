<a id="checking-cart" onclick="cartShow()">
    <div class="text-end" id="add-cart">
        <i class="fa-solid fa-cart-shopping icon"></i>
        <span class="number"><?= $totalQty ?></span>
    </div>
</a>

<div class="modal fade" id="cart-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Your Cart</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                
            </div>
        </div>
    </div>
</div>

<script>
    var root = '<?= base_url() ?>'
    function cartShow(formula_id = null) {
        $("#cart-modal .modal-body").load(root + "/manufacturing/ingredients_cart_view");
        var cartModal = new bootstrap.Modal(document.querySelector("#cart-modal"));
        cartModal.show();
    }
</script>

<style>
    .cart {
        display: flex;
        align-items: center; /* Aligns items vertically */
    }

    .icon {
        font-size: 24px;
        margin-right: 5px; /* Adjust spacing */
    }

    .number {
        font-size: 20px; /* Adjust size */
    }
    #checking-cart {
        position: relative;
    }
    #checking-cart:hover {
        cursor: pointer;
    }

    #add-cart {
        top: 0px;
        background-color: #555;
        position: absolute;
        left: -62px;
        transition: 0.3s;
        padding: 15px;
        width: 100px;
        text-decoration: none;
        font-size: 20px;
        color: white;
        border-radius: 0 5px 5px 0;
        z-index: 1;
    }
    #add-cart:hover {
        left: 0;
    }
</style>