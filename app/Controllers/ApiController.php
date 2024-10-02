<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use GuzzleHttp\Client;

class ApiController extends Controller {

    private $api_token;
    private $store_front_api_token;
    private $store_url;
    private $store_front_url;

    public function __construct() {
        // Initialize the properties in the constructor
        $this->api_token = getenv('TEST_SHOPIFY_API_TOKEN');
        $this->store_url = getenv('TEST_SHOPIFY_STORE_URL'); // Fixed typo in variable name
        $this->store_front_url = getenv('TEST_SHOPIFY_STORE_FRONT_URL'); // Fixed typo in variable name
        $this->store_front_api_token = getenv('TEST_SHOPIFY_STORE_FRONT_API_TOKEN'); // Fixed typo in variable name
    }

    public function fetchProducts() {

        $client = new Client();

        try {
            $response = $client->request('GET', $this->store_url . 'products.json', [
                'headers' => [
                    'X-Shopify-Access-Token' => $this->api_token, // Use your access token here
                    'Content-Type' => 'application/json',
                ]
            ]);

            $data = json_decode($response->getBody(), true);
            return $data['products']; // Adjust based on response structure
        } catch (Exception $e) {
            echo 'Error fetching products: ' . $e->getMessage();
        }
    }

    public function fetchProductById($id) {
        $client = new Client();
        
        try {
            $response = $client->request('GET', $this->store_url . 'products/' . $id . '.json', [
                'headers' => [
                    'X-Shopify-Access-Token' => $this->api_token, // Use your access token here
                    'Content-Type' => 'application/json',
                ]
            ]);
            $data = json_decode($response->getBody(), true);
            return $data['product']; // Adjust based on response structure
        } catch (Exception $e) {
            echo 'Error fetching products: ' . $e->getMessage();
        }
    }

    public function createCart($id, $qty) {
        $client = new Client();

        // Storefront API endpoint for GraphQL requests
        $url = $this->store_front_url . 'graphql.json'; // Replace with your store's URL
        
        // Storefront API access token (from your screenshot)
        $storefrontApiToken = $this->store_front_api_token; 
        $productVariantId = $id;
        $quantity = $qty;
        // The GraphQL mutation to add an item to the cart
        $query = <<<GRAPHQL
        mutation {
        cartCreate(input: {
            lines: [
            {
                quantity: $quantity
                merchandiseId: "gid://shopify/ProductVariant/$productVariantId"
            }
            ]
        }) {
            cart {
            id
            checkoutUrl
            lines(first: 5) {
                edges {
                node {
                    quantity
                    merchandise {
                    ... on ProductVariant {
                        id
                        title
                    }
                    }
                }
                }
            }
            }
        }
        }
        GRAPHQL;

        try {
            // Send the GraphQL POST request
            $response = $client->post($url, [
                'headers' => [
                    'X-Shopify-Storefront-Access-Token' => $storefrontApiToken,
                    'Content-Type' => 'application/json'
                ],
                'json' => ['query' => $query]
            ]);
    
            // Parse the response
            $responseBody = json_decode($response->getBody()->getContents(), true);
            return $responseBody;
        } catch (\Exception $e) {
            // Handle errors
            echo 'Error: ' . $e->getMessage();
        }
    }
    
    public function getCartById($cartId) {
        $client = new Client();
    
        // Storefront API endpoint for GraphQL requests
        $url = $this->store_front_url . 'graphql.json'; // Replace with your store's URL
        
        // Storefront API access token
        $storefrontApiToken = $this->store_front_api_token; 
        
        // The GraphQL query to get cart details by ID
        $query = <<<GRAPHQL
        query {
            cart(id: "$cartId") {
                id
                lines(first: 10) {
                    edges {
                        node {
                            quantity
                            merchandise {
                                ... on ProductVariant {
                                    id
                                    title
                                    priceV2 {
                                        amount
                                        currencyCode
                                    }
                                    product {
                                        id
                                        title
                                        images(first: 1) {
                                            edges {
                                                node {
                                                    src
                                                }
                                            }
                                        }
                                        variants(first: 1) {
                                            edges {
                                                node {
                                                    id
                                                    quantityAvailable
                                                    availableForSale
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        GRAPHQL;
    
        try {
            // Send the GraphQL POST request
            $response = $client->post($url, [
                'headers' => [
                    'X-Shopify-Storefront-Access-Token' => $storefrontApiToken,
                    'Content-Type' => 'application/json'
                ],
                'json' => ['query' => $query]
            ]);
    
            // Parse the response
            $responseBody = json_decode($response->getBody()->getContents(), true);
            return $responseBody;
        } catch (\Exception $e) {
            // Handle errors
            echo 'Error: ' . $e->getMessage();
        }
    }

    public function addToCart($cartId, $productVariantId, $quantity) {
        $client = new Client();
    
        // Storefront API endpoint for GraphQL requests
        $url = $this->store_front_url . 'graphql.json'; // Replace with your store's URL
        
        // Storefront API access token
        $storefrontApiToken = $this->store_front_api_token; 
        
        // The GraphQL mutation to add an item to an existing cart
        $query = <<<GRAPHQL
        mutation {
            cartLinesAdd(cartId: "$cartId", lines: [
                {
                    quantity: $quantity
                    merchandiseId: "gid://shopify/ProductVariant/$productVariantId"
                }
            ]) {
                cart {
                    id
                    lines(first: 5) {
                        edges {
                            node {
                                quantity
                                merchandise {
                                    ... on ProductVariant {
                                        id
                                        title
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        GRAPHQL;
    
        try {
            // Send the GraphQL POST request
            $response = $client->post($url, [
                'headers' => [
                    'X-Shopify-Storefront-Access-Token' => $storefrontApiToken,
                    'Content-Type' => 'application/json'
                ],
                'json' => ['query' => $query]
            ]);
    
            // Parse the response
            $responseBody = json_decode($response->getBody()->getContents(), true);
            return $responseBody;
        } catch (\Exception $e) {
            // Handle errors
            echo 'Error: ' . $e->getMessage();
        }
    }

    public function updateCartLine($cartId, $lineId, $newQuantity) {
        $client = new Client();
    
        // Storefront API endpoint for GraphQL requests
        $url = $this->store_front_url . 'graphql.json'; // Replace with your store's URL
        
        // Storefront API access token
        $storefrontApiToken = 'your_storefront_access_token'; // Replace with your token
        
        // The GraphQL mutation to update the quantity of an item in the cart
        $mutation = <<<GRAPHQL
        mutation {
            cartLinesUpdate(cartId: "$cartId", lines: [
                {
                    id: "$lineId"
                    quantity: $newQuantity
                }
            ]) {
                cart {
                    id
                    lines(first: 10) {
                        edges {
                            node {
                                id
                                quantity
                                merchandise {
                                    ... on ProductVariant {
                                        id
                                        title
                                        priceV2 {
                                            amount
                                            currencyCode
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        GRAPHQL;
    
        try {
            // Send the GraphQL POST request
            $response = $client->post($url, [
                'headers' => [
                    'X-Shopify-Storefront-Access-Token' => $storefrontApiToken,
                    'Content-Type' => 'application/json'
                ],
                'json' => ['query' => $mutation]
            ]);
    
            // Parse the response
            $responseBody = json_decode($response->getBody()->getContents(), true);
            return $responseBody;
        } catch (\Exception $e) {
            // Handle errors
            echo 'Error: ' . $e->getMessage();
        }
    }
}


// $accessToken = json_decode($response->getBody(), true)['access_token'];

// Usage
// $shopifyTest = new ShopifyTest();
// $products = $shopifyTest->fetchProducts();
// print_r($products);
