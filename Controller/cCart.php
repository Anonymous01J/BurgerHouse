<?php
class CCart {
    
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['action']) && $_POST['action'] === 'remove') {
                $this->removeFromCart();
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

    private function removeFromCart() {
        // Verificar si se envió la posición del producto
        if (isset($_POST['position'])) {
            $position = $_POST['position'];
    
            // Verificar si existe un carrito en la sesión
            if (isset($_SESSION['cart'])) {
                if (isset($_SESSION['cart'][$position])) {
                    // Eliminar el producto del carrito basado en la posición
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
}

// Crear una instancia del controlador y manejar la solicitud
$controller = new CCart();
$controller->handleRequest();
?>