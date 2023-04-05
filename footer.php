<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);
foreach ($result as $row)
{
	$footer_about = $row['footer_about'];
	$contact_email = $row['contact_email'];
	$contact_phone = $row['contact_phone'];
	$contact_address = $row['contact_address'];
	$footer_copyright = $row['footer_copyright'];
	$total_recent_post_footer = $row['total_recent_post_footer'];
    $total_popular_post_footer = $row['total_popular_post_footer'];
    $newsletter_on_off = $row['newsletter_on_off'];
}
?>


<?php if($newsletter_on_off == 1): ?>
<section class="home-newsletter">
	<div class="container">
		<div class="row" style="color:white;">
			<div class="col-md-3 logo">
				<a href="index.php"><img src="assets/uploads/<?php echo $logo; ?>" width=100 alt="logo image"></a>
				<ul style="list-style:none;line-height: 2;">
					<li>Địa chỉ: <?php echo nl2br($contact_address); ?></li>
					<li><li><i class="fa fa-phone"></i> <?php echo $contact_phone; ?></li></li>
					<li><li><i class="fa fa-envelope-o"></i> <?php echo $contact_email; ?></li></li>
				</ul>
			</div>
			<div class="col-md-2 ">
				<p >DANH MỤC SẢN PHẨM</p>
				<div>
					<ul style="list-style:none;line-height: 2;">
						<li>- Tất cả sản phẩm</li>
						<li>- Quần áo bé trai</li>
						<li>- Quân áo bé gái</li>
					</ul>
				</div>
			</div>
			<div class="col-md-2 ">
					<p>LIÊN HỆ VỚI CHÚNG TÔI</p>
				<div>
						<ul style="list-style:none;line-height: 2;">
							<li>- Giờ mở cửa: <br>T2 - CN: 9h00 - 21h00</li>
							<li>- Xem bản đồ</li>
							<li>- Tài khoản</li>
						</ul>
					</div>
			</div>
			<div class="col-md-2 ">
				<p>CHÍNH SÁCH BÁN HÀNG</p>
				<div>
					<ul style="list-style:none;line-height: 2;">
						<li>- Giới thiệu</li>
						<li>- Chính sách đổi trả</li>
						<li>- Phương thức thanh toán</li>
						<li>- Phương thức vận chuyển</li>
						<li>- Chính sách bảo mật</li>
					</ul>
				</div>
			</div>
			<div class="col-md-2 text-center">
					<p>CHỨNG NHẬN</p>
					<div>
					<img src="assets/uploads/fot_chung_nhan.png" width=150 alt="image">
					</div>
					<br>
					<div>
					<img src="assets/uploads/fot_chung_nhan2.png" width=150 alt="image">
					</div>
			</div>
		</div>
	</div>
</section>
<?php endif; ?>

<div class="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12 copyright">
				<?php echo $footer_copyright; ?>
			</div>
		</div>
	</div>
</div>


<a href="#" class="scrollup">
	<i class="fa fa-angle-up"></i>
</a>

<script src="assets/js/jquery-2.2.4.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/megamenu.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/owl.animate.js"></script>
<script src="assets/js/jquery.bxslider.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/rating.js"></script>
<script src="assets/js/jquery.touchSwipe.min.js"></script>
<script src="assets/js/bootstrap-touch-slider.js"></script>
<script src="assets/js/select2.full.min.js"></script>
<script src="assets/js/custom.js"></script>
<script>
	function confirmDelete()
	{
	    return confirm("Bạn có chắc muốn xóa dữ liệu này?");
	}
	$(document).ready(function () {
		advFieldsStatus = $('#advFieldsStatus').val();

		$('#pay_form').hide();
		$('#bank_form').hide();

        $('#advFieldsStatus').on('change',function() {
            advFieldsStatus = $('#advFieldsStatus').val();
            if ( advFieldsStatus == '' ) {
            	$('#pay_form').hide();
				$('#bank_form').hide();
            } else if ( advFieldsStatus == 'Pay' ) {
               	$('#pay_form').show();
				$('#bank_form').hide();
            } else if ( advFieldsStatus == 'Bank' ) {
            	$('#pay_form').hide();
				$('#bank_form').show();
            }
        });
	});
</script>
</body>
</html>