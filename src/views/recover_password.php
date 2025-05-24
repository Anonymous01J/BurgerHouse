<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/img/favicon.png">
    <title>Recuperar Contraseña</title>
    <link href="./assets/css/style.css" rel="stylesheet">
    <link href="./assets/css/stylesPerson.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/libs/libs/sweetalert/sweetalert2.min.css">
    <script src="./assets/libs/libs/sweetalert/sweetalert2.all.min.js"></script>
</head>

<body>
    <div class="main-wrapper">

        <?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>

        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style="background:url(./assets/img/big/auth-bg.jpg) no-repeat center center;">
            <div class="auth-box row w-75">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(./assets/img/big/banner_recuperarPass.png);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="py-3">
                        <div class="text-center mt-4">
                            <img src="./assets/img/bh_logo.png" alt="wrapkit" width="70">
                        </div>
                        <h3 class="mt-3 text-center">Cambiar Contraseña</h3>
                        <!-- Contenedor del formulario multi‑pasos -->
                        <div class="container-form">
                            <!-- Único formulario que contiene todos los pasos -->
                            <form autocomplete="off" class="steps">
                                <!-- Paso 1 -->
                                <div class="stepes" id="step1">
                                    <div class="form-group mt-5 mb-3">
                                        <label class="form-label text-dark" for="uname">Correo Electrónico</label>
                                        <input class="form-control" autocomplete="off" id="email" type="email" placeholder="Correo Electrónico" style="width: 33% !important">
                                    </div>
                                    <button type="button" class="btn text-white bh_1 next" data-validate="email" style="margin-left: 6rem;">Siguiente</button>
                                </div>
                                <!-- Paso 2 -->
                                <div class="stepes" id="step2">
                                    <!-- Contenido estilo "form-card" -->
                                    <div class="form-card">
                                        <p class="form-card-title">Hemos enviado un código a tu correo</p>
                                        <p class="form-card-prompt">Ingresa el código de 4 dígitos que recibiste</p>
                                        <div class="form-card-input-wrapper">
                                            <input class="form-card-input" placeholder="____" maxlength="4" type="tel" id="token">
                                            <div class="form-card-input-bg"></div>
                                        </div>
                                        <div class="call-again d-flex justify-content-center align-items-center gap-2">
                                            <button type="button" class="bg-transparent border-0 underline" disabled>Reenviar código</button>
                                            <p class="m-0">en 150 segundos</p>
                                        </div>
                                    </div>
                                    <div class="btn-container">
                                        <button type="button" class="btn text-white bh_5 back">Regresar</button>
                                        <button type="button" class="btn text-white bh_1 next" data-validate="token">Siguiente</button>
                                    </div>
                                </div>
                                <!-- Paso 3 -->
                                <div class="stepes form_new_pass" id="step3">
                                    <div class="form-group mb-3 mt-3">
                                        <label class="form-label text-dark" for="confirm">Nueva Contraseña</label>
                                        <input class="form-control" autocomplete="new-password" id="password" type="password" placeholder="Contraseña" style="width: 33% !important" name="password">
                                        <div class="text-danger mt-1 fs-6" id="error-password"></div>

                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="form-label text-dark" for="confirm">Confirmar Contraseña</label>
                                        <input class="form-control" autocomplete="new-password" id="confirm" type="password" placeholder="Confirmar Contraseña" style="width: 33% !important" name="confirm">
                                        <div class="text-danger mt-1 fs-6" id="error-confirm"></div>

                                    </div>
                                    <div class="btn-container">
                                        <button type="button" class="btn text-white bh_5 back">Regresar</button>
                                        <button type="button" class="btn text-white bh_1 btn_update_user">Enviar</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



        </div>


        <script src="./assets/libs/libs/jquery/dist/jquery.min.js "></script>
        <script src="./assets/libs/libs/popper.js/dist/umd/popper.min.js "></script>
        <script src="./assets/libs/libs/bootstrap/dist/js/bootstrap.min.js "></script>
        <script src="./assets/libs/libs/validatejs/validate.min.js"></script>
        <script type="module" src="./assets/js/pages/recover-password/recover-password.js"></script>

</body>

</html>