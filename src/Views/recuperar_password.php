<!DOCTYPE html>
<html dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Recuperar Contraseña</title>
    <link href="../dist/css/style.css" rel="stylesheet">

</head>

<body>
    <div class="main-wrapper">
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>

        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style="background:url(../assets/images/big/auth-bg.jpg) no-repeat center center;">


            <div class="auth-box row">
                <div class="col-lg-7 col-md-5 modal-bg-img" style="background-image: url(../assets/images/big/banner_recuperarPass.png);">
                </div>
                <div class="col-lg-5 col-md-7 bg-white">
                    <div class="p-3">
                        <div class="text-center">
                            <img class="" src="../assets/images/bh_logo.png" alt="wrapkit" width="70">
                        </div>
                        <h3 class="mt-3 text-center">Cambiar Contraseña</h2>
                        <form class="mt-4">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Correo Electronico</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Correo Electronico">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Semilla de recuperación</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Semilla de recuperación">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group mb-3">
                                        <label class="form-label text-dark" for="uname">Nueva Contraseña</label>
                                        <input class="form-control" id="uname" type="text"
                                            placeholder="Contraseña">
                                    </div>
                                </div>
                
                                <div class="col-lg-12 text-center mt-2">
                                    <button type="button" class="btn w-100 btn-dark">Cambiar</button>
                                </div>

                                <div class="col-lg-12 text-center mt-4">
                                    <a href="../Views/login.php" class="btn w-100 btn-warning btn_regresar">Regresar</a>
                                </div>
        
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>
      
   
    <script src="../assets/libs/jquery/dist/jquery.min.js "></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../assets/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js "></script>
 
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>

</html>