export default function Templates() {

    function targetCombo(objet){ 
       return `
        <div class="col">
            <div class="card">
                <img src="${objet.img ? objet.img : "./assets/img/big/banner_login.png"}" class="card-img-top" alt="..." style="object-fit: cover; height: 140px">
                <div class="card-body">
                    <h5 class="card-title">${objet.nombre}</h5>
                    <p class=" fs-6 truncate-3-lines">${objet.detalles}</p>
                </div>
                <div class="card-footer">
                    <small class="text-body-secondary">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <p class="mb-0">Precio: ${objet.precio}$</p>
                            <div class="d-flex gap-3">
                                <a class="link-secondary edit_btn" data-id="${objet.id}" data-module="combo" style="cursor: pointer">
                                    <i data-feather="edit"></i>
                                </a>
                                <a class="link-secondary trash_btn" data-id="${objet.id}" data-module="combo" style="cursor: pointer">
                                    <i data-feather="trash-2"></i>
                                </a>
                            </div>
                        </div>
                    </small>
                </div>
            </div>
        </div>
        `
    }


    return {targetCombo}
}