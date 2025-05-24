let table = $('.table-order-domicilio-pendientes').DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
});

let table2 = $('.table-order-domicilio-procesadas').DataTable({
    language: {
        url: './assets/libs/extra-libs/datatables.net/js/es-Es.json'
    },
    "dom": 'tipr',
    "paging": true,
    "info": true,
});

$('#searchBoxDomicilioPending').on('keyup', function () {
    table.search(this.value).draw();
});
$('#searchBoxDomicilioProcesadas').on('keyup', function () {
    table2.search(this.value).draw();
});
document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('#stepper'), {
        linear: true,
        animation: true
    });
});


feather.replace();

const plusTriggers = document.querySelectorAll(".plusTrigger");
plusTriggers.forEach((trigger) => {
  const container = trigger.closest(".counter-container");
  const input = container.querySelector("input");
  const plusBtn = container.querySelector(".plusBtn");
  const minusBtn = container.querySelector(".minusBtn");

  let counter = 0;

  trigger.addEventListener("click", () => {
    if (counter === 0) {
      counter = 1;
      input.value = counter;
    }
    container.classList.add("active");
    container.style.width = "110px"
  });

  plusBtn.addEventListener("click", () => {
    counter++;
    input.value = counter;
  });

  minusBtn.addEventListener("click", () => {
    counter--;
    if (counter >= 1) {
      input.value = counter;
    } else {
      counter = 0;
      input.value = counter;
      container.classList.remove("active");
        container.style.width = ""
    }
  });
});

