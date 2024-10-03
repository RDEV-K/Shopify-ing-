<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use Stripe\Stripe;
use Stripe\PaymentIntent;

class Payment extends Controller
{
    public function index()
    {
        return view('pages/payment_view'); // Load the payment view
    }

    public function charge()
    {
        // Set your secret key. Remember to switch to your live secret key in production!
        // You can find your API keys in your Stripe dashboard.
        Stripe::setApiKey('sk_test_51Q45jOFhRoQfO4rWqUlR2imo2XGJ1Xp48QhF6IJWJLgdVxpckjoEVtHq7pmQJspZFoJogZoQCQ7G60ylKfWo1jL100wcJLICcD'); // Replace with your actual secret key

        // Get the payment method ID from the request
        $data = $this->request->getJSON(); // Use this to get the JSON body
        $paymentMethodId = $data->paymentMethodId; // Access the paymentMethodId

        // $paymentMethodId = $this->request->getPost('paymentMethodId');
        // return $this->response->setJson(['info' => $paymentMethodId]);
        try {
            // Create a PaymentIntent
            $paymentIntent = PaymentIntent::create([
                'amount' => 1000, // Amount in cents (e.g., $10.00)
                'currency' => 'usd', // Currency
                'payment_method' => $paymentMethodId,
                'confirm' => true, // Automatically confirm the payment
                'return_url' => base_url('payment/success'),
            ]);

        return $this->response->setJSON(['success' => true, 'paymentIntent' => $paymentIntent]);

        } catch (\Stripe\Exception\CardException $e) {
            // Handle card errors
            return $this->response->setStatusCode(400)->setJSON(['error' => $e->getError()->message]);
        } catch (\Exception $e) {
            // Handle other errors
            return $this->response->setStatusCode(500)->setJSON(['error' => $e->getMessage()]);
        }
    }

    public function success()
    {
        // Handle the successful payment here (e.g., show a success message)
        return view('pages/payment_success'); // Create a view for payment success
    }
}
