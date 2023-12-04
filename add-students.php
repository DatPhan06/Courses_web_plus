<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == "") {
    header("Location: index.php");
} else {
    if (isset($_POST['submit'])) {
        $studentname = $_POST['fullanme'];
        $roolid = $_POST['rollid'];
        $studentemail = $_POST['emailid'];
        $gender = $_POST['gender'];
        $classid = $_POST['class'];
        $dob = $_POST['dob'];
        $status = 1;
        $sql = "INSERT INTO  students(StudentName,RollId,StudentEmail,Gender,ClassId,DOB,Status) VALUES(:studentname,:roolid,:studentemail,:gender,:classid,:dob,:status)";
        $query = $dbh->prepare($sql);
        $query->bindParam(':studentname', $studentname, PDO::PARAM_STR);
        $query->bindParam(':roolid', $roolid, PDO::PARAM_STR);
        $query->bindParam(':studentemail', $studentemail, PDO::PARAM_STR);
        $query->bindParam(':gender', $gender, PDO::PARAM_STR);
        $query->bindParam(':classid', $classid, PDO::PARAM_STR);
        $query->bindParam(':dob', $dob, PDO::PARAM_STR);
        $query->bindParam(':status', $status, PDO::PARAM_STR);
        $query->execute();
        $lastInsertId = $dbh->lastInsertId();
        if ($lastInsertId) {
            $msg = "Thêm thông tin sinh viên thành công";
        } else {
            $error = "Dính lỗi rồi thử lại sau đi";
        }
    }
?>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>QLHS Admin | Thêm sinh viên < </title>
                <link rel="stylesheet" href="front-end/css/bootstrap.min.css" media="screen">
                <link rel="stylesheet" href="front-end/css/font-awesome.min.css" media="screen">
                <link rel="stylesheet" href="front-end/css/animate-css/animate.min.css" media="screen">
                <link rel="stylesheet" href="front-end/css/lobipanel/lobipanel.min.css" media="screen">
                <link rel="stylesheet" href="front-end/css/prism/prism.css" media="screen">
                <link rel="stylesheet" href="front-end/css/select2/select2.min.css">
                <link rel="stylesheet" href="front-end/css/main.css" media="screen">
                <script src="front-end/js/modernizr/modernizr.min.js"></script>
    </head>

    <body class="top-navbar-fixed">
        <div class="main-wrapper">

            <!-- ========== TOP NAVBAR ========== -->
            <?php include('includes/topbar.php'); ?>
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
                    <?php include('includes/leftbar.php'); ?>
                    <!-- /.left-sidebar -->

                    <div class="main-page">

                        <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-md-6">
                                    <h2 class="title">Thêm sinh viên</h2>

                                </div>

                                <!-- /.col-md-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-md-6">
                                    <ul class="breadcrumb">
                                        <li><a href="dashboard.php"><i class="fa fa-home"></i> Trang chủ</a></li>
                                        <li><a href="#">sinh viên</a></li>
                                        <li class="active">Thêm sinh viên</li>
                                    </ul>
                                </div>

                            </div>
                            <!-- /.row -->
                        </div>
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel">
                                        <div class="panel-heading">
                                            <div class="panel-title">
                                                <h5>Điền thông tin sinh viên</h5>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <?php if ($msg) { ?>
                                                <div class="alert alert-success left-icon-alert" role="alert">
                                                    <strong>Tuyệt vời! </strong><?php echo htmlentities($msg); ?>
                                                </div><?php } else if ($error) { ?>
                                                <div class="alert alert-danger left-icon-alert" role="alert">
                                                    <strong>Ôi không! </strong> <?php echo htmlentities($error); ?>
                                                </div>
                                            <?php } ?>
                                            <form class="form-horizontal" method="post">

                                                <div class="form-group">
                                                    <label for="default" class="col-sm-2 control-label">Tên đầy đủ</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" name="fullanme" class="form-control" id="fullanme" required="required" autocomplete="off">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="default" class="col-sm-2 control-label">Mã sinh viên</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" name="rollid" class="form-control" id="rollid" maxlength="8" required="required" autocomplete="off">
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="default" class="col-sm-2 control-label">Email</label>
                                                    <div class="col-sm-10">
                                                        <input type="email" name="emailid" class="form-control" id="email" required="required" autocomplete="off">
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <label for="default" class="col-sm-2 control-label">Giới tính</label>
                                                    <div class="col-sm-10">
                                                        <input type="radio" name="gender" value="Male" required="required" checked="">Nam <input type="radio" name="gender" value="Female" required="required">Nữ <input type="radio" name="gender" value="Other" required="required">Khác
                                                    </div>
                                                </div>










                                                <div class="form-group">
                                                    <label for="default" class="col-sm-2 control-label">Lớp học</label>
                                                    <div class="col-sm-10">
                                                        <select name="class" class="form-control" id="default" required="required">
                                                            <option value="">Chọn lớp học</option>
                                                            <?php $sql = "SELECT * from classes";
                                                            $query = $dbh->prepare($sql);
                                                            $query->execute();
                                                            $results = $query->fetchAll(PDO::FETCH_OBJ);
                                                            if ($query->rowCount() > 0) {
                                                                foreach ($results as $result) {   ?>
                                                                    <option value="<?php echo htmlentities($result->id); ?>">
                                                                        <?php echo htmlentities($result->ClassName); ?>&nbsp;
                                                                        <?php echo htmlentities($result->Section); ?>
                                                                        &nbsp;Năm
                                                                        <?php echo htmlentities($result->ClassNameNumeric); ?>
                                                                    </option>
                                                            <?php }
                                                            } ?>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="date" class="col-sm-2 control-label">Ngày sinh nhật</label>
                                                    <div class="col-sm-10">
                                                        <input type="date" name="dob" class="form-control" id="date">
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <div class="col-sm-offset-2 col-sm-10">
                                                        <button type="submit" name="submit" class="btn btn-primary">Thêm</button>
                                                    </div>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                                <!-- /.col-md-12 -->
                            </div>
                        </div>
                    </div>
                    <!-- /.content-container -->
                </div>
                <!-- /.content-wrapper -->
            </div>
            <!-- /.main-wrapper -->
            <script src="front-end/js/jquery/jquery-2.2.4.min.js"></script>
            <script src="front-end/js/bootstrap/bootstrap.min.js"></script>
            <script src="front-end/js/pace/pace.min.js"></script>
            <script src="front-end/js/lobipanel/lobipanel.min.js"></script>
            <script src="front-end/js/iscroll/iscroll.js"></script>
            <script src="front-end/js/prism/prism.js"></script>
            <script src="front-end/js/select2/select2.min.js"></script>
            <script src="front-end/js/main.js"></script>
            <script>
                $(function($) {
                    $(".js-states").select2();
                    $(".js-states-limit").select2({
                        maximumSelectionLength: 2
                    });
                    $(".js-states-hide").select2({
                        minimumResultsForSearch: Infinity
                    });
                });
            </script>

            <!-- Footer-->
            <footer class="py-5 bg-dark">
            </footer>
    </body>

    </html>
<?PHP } ?>