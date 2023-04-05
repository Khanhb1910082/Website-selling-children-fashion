<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {
	$valid = 1;

    if(empty($_POST['country_name'])) {
        $valid = 0;
        $error_message .= "Chưa nhập thông tin<br>";
    } else {
    	$statement = $pdo->prepare("SELECT * FROM tbl_country WHERE country_id=?");
		$statement->execute(array($_REQUEST['id']));
		$result = $statement->fetchAll(PDO::FETCH_ASSOC);
		foreach($result as $row) {
			$current_country_name = $row['country_name'];
		}

		$statement = $pdo->prepare("SELECT * FROM tbl_country WHERE country_name=? and country_name!=?");
    	$statement->execute(array($_POST['country_name'],$current_country_name));
    	$total = $statement->rowCount();							
    	if($total) {
    		$valid = 0;
        	$error_message .= 'Đã tồn tại<br>';
    	}
    }
    if($valid == 1) {    	

		$statement = $pdo->prepare("UPDATE tbl_country SET country_name=? WHERE country_id=?");
		$statement->execute(array($_POST['country_name'],$_REQUEST['id']));

    	$success_message = 'Cập nhật thành công.';
    }
}
?>

<?php
if(!isset($_REQUEST['id'])) {
	header('location: logout.php');
	exit;
} else {
	$statement = $pdo->prepare("SELECT * FROM tbl_country WHERE country_id=?");
	$statement->execute(array($_REQUEST['id']));
	$total = $statement->rowCount();
	$result = $statement->fetchAll(PDO::FETCH_ASSOC);
	if( $total == 0 ) {
		header('location: logout.php');
		exit;
	}
}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Chỉnh sửa Tỉnh</h1>
	</div>
	<div class="content-header-right">
		<a href="country.php" class="btn btn-primary btn-sm">Xem lại</a>
	</div>
</section>


<?php							
foreach ($result as $row) {
	$country_name = $row['country_name'];
}
?>

<section class="content">

  <div class="row">
    <div class="col-md-12">

		<?php if($error_message): ?>
		<div class="callout callout-danger">
		
		<p>
		<?php echo $error_message; ?>
		</p>
		</div>
		<?php endif; ?>

		<?php if($success_message): ?>
		<div class="callout callout-success">
		
		<p><?php echo $success_message; ?></p>
		</div>
		<?php endif; ?>

        <form class="form-horizontal" action="" method="post">

        <div class="box box-info">

            <div class="box-body">
                <div class="form-group">
                    <label for="" class="col-sm-2 control-label">Tên Tỉnh/TP <span>*</span></label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="country_name" value="<?php echo $country_name; ?>">
                    </div>
                </div>
                <div class="form-group">
                	<label for="" class="col-sm-2 control-label"></label>
                    <div class="col-sm-6">
                      <button type="submit" class="btn btn-success pull-left" name="form1">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
    </div>
  </div>
</section>
<?php require_once('footer.php'); ?>