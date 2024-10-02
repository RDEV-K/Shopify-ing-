<!DOCTYPE html>
<html lang="en">

<head>

    <?php
    $session = session();

    if (!$session->has('user_id')) {
        echo "<script> window.location.replace('" . base_url() . "'); </script>";
    }
    ?>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ingrevo | Formulation Software</title>

    <!-- CDN's -->

    <link rel="icon" href="<?= base_url() ?>/public/files/logos/2.png" type="image/gif">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <!-- FontAwsome -->
    <script src="https://kit.fontawesome.com/3d1bd4626b.js" crossorigin="anonymous"></script>
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css" />
    <script src="https://cdn.jsdelivr.net/npm/gojs/release/go.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://unpkg.com/docx@7.1.0/build/index.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap5.css" />
    <script src="https://cdn.datatables.net/rowgroup/1.2.0/js/dataTables.rowGroup.min.js"></script>
    <!-- ColReorder CSS -->
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/colreorder/1.5.4/css/colReorder.dataTables.min.css">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.bootstrap5.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.colVis.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.js"></script>
    <!-- ColReorder JS -->
    <script type="text/javascript"
        src="https://cdn.datatables.net/colreorder/1.5.4/js/dataTables.colReorder.min.js"></script>

    <script type="text/javascript"
        src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.js"></script>
    <script type="text/javascript"
        src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap5.js"></script>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <!-- Google Fonts -->

    <style>
        .n_active {
            border-bottom: 2px #161C2D solid;
            color: #161C2D !important;
        }

        #ingrevo-logo {
            width: 150px;
        }



        @media only screen and (min-width : 320px) {
            .menu_horizontal {
                flex-direction: row !important;
                justify-content: space-between;
                margin-top: 10px;
                margin-bottom: 10px;
            }
        }

        @media(max-width:600px) {
            #ingrevo-logo {
                width: 100px;
            }

            .navbar-toggler {
                font-size: 15px;
                padding: 4px 7px;
            }

            .nav-link {
                font-size: 8px;
            }

            .fa-xl {
                font-size: 1rem;
                margin-bottom: 15px;
                margin-bottom: 10px !important;
            }
        }
    </style>

    <!-- Essential JS 2 Gantt's dependent scripts -->
    <script src="https://cdn.syncfusion.com/ej2/ej2-base/dist/global/ej2-base.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-data/dist/global/ej2-data.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-buttons/dist/global/ej2-buttons.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-popups/dist/global/ej2-popups.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-navigations/dist/global/ej2-navigations.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-dropdowns/dist/global/ej2-dropdowns.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-compression/dist/global/ej2-dropdowns.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-file-utils/dist/global/ej2-dropdowns.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-inputs/dist/global/ej2-inputs.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-calendars/dist/global/ej2-calendars.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-layouts/dist/global/ej2-layouts.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-richtexteditor/dist/global/ej2-richtexteditor.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-grids/dist/global/ej2-grids.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-lists/dist/global/ej2-lists.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-popups/dist/global/ej2-popups.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-treegrid/dist/global/ej2-treegrid.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-splitbuttons/dist/global/ej2-splitbuttons.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-excel-export/dist/global/ej2-excel-export.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-file-utils/dist/global/ej2-file-utils.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-compression/dist/global/ej2-compression.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-pdf-export/dist/global/ej2-pdf-export.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-exel-export/dist/global/ej2-lists.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-schedule/dist/global/ej2-schedule.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-gantt/dist/global/ej2-gantt.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-charts/dist/global/ej2-charts.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-inputs/dist/global/ej2-inputs.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-navigations/dist/global/ej2-navigations.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-calendars/dist/global/ej2-calendars.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-exel-export/dist/global/ej2-lists.min.js"
        type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-schedule/dist/global/ej2-schedule.min.js"
        type="text/javascript"></script>

    <!-- Essential JS 2 Gantt's dependent scripts -->

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdn.rawgit.com/jlong/css-spinners/master/css/spinners.css">

    <!-- CDN's -->

    <nav class="navbar navbar-expand-lg navbar-light sticky-top border-bottom" style="background-color: #FFFFFF;">
        <div class="container-fluid px-3" style="width: 97vw; height: 20%">
            <a class="navbar-brand d-flex align-items-center" href="<?= base_url() ?>/dashboard"><img
                    src="<?= base_url() ?>/public/files/logos/1.svg" id="ingrevo-logo"></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler"
                aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon" id="nav-toggle-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarToggler">
                <ul class="nav navbar-nav text-small menu_horizontal">
                    <?php
                    use App\Controllers\AuthorizedBtnController;

                    if (session()->has('elapse')) {
                        echo "<script>setTimeout(function() {
                                alert('You will be logged out in one minute');
                            }, " . session()->get('elapse') . ");</script>";
                    }
                    $active = '';
                    $username = '';
                    if (session()->has('active')) {
                        $active = session()->get('active');
                    }
                    if (session()->has('staff_username')) {
                        $username = session()->get('staff_username');
                    }
                    $user_log = session()->get('user_log');
                    if ($restrict):
                        ?>
                        <li id="dashboard" class="nav-item px-2  <?= $active == '1' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/dashboard" style="color: #161C2D" class="nav-link text-center"><i
                                    class="fa-solid fa-gauge mb-3 fa-xl"></i></br><strong>Dashboard</strong></a></li>
                        <li id="ingredients" class="nav-item px-2 <?= $active == '2' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/manufacturing/ingredients" style="color: #161C2D"
                                class="nav-link text-center"><i
                                    class="fa-solid fa-industry mb-3 fa-xl"></i></br><strong>Manufacturing</strong></a></li>
                        <li id="profile" class="nav-item px-2 <?= $active == '6' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/profile/<?php echo $_SESSION['user_id'] ?>" style="color: #161C2D"
                                class="nav-link text-center"><i
                                    class="fa-solid fa-user mb-3 fa-xl "></i></br><strong>Profile</strong></a></li>
                        <li id="logout" class="nav-item px-2 <?= $active == '5' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/logout" style="color: #161C2D" class="nav-link text-center"><i
                                    class="fa-solid fa-right-from-bracket  mb-3 fa-xl"></i></br><strong>Logout</strong></a>
                        </li>
                    <?php else: ?>
                        <li id="dashboard" class="nav-item px-2  <?= $active == '1' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/dashboard" style="color: #161C2D" class="nav-link text-center"><i
                                    class="fa-solid fa-gauge mb-3 fa-xl"></i></br><strong>Dashboard</strong></a></li>
                        <li id="ingredients" class="nav-item px-2 <?= $active == '2' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/manufacturing/ingredients" style="color: #161C2D"
                                class="nav-link text-center"><i
                                    class="fa-solid fa-industry mb-3 fa-xl"></i></br><strong>Manufacturing</strong></a></li>
                        <li id="cpn" class="nav-item px-2 <?= $active == '3' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/rd/cpn" style="color: #161C2D" class="nav-link text-center"><i
                                    class="fa-solid fa-clipboard-check mb-3 fa-xl"></i></br><strong>Compliance</strong></a>
                        </li>
                        <li id="planning" class="nav-item px-2 <?= $active == '4' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/planning" style="color: #161C2D"
                                class="nav-link text-center"><i
                                    class="fa-solid fa-chart-line mb-3 fa-xl "></i></br><strong>Planning</strong></a></li>
                        <li id="profile" class="nav-item px-2 <?= $active == '6' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/profile/<?php echo $_SESSION['user_id'] ?>" style="color: #161C2D"
                                class="nav-link text-center"><i
                                    class="fa-solid fa-user mb-3 fa-xl"></i></br><strong>Profile</strong></a></li>
                        <li id="logout" class="nav-item px-2 <?= $active == '5' ? 'n_active' : '' ?>"><a
                                href="<?= base_url() ?>/logout" style="color: #161C2D" class="nav-link text-center"><i
                                    class="fa-solid fa-right-from-bracket mb-3 fa-xl "></i></br><strong>Logout</strong></a>
                        </li>
                    <?php endif ?>
                </ul>
            </div>

        </div>
    </nav>

</head>

<style>
    .dropdown-menu {
        border-radius: 0px;
    }
</style>