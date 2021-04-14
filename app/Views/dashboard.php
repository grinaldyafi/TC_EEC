<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="TC Button">
    <meta name="author" content="TC Button">
    <!-- Icon -->
    <!-- <link rel="icon" href="img/logo.png"> -->
 
    <!--  CSS -->
    <link rel="stylesheet" href="libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="index.css">
    
    <title>EEC</title>
</head>
<body>
    <!-- header -->
    <div class="container header">
        <div class="row"> 
            <div class="col-md-12">
                <div class="logo">
                    <img src="./images/LOGO.png" alt="">
                    <div class="title">EEC Menu</div>
                </div>
                <div style="float: right;" id="namaku"> </div>
            </div>
        </div>
    </div>

    <!-- content -->
    <div class="container content"> 
        <div id="input_name" class="col-md-6 center">
            <div class="input-group mb-3 center">
                <a href="/profile"><button class="tombol btn btn-outline-dark" type="button" style="width: 100%" > Penyisihan </button></a>
                <button class="tombol btn btn-outline-dark" type="button" style="width: 100%" disabled> Semifinal </button>
                <button class="tombol btn btn-outline-dark" type="button" style="width: 100%" disabled> Final </button>
                <a href="/logout"><button class="btn btn-danger" type="button" style="width: 100%"> Logout </button></a>
            </div>
        </div>
    </div>
</body>

</html>