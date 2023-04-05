<?php require_once('header.php'); ?>

<?php
if(isset($_POST['form1'])) {

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['facebook'],'Facebook'));

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['twitter'],'Twitter'));

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['tiktok'],'Tiktok'));

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['pinterest'],'Pinterest'));

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['youtube'],'YouTube'));

	$statement = $pdo->prepare("UPDATE tbl_social SET social_url=? WHERE social_name=?");
	$statement->execute(array($_POST['instagram'],'Instagram'));

	$success_message = 'URL phương tiện truyền thông xã hội được cập nhật thành công.';

}
?>

<section class="content-header">
	<div class="content-header-left">
		<h1>Phương tiện truyền thông</h1>
	</div>
</section>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_social");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);							
foreach ($result as $row) {
	if($row['social_name'] == 'Facebook') {
		$facebook = $row['social_url'];
	}
	if($row['social_name'] == 'Twitter') {
		$twitter = $row['social_url'];
	}
	if($row['social_name'] == 'Tiktok') {
		$linkedin = $row['social_url'];
	}
	if($row['social_name'] == 'Pinterest') {
		$pinterest = $row['social_url'];
	}
	if($row['social_name'] == 'YouTube') {
		$youtube = $row['social_url'];
	}
	if($row['social_name'] == 'Instagram') {
		$instagram = $row['social_url'];
	}
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
						<p style="padding-bottom: 20px;">Nhập URL để liên kết với các trang mạng xã hội.</p>

						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Facebook </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="facebook" value="<?php echo $facebook; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Twitter </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="twitter" value="<?php echo $twitter; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Tiktok </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="linkedin" value="<?php echo $linkedin; ?>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Pinterest </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="pinterest" value="<?php echo $pinterest; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">YouTube </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="youtube" value="<?php echo $youtube; ?>">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-sm-2 control-label">Instagram </label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="instagram" value="<?php echo $instagram; ?>">
							</div>
						</div>
						
						<div class="form-group">
							<label for="" class="col-sm-2 control-label"></label>
							<div class="col-sm-6">
								<button type="submit" class="btn btn-success pull-left" name="form1">Submit</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</section>

<?php require_once('footer.php'); ?>