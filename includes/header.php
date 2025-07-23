<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <title><?php echo isset($title) ? $title : 'TPQ Masjid'; ?></title>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
                    <link rel="stylesheet" href="../assets/css/all.min.css">
                        <link rel="stylesheet" href="../assets/css/adminlte.min.css">
                            <link rel="stylesheet" href="../assets/css/custom.css">
                            </head>
                            <body class="hold-transition sidebar-mini layout-fixed">
                            <div class="wrapper">
                                <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                                        <ul class="navbar-nav">
                                                    <li class="nav-item">
                                                                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                                                                                </li>
                                                                                        </ul>
                                                                                                
                                                                                                        <ul class="navbar-nav ml-auto">
                                                                                                                    <li class="nav-item dropdown">
                                                                                                                                    <a class="nav-link" data-toggle="dropdown" href="#">
                                                                                                                                                        <i class="far fa-user"></i> <?php echo $_SESSION['username']; ?>
                                                                                                                                                                        </a>
                                                                                                                                                                                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                                                                                                                                                                                                            <a href="profil.php" class="dropdown-item">
                                                                                                                                                                                                                                    <i class="fas fa-user mr-2"></i> Profil
                                                                                                                                                                                                                                                        </a>
                                                                                                                                                                                                                                                                            <div class="dropdown-divider"></div>
                                                                                                                                                                                                                                                                                                <a href="../logout.php" class="dropdown-item">
                                                                                                                                                                                                                                                                                                                        <i class="fas fa-sign-out-alt mr-2"></i> Logout
                                                                                                                                                                                                                                                                                                                                            </a>
                                                                                                                                                                                                                                                                                                                                                            </div>
                                                                                                                                                                                                                                                                                                                                                                        </li>
                                                                                                                                                                                                                                                                                                                                                                                </ul>
                                                                                                                                                                                                                                                                                                                                                                                    </nav>