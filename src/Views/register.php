<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Registrarse</title>
    <link href="../dist/css/style.css" rel="stylesheet">

</head>

<body>
    <div class="main-wrapper">

        <?php require_once('./Components/preloader.php'); ?>

        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style="background:url(../assets/images/big/auth-bg.jpg) no-repeat center center;">


            <div class="auth-box row">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(../assets/images/big/banner_register.png);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="p-3">
                        <div class="text-center">
                            <img class="" src="../assets/images/bh_logo.png" alt="wrapkit" width="70">
                        </div>
                        <h2 class="mt-3 text-center">Regístrate</h2>
                        <form class="mt-4">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Nombre</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Nombre">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Apellido</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Apellido">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Correo Electronico</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Correo Electronico">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Contraseña</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Contraseña">
                                    </div>
                                </div>
                                <div class="col-lg-12 text-center mt-2">
                                    <button type="button" class="btn w-100 btn-dark">Registrarse</button>
                                </div>
                                <div class="col-lg-12 text-center mt-4">
                                    ¿Ya tienes una cuenta? <a href="../Views/login.php" class="text-danger">Inicia sesión</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="../assets/libs/jquery/dist/jquery.min.js "></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js "></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>

</html>