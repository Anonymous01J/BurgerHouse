const formData = new FormData();
formData.append("nombre", "Luidas");
formData.append("mensaje", "Hola desde AJAX");

fetch("home/index", {
  method: "POST",
  headers: {
    "X-Requested-With": "XMLHttpRequest" // No incluyas "Content-Type", ya que FormData lo establece automáticamente
  },
  body: formData // Enviar los datos como FormData
})
  .then(response => response.text())
  .then(data => console.log(data))
  .catch(error => console.error("Error en la petición AJAX:", error));