fetch("home/index", {
    headers: {
      "X-Requested-With": "XMLHttpRequest"
    }
  })
    .then(response => response.json())
    .then(data => console.log("Respuesta AJAX:", data))
    .catch(error => console.error("Error en la petición AJAX:", error));
  
// alert("Hola mundo");