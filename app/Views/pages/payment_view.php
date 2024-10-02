<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://js.stripe.com/v3/"></script>

    <title>Payment Page</title>
</head>
<body>
    <h1>Payment Page</h1>
    <!-- <form id="payment-form" action="<?= base_url('payment/charge') ?>" method="POST">
        <input type="text" name="card_number" placeholder="Card Number" required>
        <input type="text" name="card_expiry" placeholder="MM/YY" required>
        <input type="text" name="card_cvc" placeholder="CVC" required>
        <input type="text" name="postal_code" placeholder="Postal Code" required>
        <button type="submit">Pay</button>
    </form> -->
    <form id="payment-form">
        <div id="card-element"><!-- A Stripe Element will be inserted here. --></div>
        <button id="submit">Pay</button>
        <div id="payment-result"></div>
    </form>

</body>
</html>

<script>
    // Initialize Stripe with your public key
    const stripe = Stripe('pk_test_51Q45jOFhRoQfO4rWx7Nv9q75k12pD1giWE0b8GPInAy7xp6pgjjDRXi9Inlt6uJMYqGtJaOgr8adVrSOpZBJ6Cok00CKiswd9w'); // Replace with your actual public key
    const elements = stripe.elements();

    // Create an instance of the card Element
    const cardElement = elements.create('card');
    cardElement.mount('#card-element');

    // Handle form submission
    const form = document.getElementById('payment-form');
    form.addEventListener('submit', async (event) => {
        event.preventDefault();

        // Create a token using the card details
        const { paymentMethod, error } = await stripe.createPaymentMethod({
            type: 'card',
            card: cardElement,
        });
        // const { token, error } = await stripe.createToken(cardElement);
        
        if (error) {
            // Display error message
            document.getElementById('payment-result').innerText = error.message;
        } else {
            // Send the token to your server
            console.log('Payment Method ID:', paymentMethod.id);
            const response = await fetch('<?= base_url('payment/charge') ?>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ paymentMethodId: paymentMethod.id }),
            });

            const result = await response.json();
            console.log(result);
            
            if (result.error) {
                // Show error from server
                document.getElementById('payment-result').innerText = result.error;
            } else {
            // Check the payment intent status
            console.log(result);
            
                if (result.paymentIntent.status === 'succeeded') {
                    // Payment was successful
                    window.location.href = '<?= base_url()?>/payment/success'; // Redirect to success page
                } else if (result.paymentIntent.status === 'requires_action') {
                    // Payment requires further action
                    window.location.href = result.paymentIntent.next_action.redirect_to_url.url;
                } else {
                    // Handle other statuses as needed
                    document.getElementById('payment-result').innerText = 'Payment status: ' + result.paymentIntent.status;
                }
            }
        }
    });

</script>

