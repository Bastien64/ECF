<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <div id="content">
        <link rel="stylesheet" href="stylescriptpage/style2.css" media="screen" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    </div>
    <title>FLOWERBUSINESS</title>
</head>
<body>
    <?php
    session_start();
    ?>
    <?php
    function loadClass(string $class)
    {
        if ($class === "DotEnv") {
            require_once "config/$class.php";
        } else if (str_contains($class, "controller")) {
            require_once "controller/$class.php";
        } else {
            require_once "entity/$class.php";
        }
    }
    spl_autoload_register("loadcLass");
    $franchise = new franchisecontroller();
    $franchiselists = $franchise->getall();
    $boutique = new boutiquecontroller();
    ?>
    <main>
        <?php
        include('elementphp/navbar.php');;
        ?>
        <div id="barre1">
            <?php
            if ($_SESSION['droit'] === '1') {
                include('elementphp/barreaccueil.php');
            } else {
                include('elementphp/barreaccueilNotAdmin.php');
            }
            ?>
        </div>
        <!-- MENU DROIT  -->
        <div class="carredroit">
            <?php
            if ($_SESSION['droit'] === '1') {
                include('elementphp/searchbar.php');
            } else {
                print_r('');
            }
            ?>
            <div class="mainmenu">
                <?php
                if ($_SESSION['droit'] === '1') {
                    include('elementphp/filtre.php');
                } else {
                    print_r('');
                }
                ?>
<h1>PAGE EN CONSTRUCTION</h1>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <script src="stylescriptpage/script2.js"></script>
</body>
</html>