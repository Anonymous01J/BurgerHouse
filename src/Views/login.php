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
                        <form class="mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Correo</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="enter your username">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="pwd">Contraseña</label>
                                        <input class="form-control" id="pwd" type="password"
                                            placeholder="enter your password">
                                    </div>
                                </div>
                                <div class="col-lg-12 text-center">
                                    <button type="button" class="btn w-100 btn-dark btn_login_1">Ingresar</button>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    <a href="Changepass" class="text-info">¿Olvidaste tu contraseña?</a>
                                </div>
                                <div class="col-lg-12 text-center mt-3">
                                    ¿No tienes una cuenta? <a href="register" class="text-danger">Registrate</a>
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
                                    <button type="button" class="btn w-100 btn-dark">Ingresar</button>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    <button type="button" class="btn w-100 btn-warning btn_regresar">Regresar</button>
                                </div>
                                <div class="col-lg-12 text-center mt-5">
                                    ¿No tienes una cuenta? <a href="register" class="text-danger">Registrate</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="/BurgerHouse/public/assets/libs/libs/jquery/dist/jquery.min.js "></script>
    <script src="/BurgerHouse/public/assets/libs/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="/BurgerHouse/public/assets/libs/libs/bootstrap/dist/js/bootstrap.min.js "></script>
    <script src="/BurgerHouse/public/assets/js/pages/login/login.js"></script>


    <script>
        $(".preloader ").fadeOut();
    </script>
</body>

</html>