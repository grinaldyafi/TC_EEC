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
            <div class="text-white">
                <!--Team Info  </*?= $status['team_id']; ?>  --> 
                <br />
                Team Name : <?= $team_header['team_name']; ?>  
                <br />
                Asal Kampus : <?= $team_header['institusi']; ?>  
                <br />
                Email : <?= $team_header['email']; ?>  
                <br />
                Anggota Team: 
                <br />
                <?php 
                    $count = 1;
                    // print_r($team_member);
                    foreach($team_member as $data){
                        echo $count.'. ';
                        echo $data['name'];
                        echo '<br />';
                        $count++;
                    }
                ?>
                <br />
                <br />
                Quiz status: <br />
                - start at: 15:00  <br />
                - status:  <!--</*?php echo ($status['team_id']) ?  'finished' : 'disabled'; ?>--><br />
            </div>
            <div class="input-group mb-3 center">
                <a href="/penyisihan"><button class="tombol btn btn-outline-dark" type="submit" style="width: 100%" > START</button></a>
                <a href="/"><button class="tombol btn btn-outline-dark" type="submit" style="width: 100%;  background-color:grey;"> BACK </button></a>
            </div>
        </div>
    </div>
</body>

</html>