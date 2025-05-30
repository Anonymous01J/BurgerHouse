<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/img/favicon.png">
    <title>Iniciar Sesión</title>
    <link href="./assets/css/style.css" rel="stylesheet">
    <link href="./assets/css/stylesPerson.css" rel="stylesheet">
    <script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>

</head>

<body>
    <div class="main-wrapper">
        <?php include_once __DIR__ . '/../Views/Components/preloader.php' ?>


        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative overflow-hidden"
            style="background:url(./assets/img/big/auth-bg.jpg) no-repeat center center;">

            <div class="auth-box row login_page">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(./assets/img/big/banner_login.png);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="p-3">
                        <div class="text-center">
                            <img src="./assets/img/bh_logo.png" alt="wrapkit" width="70">
                        </div>
                        <h2 class="mt-3 text-center">Ingresar</h2>
                        <p class="text-center">Ingrese su dirección de correo electrónico y contraseña para acceder al panel de administración.</p>
                        <form  id="login_form" autocomplete="off" class="mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Correo</label>
                                        <input autocomplete="off" class="form-control" id="login_correo" type="email"
                                            placeholder="Ingrese su correo electronico">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="pwd">Contraseña</label>
                                        <input autocomplete="new-password" class="form-control" id="login_password" type="password"
                                            placeholder="ingrese su contraseña">
                                    </div>
                                </div>
                                <div class="col-lg-12 d-flex justify-content-center mb-3">
                                    <div class="cf-turnstile" data-sitekey="0x4AAAAAABDYzFakhjOmzEUX" data-theme="light" data-lenguage="es"></div>
                                <div class="col-lg-12 text-center">
                                    <button type="button" class="btn w-100 btn-dark btn_login_1">Ingresar</button>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    <a href="Changepass" class="text-info">¿Olvidaste tu contraseña?</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="auth-box row hide2 captcha_page">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(./assets/img/big/banner_captcha.png);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="p-3">
                        <div class="text-center">
                            <img src="./assets/img/bh_logo.png" alt="wrapkit" width="70">
                        </div>
                        <h2 class="mt-3 text-center">Verificar</h2>
                        <p class="text-center">Ingrese el codido de verificación</p>
                        <form class="mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Img</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="enter your username">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="pwd">Codigo</label>
                                        <input class="form-control" id="pwd" type="password"
                                            placeholder="enter your password">
                                    </div>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="submit" class="btn w-100 btn-dark">Ingresar</button>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    <a href="Changepass" class="text-info">¿Olvidaste tu contraseña?</a>
                                    <button type="button" class="btn w-100 btn-warning btn_regresar">Regresar</button>
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
    <script src="./assets/js/pages/login/login.js"></script>


    <script>
        $(".preloader ").fadeOut();
    </script>
</body>

</html>

