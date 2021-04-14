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
                    <div class="title">EEC Penyisihan</div>
                </div>
                <div style="float: right;" id="namaku"> </div>
            </div>
        </div>
    </div>

    <!-- content -->
    <div class="container content"> 
        <div id="input_name" class="col-md-6 center">
            <div class="input-group mb-3 center">
                <form action="/" method="post" >
                    <input type="text" class="form-control" placeholder="Username" id="username" name="username">
                    <br />
                    <input type="text" class="form-control" placeholder="Password" id="password" name="password">
                    <br />
                    <div class="input-group-append" style="width: 100%">
                        <button class="tombol btn btn-outline-dark" type="submit" style="width: 100%"> Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>