<?php
class CCart {
    
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['action'])) {
                if ($_POST['action'] === 'remove') {
                    $this->removeFromCart();
                } elseif ($_POST['action'] === 'clear') {
                    $this->clearCart();
                }
            } elseif (isset($_POST['drinks'])) {
                $this->addDrinksToCart();
            } else {
                $this->addToCart();
            }
        }
    }

    private function addToCart() {
        if (isset($_POST['id'], $_POST['name'], $_POST['price'], $_POST['quantity'])) {
            $productId = $_POST['id'];
            $productName = $_POST['name'];
            $productPrice = $_POST['price'];
            $productQuantity = $_POST['quantity'];
            $productDetails = $_POST['details'] ?? '';
            $productExtras = $_POST['extras'] ?? [];

            $product = [
                'id' => $productId,
                'name' => $productName,
                'price' => $productPrice,
                'quantity' => $productQuantity,
                'details' => $productDetails,
                'extras' => $productExtras
            ];

            if (!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }

            $_SESSION['cart'][] = $product;

            header("Location: " . $_SERVER['HTTP_REFERER'] . "?cart=open");
            exit;
        } else {
            echo "<script>alert('Datos del producto incompletos'); window.location.href=document.referrer;</script>";
        }
    }

    private function addDrinksToCart() {
        if (isset($_POST['drinks'], $_POST['drinkQuantity'], $_POST['drinkPrice'])) {
            $drinks = $_POST['drinks'];
            $quantities = $_POST['drinkQuantity'];
            $prices = $_POST['drinkPrice'];

            foreach ($drinks as $drink) {
                if (!empty($quantities[$drink]) && isset($prices[$drink])) {
                    $price = floatval($prices[$drink]);
                    $quantity = intval($quantities[$drink]);

                    $product = [
                        'id' => uniqid('drink_'), // Generar un ID único para cada bebida
                        'name' => $drink,
                        'price' => $price,
                        'quantity' => $quantity,
                        'details' => 'Bebida',
                        'extras' => []
                    ];

                    if (!isset($_SESSION['cart'])) {
                        $_SESSION['cart'] = [];
                    }

                    $_SESSION['cart'][] = $product;
                }
            }

            header("Location: " . $_SERVER['HTTP_REFERER'] . "?cart=open");
            exit;
        } else {
            echo "<script>alert('No se seleccionaron bebidas'); window.location.href=document.referrer;</script>";
        }
    }

    private function removeFromCart() {
        if (isset($_POST['position'])) {
            $position = $_POST['position'];

            if (isset($_SESSION['cart'])) {
                if (isset($_SESSION['cart'][$position])) {
                    unset($_SESSION['cart'][$position]);
                    echo "<script>alert('Producto eliminado del carrito'); window.location.href=document.referrer;</script>";
                    return;
                }
            }

            echo "<script>alert('Posición no encontrada en el carrito'); window.location.href=document.referrer;</script>";
        } else {
            echo "<script>alert('Posición del producto no proporcionada'); window.location.href=document.referrer;</script>";
        }
    }

    private function clearCart() {
        unset($_SESSION['cart']);
        echo "<script>alert('Carrito vaciado'); window.location.href=document.referrer;</script>";
    }
}

// Crear una instancia del controlador y manejar la solicitud
$controller = new CCart();
$controller->handleRequest();
?>