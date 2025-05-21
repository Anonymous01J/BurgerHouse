let data = new FormData();
data.append('id_usuario', 11);
data.append('monto_inicial_dolar', 1);
data.append('monto_inicial_bs', 1);
const addCash = async()=>{
    let cash= await fetch('cash/add', {
        method: 'POST',
        body: data
    })
    let response = await cash.json();
    console.log(response);

}
addCash();