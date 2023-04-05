<?php require_once('header.php'); ?>

<?php
$statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
$statement->execute();
$result = $statement->fetchAll(PDO::FETCH_ASSOC);                            
foreach ($result as $row) {
    $banner_checkout = $row['banner_checkout'];
}
?>

<?php
if(!isset($_SESSION['cart_p_id'])) {
    header('location: cart.php');
    exit;
}
?>

<div class="page-banner" style="background-image: url(assets/uploads/<?php echo $banner_checkout; ?>)">
    <div class="overlay"></div>
    <div class="page-banner-inner">
        <h1>Thông tin đặt hàng</h1>
    </div>
</div>

<div class="page">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                
                <?php if(!isset($_SESSION['customer'])): ?>
                    <p>
                        <a href="login.php" class="btn btn-md btn-danger">Hãy đăng nhập để tiến hành đặt hàng</a>
                    </p>
                <?php else: ?>

                <h3 class="special">Chi tiết đặt hàng</h3>
                <div class="cart">
                    <table class="table table-responsive table-hover table-bordered">
                        <tr>
                            <th><?php echo 'ID' ?></th>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Size</th>
                            <th>Màu</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th class="text-right">Tổng</th>
                        </tr>
                         <?php
                        $table_total_price = 0;

                        $i=0;
                        foreach($_SESSION['cart_p_id'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_id[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_size_id'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_size_id[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_size_name'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_size_name[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_color_id'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_color_id[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_color_name'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_color_name[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_qty'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_qty[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_current_price'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_current_price[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_name'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_name[$i] = $value;
                        }

                        $i=0;
                        foreach($_SESSION['cart_p_featured_photo'] as $key => $value) 
                        {
                            $i++;
                            $arr_cart_p_featured_photo[$i] = $value;
                        }
                        ?>
                        <?php for($i=1;$i<=count($arr_cart_p_id);$i++): ?>
                        <tr>
                            <td><?php echo $i; ?></td>
                            <td>
                                <img src="assets/uploads/<?php echo $arr_cart_p_featured_photo[$i]; ?>" alt="">
                            </td>
                            <td><?php echo $arr_cart_p_name[$i]; ?></td>
                            <td><?php echo $arr_cart_size_name[$i]; ?></td>
                            <td><?php echo $arr_cart_color_name[$i]; ?></td>
                            <td><?php echo number_format($arr_cart_p_current_price[$i],0,',','.'); ?>đ</td>
                            <td><?php echo $arr_cart_p_qty[$i]; ?></td>
                            <td class="text-right">
                                <?php
                                $row_total_price = $arr_cart_p_current_price[$i]*$arr_cart_p_qty[$i];
                                $table_total_price = $table_total_price + $row_total_price;
                                ?>
                                <?php echo number_format($row_total_price,0,',','.'); ?>đ
                            </td>
                        </tr>
                        <?php endfor; ?>           
                        <tr>
                            <th colspan="7" class="total-text">Tổng giá trị sản phẩm</th>
                            <th class="total-amount"><?php echo number_format($table_total_price,0,',','.'); ?>đ</th>
                        </tr>
                        <?php
                        $statement = $pdo->prepare("SELECT * FROM tbl_shipping_cost WHERE country_id=?");
                        $statement->execute(array($_SESSION['customer']['cust_country']));
                        $total = $statement->rowCount();
             
                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                        foreach ($result as $row) {
                            $shipping_cost = $row['amount'];
                        }
                                
                        ?>
                        <tr>
                            <td colspan="7" class="total-text">+ Chi phí vận chuyển</td>
                            <td class="total-amount"><?php foreach ($result as $row) { echo number_format($shipping_cost,0,',','.');} ?>đ</td>
                        </tr>
                        <tr>
                            <th colspan="7" class="total-text">= Tổng đơn hàng</th>
                            <th class="total-amount">
                                <?php
                                $final_total = $table_total_price+$shipping_cost;
                                ?>
                                <?php echo number_format($final_total,0,',','.'); ?>đ
                            </th>
                        </tr>
                    </table> 
                </div>

                

                <div class="billing-address">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="special">Địa chỉ nhận hàng</h3>
                            <table class="table table-responsive table-bordered table-hover table-striped bill-address">
                                <tr>
                                    <td>Họ tên</td>
                                    <td><?php echo $_SESSION['customer']['cust_name']; ?></p></td>
                                </tr>
                                <tr>
                                    <td>SĐT</td>
                                    <td><?php echo $_SESSION['customer']['cust_phone']; ?></td>
                                </tr>
                                <tr>
                                    <td>Tỉnh/TP</td>
                                    <td>
                                         <?php
                                        $statement = $pdo->prepare("SELECT * FROM tbl_country WHERE country_id=?");
                                        $statement->execute(array($_SESSION['customer']['cust_country']));
                                        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                        foreach ($result as $row) {
                                            echo $row['country_name'];
                                        }
                                        ?> 
            
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Quận/Huyện</td>
                                    <td><?php echo $_SESSION['customer']['cust_city']; ?></td>
                                </tr>
                                <tr>
                                    <td>Phường/xã</td>
                                    <td><?php echo $_SESSION['customer']['cust_state']; ?></td>
                                </tr>
                                <tr>
                                    <td>Địa chỉ cụ thể</td>
                                    <td>
                                        <?php echo nl2br($_SESSION['customer']['cust_address']); ?>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Mã bưu chính</td>
                                    <td><?php echo $_SESSION['customer']['cust_zip']; ?></td>
                                </tr>                                
                            </table>
                        </div>
                    </div>                    
                </div>

                

                <div class="cart-buttons">
                    <ul>
                        <li><a href="cart.php" class="btn btn-primary">Trở lại giỏ hàng</a></li>
                    </ul>
                </div>

				<div class="clear"></div>
                <h3 class="special">Lưu ý</h3>
                <div class="row">
                    
                    	<?php
		                $checkout_access = 1;
		                if(
		                    ($_SESSION['customer']['cust_name']=='') ||
		                    ($_SESSION['customer']['cust_phone']=='') ||
		                    ($_SESSION['customer']['cust_address']=='') ||
		                    ($_SESSION['customer']['cust_country']=='') ||
		                    ($_SESSION['customer']['cust_city']=='') ||
		                    ($_SESSION['customer']['cust_state']=='') ||
		                    ($_SESSION['customer']['cust_zip']=='')
		                ) {
		                    $checkout_access = 0;
		                }
		                ?>
		                <?php if($checkout_access == 0): ?>
		                	<div class="col-md-12">
				                <div style="color:blue;font-size:22px;margin-bottom:50px;">
                                Bạn phải cập nhật thông tin thanh toán của mình để thanh toán đơn hàng. Vui lòng điền thông tin vào <a href="customer-billing-shipping-update.php" style="color:blue;text-decoration:underline;"><b>link này</b></a>.
			                    </div>
	                    	</div>
	                	<?php else: ?>
		                	<div class="col-md-4">
		                		
	                            <div class="row">

	                                <div class="col-md-12 form-group">
	                                    <label for="">Lựa chọn phương thức thanh toán *</label>
	                                    <select name="payment_method" class="form-control select2" id="advFieldsStatus">
	                                        <option value="">Chọn</option>
	                                        <option value="Pay">Thanh toán khi nhận</option>
	                                        <option value="Bank">Chuyển khoản</option>
	                                    </select>
	                                </div>

                                    <form class="pay" action="payment/pay/init.php" method="post" id="pay_form">
                                        

                                        <input type="hidden" name="final_total" value="<?php echo $final_total; ?>">
                                        <div class="col-md-12 form-group">
                                            <input type="submit" class="btn btn-primary" value="Đặt hàng" name="form1">
                                        </div>
                                    </form>



                                    <form action="payment/bank/init.php" method="post" id="bank_form">
                                        <input type="hidden" name="amount" value="<?php echo $final_total; ?>">
                                        <div class="col-md-12 form-group">
                                            <label for="">Thông tin chuyển khoản</span></label><br>
                                            <?php
                                            $statement = $pdo->prepare("SELECT * FROM tbl_settings WHERE id=1");
                                            $statement->execute();
                                            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($result as $row) {
                                                echo nl2br($row['bank_detail']);
                                            }
                                            ?>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <label for="">Thông tin giao dịch <br><span style="font-size:12px;font-weight:normal;">(Bao gồm mã giao dịch và các thông tin khác một cách chính xác)</span></label>
                                            <textarea name="transaction_info" class="form-control" cols="30" rows="10"></textarea>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <input type="submit" class="btn btn-primary" value="Thanh toán" name="form3">
                                        </div>
                                    </form>
	                                
	                            </div>
		                            
		                        
		                    </div>
		                <?php endif; ?>
                        
                </div>
                

                <?php endif; ?>

            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>