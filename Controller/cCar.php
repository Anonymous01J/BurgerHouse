<?php
class CCar {
    
    public function handleRequest() {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['action']) && $_POST['action'] === 'remove') {
                $this->removeFromCart();
            } else {
                $this->addToCart();
            }
        } else {
            echo '<script>alert(" Método no permitido")';
        }
    }

    private function addToCart() {
        // Verificar si se enviaron los datos del producto
        if (isset($_POST['id'], $_POST['name'], $_POST['price'], $_POST['quantity'])) {
            $productId = $_POST['id'];
            $productName = $_POST['name'];
            $productPrice = $_POST['price'];
            $productQuantity = $_POST['quantity'];

            // Crear un array para el producto
            $product = [
                'id' => $productId,
                'name' => $productName,
                'price' => $productPrice,
                'quantity' => $productQuantity
            ];

            // Verificar si ya existe un carrito en la sesión
            if (!isset($_SESSION['cart'])) {
                $_SESSION['cart'] = [];
            }

            // Agregar el producto al carrito
            $_SESSION['cart'][] = $product;

            echo "<script>alert('Producto añadido al carrito'); window.location.href=document.referrer;</script>";
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
                    // Reindexar el array
                    $_SESSION['cart'] = array_values($_SESSION['cart']);
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
$controller = new CCar();
$controller->handleRequest();
?>