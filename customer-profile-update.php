<?php require_once('header.php'); ?>

<?php

if(!isset($_SESSION['customer'])) {
    header('location: '.BASE_URL.'logout.php');
    exit;
} else {

    $statement = $pdo->prepare("SELECT * FROM tbl_customer WHERE cust_id=? AND cust_status=?");
    $statement->execute(array($_SESSION['customer']['cust_id'],0));
    $total = $statement->rowCount();
    if($total) {
        header('location: '.BASE_URL.'logout.php');
        exit;
    }
}
?>

<?php
if (isset($_POST['form1'])) {

    $valid = 1;

    if(empty($_POST['cust_name'])) {
        $valid = 0;
        $error_message = "Nhập họ tên<br>";
    }

    if(empty($_POST['cust_phone'])) {
        $valid = 0;
        $error_message = "Nhập số điện thoại<br>";
    }

    if(empty($_POST['cust_address'])) {
        $valid = 0;
        $error_message = "Nhập địa chỉ Email<br>";
    }

    if(empty($_POST['cust_country'])) {
        $valid = 0;
        $error_message = "Chọn Tỉnh/TP<br>";
    }

    if(empty($_POST['cust_city'])) {
        $valid = 0;
        $error_message = "Nhập Quận/Huyện<br>";
    }

    if(empty($_POST['cust_state'])) {
        $valid = 0;
        $error_message = "Nhập Phường/xã<br>";
    }

    if(empty($_POST['cust_zip'])) {
        $valid = 0;
        $error_message = "Nhập mã bưu chính<br>";
    }

    if($valid == 1) {

        $statement = $pdo->prepare("UPDATE tbl_customer SET cust_name=?, cust_phone=?, cust_country=?, cust_address=?, cust_city=?, cust_state=?, cust_zip=? WHERE cust_id=?");
        $statement->execute(array(
                    strip_tags($_POST['cust_name']),
                    strip_tags($_POST['cust_phone']),
                    strip_tags($_POST['cust_country']),
                    strip_tags($_POST['cust_address']),
                    strip_tags($_POST['cust_city']),
                    strip_tags($_POST['cust_state']),
                    strip_tags($_POST['cust_zip']),
                    $_SESSION['customer']['cust_id']
                ));  
       
        $success_message = 'Thông tin cá nhân được cập nhật thành công.';

        $_SESSION['customer']['cust_name'] = $_POST['cust_name'];
        $_SESSION['customer']['cust_phone'] = $_POST['cust_phone'];
        $_SESSION['customer']['cust_country'] = $_POST['cust_country'];
        $_SESSION['customer']['cust_address'] = $_POST['cust_address'];
        $_SESSION['customer']['cust_city'] = $_POST['cust_city'];
        $_SESSION['customer']['cust_state'] = $_POST['cust_state'];
        $_SESSION['customer']['cust_zip'] = $_POST['cust_zip'];
    }
}
?>

<div class="page">
    <div class="container">
        <div class="row">            
            <div class="col-md-12"> 
                <?php require_once('customer-sidebar.php'); ?>
            </div>
            <div class="col-md-12">
                <div class="user-content">
                    <h3>
                        Cập nhật thông tin cá nhân
                    </h3>
                    <?php
                    if($error_message != '') {
                        echo "<div class='error' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>".$error_message."</div>";
                    }
                    if($success_message != '') {
                        echo "<div class='success' style='padding: 10px;background:#f1f1f1;margin-bottom:20px;'>".$success_message."</div>";
                    }
                    ?>
                    <form action="" method="post">
                        <?php $csrf->echoInputField(); ?>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label for="">Họ tên *</label>
                                <input type="text" class="form-control" name="cust_name" value="<?php echo $_SESSION['customer']['cust_name']; ?>">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="">Địa chỉ Email *</label>
                                <input type="text" class="form-control" name="" value="<?php echo $_SESSION['customer']['cust_email']; ?>" disabled>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="">SĐT *</label>
                                <input type="text" class="form-control" name="cust_phone" value="<?php echo $_SESSION['customer']['cust_phone']; ?>">
                            </div>
                            <div class="col-md-12 form-group">
                                <label for="">Địa chỉ *</label>
                                <textarea name="cust_address" class="form-control" cols="30" rows="10" style="height:70px;"><?php echo $_SESSION['customer']['cust_address']; ?></textarea>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="">Tỉnh/TP *</label>
                                <select name="cust_country" class="form-control">
                                <?php
                                $statement = $pdo->prepare("SELECT * FROM tbl_country ORDER BY country_name ASC");
                                $statement->execute();
                                $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($result as $row) {
                                    ?>
                                    <option value="<?php echo $row['country_id']; ?>" <?php if($row['country_id'] == $_SESSION['customer']['cust_country']) {echo 'selected';} ?>><?php echo $row['country_name']; ?></option>
                                    <?php
                                }
                                ?>
                                </select>                                    
                            </div>
                            
                            <div class="col-md-6 form-group">
                                <label for="">Quận/Huyện *</label>
                                <input type="text" class="form-control" name="cust_city" value="<?php echo $_SESSION['customer']['cust_city']; ?>">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="">Phường/xã *</label>
                                <input type="text" class="form-control" name="cust_state" value="<?php echo $_SESSION['customer']['cust_state']; ?>">
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="">Mã bưu chính *</label>
                                <input type="text" class="form-control" name="cust_zip" value="<?php echo $_SESSION['customer']['cust_zip']; ?>">
                            </div>
                        </div>
                        <input type="submit" class="btn btn-primary" value="Cập nhật" name="form1">
                    </form>
                </div>                
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>