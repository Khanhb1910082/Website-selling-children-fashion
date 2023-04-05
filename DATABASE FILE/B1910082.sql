create database turtle_k charset = 'utf8';
use turtle_k;

CREATE TABLE `tbl_color` (
  `color_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `color_name` varchar(255) NOT NULL
);
INSERT INTO `tbl_color` (`color_id`, `color_name`) VALUES
(1, 'Đỏ'),
(2, 'Đen'),
(3, 'Xanh'),
(4, 'Vàng'),
(5, 'Xanh lá'),
(6, 'Trắng'),
(7, 'Cam'),
(8, 'Nâu'),
(9, 'Sọc cam'),
(10, 'Hồng'),
(11, 'Sọc hường'),
(12, 'Sọc kem'),
(13, 'Tím'),
(14, 'Tím nhạt'),
(15, 'Xám'),
(16, 'Bạc'),
(17, 'Nâu sẫm'),
(18, 'Đỏ sẫm'),
(19, 'Xanh đậm'),
(20, 'Xanh nhạt');


CREATE TABLE `tbl_country` (
  `country_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL
);

INSERT INTO `tbl_country` (`country_id`, `country_name`) VALUES
(1, 'An Giang'),
(2, 'Bà Rịa-Vũng Tàu'),
(3, 'Bạc Liêu'),
(4, 'Bắc Kạn'),
(5, 'Bắc Giang'),
(6, 'Bắc Ninh'),
(7, 'Bến Tre'),
(8, 'Bình Dương'),
(9, 'Bình Định'),
(10, 'Bình Phước'),
(11, 'Bình Thuận'),
(12, 'Cà Mau'),
(13, 'Cao Bằng'),
(14, 'Thành phố Cần Thơ'),
(15, 'Thành phố Đà Nẵng'),
(16, 'Đắk Lắk'),
(17, 'Đắk Nông'),
(18, 'Điện Biên'),
(19, 'Đồng Nai'),
(20, 'Đồng Tháp'),
(21, 'Gia Lai	'),
(22, 'Hà Giang'),
(23, 'Hà Nam'),
(24, 'Thành phố Hà Nội (Thủ đô)'),
(25, 'Hà Tĩnh'),
(26, 'Hải Dương'),
(27, 'Thành phố Hải Phòng'),
(28, 'Hòa Bình'),
(29, 'Thành phố Hồ Chí Minh'),
(30, 'Hậu Giang'),
(31, 'Hưng Yên'),
(32, 'Khánh Hòa'),
(33, 'Kiên Giang'),
(34, 'Kon Tum'),
(35, 'Lai Châu'),
(36, 'Lào Cai'),
(37, 'Lạng Sơn'),
(38, 'Lâm Đồng'),
(39, 'Long An'),
(40, 'Nam Định'),
(41, 'Nghệ An'),
(42, 'Ninh Bình'),
(43, 'Ninh Thuận'),
(44, 'Phú Thọ'),
(45, 'Phú Yên'),
(46, 'Quảng Bình'),
(47, 'Quảng Nam'),
(48, 'Quảng Ngãi'),
(49, 'Quảng Ninh'),
(50, 'Quảng Trị'),
(51, 'Sóc Trăng'),
(52, 'Sơn La'),
(53, 'Tây Ninh'),
(54, 'Thái Bình'),
(55, 'Thái Nguyên'),
(56, 'Thanh Hóa'),
(57, 'Thừa Thiên Huế'),
(58, 'Tiền Giang'),
(59, 'Trà Vinh'),
(60, 'Tuyên Quang'),
(61, 'Vĩnh Long'),
(62, 'Vĩnh Phúc'),
(63, 'Yên Bái');


CREATE TABLE `tbl_customer` (
  `cust_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cust_name` varchar(100) NOT NULL,
  `cust_email` varchar(100) NOT NULL,
  `cust_phone` varchar(50) NOT NULL,
  `cust_country` int(11) NOT NULL,
  `cust_address` text NOT NULL,
  `cust_city` varchar(100) NOT NULL,
  `cust_state` varchar(100) NOT NULL,
  `cust_zip` varchar(30) NOT NULL,
  `cust_password` varchar(100) NOT NULL,
  `cust_token` varchar(255) NOT NULL,
  `cust_datetime` varchar(100) NOT NULL,
  `cust_timestamp` varchar(100) NOT NULL,
  `cust_status` int(1) NOT NULL
);

INSERT INTO `tbl_customer` (`cust_id`, `cust_name`, `cust_email`, `cust_phone`, `cust_country`, `cust_address`, `cust_city`, `cust_state`, `cust_zip`, `cust_password`, `cust_token`, `cust_datetime`, `cust_timestamp`, `cust_status`) VALUES
(1, 'Nguyễn Thị Loan',  'loan@mail.com', '7458965410', 1, 'Kiến Hưng 1', 'Chọ Mới', 'Kiến Thành', '37072', '5f4dcc3b5aa765d61d8327deb882cf99', '0081e99a29cacd4b553db15c5c5c047e', '2022-12-09 12:09:34', '1647544174', 1);


CREATE TABLE `tbl_customer_message` (
  `customer_message_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `order_detail` text NOT NULL,
  `cust_id` int(11) NOT NULL
);

CREATE TABLE `tbl_top_category` (
  `tcat_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tcat_name` varchar(255) NOT NULL,
  `show_on_menu` int(1) NOT NULL
) ;
INSERT INTO `tbl_top_category` (`tcat_id`, `tcat_name`, `show_on_menu`) VALUES
(1, 'Bé trai', 1),
(2, 'Bé gái', 1),
(3, 'Sơ sinh', 1),
(4, 'Phụ kiện', 1);


CREATE TABLE `tbl_mid_category` (
  `mcat_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mcat_name` varchar(255) NOT NULL,
  `tcat_id` int(11) NOT NULL
);

INSERT INTO `tbl_mid_category` (`mcat_id`, `mcat_name`, `tcat_id`) VALUES
(1, 'New Arrival bé trai', 1),
(2, 'Áo dài cách tân bé trai', 1),
(3, '1 - 5 tuổi', 1),
(4, '6 - 14 tuổi', 1),

(5, 'New Arrival bé gái', 2),
(6, 'Áo dài cách tân bé gái', 2),
(7, '1 - 5 tuổi', 2),
(8, '6 - 14 tuổi', 2),

(10, 'Bộ quần áo', 3),

(11, 'Giày bé trai', 4),
(12, 'Giày bé gái', 4),
(13,  'Phụ kiện làm đẹp', 4);


CREATE TABLE `tbl_end_category` (
  `ecat_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ecat_name` varchar(255) NOT NULL,
  `mcat_id` int(11) NOT NULL
);
INSERT INTO `tbl_end_category` (`ecat_id`, `ecat_name`, `mcat_id`) VALUES
(1, 'Áo', 3),
(2, 'Quần', 3),
(3, 'Áo dài', 3),
(4, 'Áo khoác', 3),
(5, 'Đồ bộ', 3),
(6, 'Áo sơ mi', 3),

(7, 'Áo', 4),
(8, 'Quần', 4),
(9, 'Áo dài', 4),
(10, 'Áo khoác', 4),
(11, 'Đồ bộ', 4),
(12, 'Áo sơ mi', 4),

(13,'Đầm',7),
(14, 'Áo', 7),
(15, 'Quần', 7),
(16, 'Áo dài', 7),
(17, 'Áo khoác', 7),
(18, 'Đồ bộ', 7),
(19, 'Yếm & Chân váy', 7),

(20,'Đầm',8),
(21, 'Áo', 8),
(22, 'Quần', 8),
(23, 'Áo dài', 8),
(24, 'Áo khoác', 8),
(25, 'Đồ bộ', 8),
(26, 'Yếm & Chân váy', 8),

(27,'Đồ bộ',10),
(28,'Đầm',10),
(29,'Khăn tắm',10),

(30,'Dép bé trai',11),
(31,'Giày bé trai',11),

(32,'Dép bé gái',12),
(33,'Giày bé gái',12),

(34,'Phụ kiện bé trai',13),
(35,'Phụ kiện bé gái',13);


CREATE TABLE `tbl_faq` (
  `faq_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `faq_title` varchar(255) NOT NULL,
  `faq_content` text NOT NULL
);


INSERT INTO `tbl_faq` (`faq_id`, `faq_title`, `faq_content`) VALUES
(1, 'Làm thế nào để tìm thấy một mục?', '<h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><font color=\"#222222\" face=\"opensans, Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15.7143px;\">Chúng tôi có một loạt các sản phẩm tuyệt vời để lựa chọn.</span></font></h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><span style=\"font-size: 15.7143px; color: rgb(34, 34, 34); font-family: opensans, \"Helvetica Neue\", Helvetica, Helvetica, Arial, sans-serif;\">Mẹo 1: Nếu bạn đang tìm kiếm một sản phẩm cụ thể, hãy sử dụng hộp tìm kiếm từ khóa nằm ở đầu trang web. Đơn giản chỉ cần gõ những gì bạn đang tìm kiếm, và chuẩn bị để được ngạc nhiên!</span></h3><h3 class=\"checkout-complete-box font-bold txt16\" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; margin: 0.2rem 0px 0.5rem; padding: 0px; line-height: 1.4; background-color: rgb(250, 250, 250);\"><font color=\"#222222\" face=\"opensans, Helvetica Neue, Helvetica, Helvetica, Arial, sans-serif\"><span style=\"font-size: 15.7143px;\">Mẹo 2: Nếu bạn muốn khám phá một danh mục sản phẩm, hãy sử dụng Danh mục cửa hàng ở menu phía trên và điều hướng qua các danh mục yêu thích của bạn, nơi chúng tôi sẽ giới thiệu những sản phẩm tốt nhất trong mỗi danh mục.</span></font><br><br></h3>\r\n'),
(2, 'Chính sách hoàn trả của shop là gì?', '<p><span style=\"color: rgb(10, 10, 10); font-family: opensans, &quot;Helvetica Neue&quot;, Helvetica, Helvetica, Arial, sans-serif; font-size: 14px; text-align: center;\">Bạn có 2 ngày để yêu cầu hoàn tiền sau khi đơn đặt hàng của bạn đã được giao.</span><br></p>\r\n'),
(3, 'Tôi nhận được một mặt hàng bị lỗi/hư hỏng, tôi có thể được hoàn lại tiền không?', '<p>Trong trường hợp mặt hàng bạn nhận được bị hư hỏng hoặc bị lỗi, bạn có thể trả lại mặt hàng trong tình trạng giống như khi bạn nhận được với hộp và/hoặc bao bì nguyên vẹn. Khi chúng tôi nhận được mặt hàng trả lại, chúng tôi sẽ kiểm tra mặt hàng đó và nếu mặt hàng đó bị lỗi hoặc hư hỏng, chúng tôi sẽ xử lý khoản hoàn trả cùng với bất kỳ khoản phí vận chuyển nào phát sinh.<br></p>\r\n'),
(4, 'Khi nào thì không thể trả hàng?', '<p class=\"a  \" style=\"box-sizing: inherit; text-rendering: optimizeLegibility; line-height: 1.6; margin-bottom: 0.714286rem; padding: 0px; font-size: 14px; color: rgb(10, 10, 10); font-family: opensans, &quot;Helvetica Neue&quot;, Helvetica, Helvetica, Arial, sans-serif; background-color: rgb(250, 250, 250);\">Có một vài tình huống nhất định khiến chúng tôi khó hỗ trợ trả hàng:</p><ol style=\"box-sizing: inherit; line-height: 1.6; margin-right: 0px; margin-bottom: 0px; margin-left: 1.25rem; padding: 0px; list-style-position: outside; color: rgb(10, 10, 10); font-family: opensans, &quot;Helvetica Neue&quot;, Helvetica, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(250, 250, 250);\"><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Yêu cầu đổi trả được thực hiện ngoài khung thời gian quy định, 5 ngày kể từ ngày giao hàng.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Sản phẩm đã qua sử dụng, bị hư hỏng hoặc không ở trong tình trạng như bạn nhận được.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Các loại cụ thể như quần áo tặng kèm,...</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Defective products which are covered under the manufacturer\'s warranty.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Bất kỳ vật phẩm tiêu hao nào đã được sử dụng hoặc lắp đặt.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Sản phẩm có số sê-ri bị giả mạo hoặc bị thiếu.</li><li style=\"box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;\">Mọi thứ còn thiếu trong gói hàng bạn nhận được bao gồm thẻ giá, nhãn, bao bì gốc, quà tặng và phụ kiện.</li></ol>\r\n'),
(5, 'Chất lượng sản phẩm như thế nào?', '<p>Shop xin cam kết chất lượng sản phẩm đúng 100% như mô tả của từng sản phẩm.</p>');


CREATE TABLE `tbl_payment` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `payment_date` varchar(50) NOT NULL,
  `txnid` varchar(255) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `bank_transaction_info` text NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `payment_status` varchar(25) NOT NULL,
  `shipping_status` varchar(20) NOT NULL,
  `payment_id` varchar(255) NOT NULL
);

INSERT INTO `tbl_payment` (`id`, `customer_id`, `customer_name`, `customer_email`, `payment_date`, `txnid`, `paid_amount`, `bank_transaction_info`, `payment_method`, `payment_status`, `shipping_status`, `payment_id`) VALUES
(1, 1, 'Nguyễn Thị Loan', 'loan@mail.com', '2022-12-9 22:50:50', '',89000,  'Chuyển khoản', 'Bank', 'Completed', 'Completed', '1001254745'),
(2, 1, 'Nguyễn Thị Loan', 'loan@mail.com', '2022-12-10 10:40:50', '', 169000, 'Thanh toán khi nhận hàng', 'Pay', 'Completed', 'Pending', '1658898544');

CREATE TABLE `tbl_product` (
  `p_id` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) NOT NULL,
  `p_old_price` decimal(10,0) NOT NULL,
  `p_current_price` decimal(10,0) NOT NULL,
  `p_qty` int(10) NOT NULL,
  `p_featured_photo` varchar(255) NOT NULL,
  `p_description` text NOT NULL,
  `p_feature` text NOT NULL,
  `p_condition` text NOT NULL,
  `p_return_policy` text NOT NULL,
`p_total_view` int(11) not null,
  `p_is_featured` int(1) NOT NULL,
  `p_is_active` int(1) NOT NULL,
  `ecat_id` int(11) NOT NULL
);

INSERT INTO `tbl_product` (`p_id`, `p_name`, `p_old_price`, `p_current_price`, `p_qty`, `p_featured_photo`, `p_description`, `p_feature`, `p_condition`, `p_return_policy`,`p_total_view` ,`p_is_featured`, `p_is_active`, `ecat_id`) VALUES
(1, 'ÁO THUN TAY DÀI BÉ TRAI', 223000, 89000, 77, 'product-featured-1.png', '', '','','', 0,0, 1, 1),
(2, 'ÁO LEN GILE BÉ TRAI', 200000, 169000, 100, 'product-featured-2.jpg', '', '','','', 0,1, 1, 1),
(3,'QUẦN KAKI TRẮNG BÉ TRAI',300000,223000,85,'product-featured-3.png','','','','',0,0,1,2),
(4, 'ÁO DÀI BÉ TRAI THÊU PHƯỢNG HOÀNG', 330000, 269000, 67, 'product-featured-4.png', '', '','','', 0,1, 1, 3),
(5, 'ÁO THUN NGẮN TAY BÉ TRAI', 199000, 139000, 80, 'product-featured-5.jpg', '', '','','', 0,0, 1, 1),

(6,'ÁO THUN NGẮN TAY IN HÌNH XE BÉ TRAI',99000,49000,83,'product-featured-6.jpg','','','','',0,0,1,1),
(7,'ÁO THUN SÁT NÁCH BÉ TRAI',99000,49000,58,'product-featured-7.png','','','','',0,1,1,1),
(8,'ÁO NỈ DÀI TAY BÉ TRAI IN HÌNH KHỦNG LONG',300000,223000,80,'product-featured-8.png','','','','',0,0,1,1),
(9, 'ÁO THUN DÀI TAY BÉ GÁI', 223000, 89000, 100, 'product-featured-9.png', '', '','','',0, 1, 1, 14),
(10, '[PRE-ORDER] BỘ ÁO DÀI CÁCH TÂN ELSA BÉ GÁI', 599000, 500000, 80, 'product-featured-10.png', '', '','','',0, 1, 1, 16),

(11,'BỘ THUN DÀI TAY BÉ GÁI',299000,269000,93,'product-featured-11.png','','','','',0,1,1,18),
(12,'ÁO KHOÁC GIÓ BÉ GÁI',269000,200000,108,'product-featured-12.png','','','','',0,1,1,17),
(13,'ÁO THUN CỔ BẺ NGẮN TAY BÉ GÁI',300000,269000,100,'product-featured-13.png','','','','',0,1,1,21),
(14,'BỘ THUN PIJAMA BÉ TRAI',300000,259000,89,'product-featured-14.png','','','','',0,1,1,5),
(15,'ÁO KHOÁC NỈ BÔNG DÀY BÉ TRAI',199000,169000,108,'product-featured-15.png','','','','',0,1,1,4),

(16,'ÁO THUN NGẮN TAY BÉ GÁI',199000,80000,104,'product-featured-16.png','','','','',0,1,1,21),
(17,'BALO TRẺ EM NGỰA PONY CÀI KHUY',399000,329000,100,'product-featured-17.png','','','','',0,1,1,35),
(18,'BALO/CẶP CHỐNG GÙ BÉ TRAI',500000,450000,97,'product-featured-18.png','','','','',0,1,1,34),
(19,'GIÀY DÉP SANDAL CAO SU MỀM',100000,60000,105,'product-featured-19.png','','','','',0,1,1,30),
(20,'GIÀY THỂ THAO BÉ TRAI ĐẾ MỀM',200000,159000,89,'product-featured-20.png','','','','',0,1,1,31),

(21,'ÁO THUN DÀI TAY BÉ TRAI',200000,169000,109,'product-featured-21.png','','','','',0,1,1,7),
(22,'ÁO THUN DÀI TAY BÉ TRAI - DESIGNED IN PARIS',200000,169000,100,'product-featured-22.png','','','','',0,1,1,7),
(23,'QUẦN JOGGER MICKEY BÉ TRAI',299000,269000,100,'product-featured-23.png','','','','',0,1,1,8),
(24,'ÁO KHOÁC GIÓ BÉ TRAI',529000,399000,100,'product-featured-24.png','','','','',0,1,1,10),
(25,'ÁO SƠ MI DÀI TAY BÉ TRAI',299000,249000,100,'product-featured-25.png','','','','',0,1,1,12);

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `size` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `unit_price` varchar(50) NOT NULL,
  `payment_id` varchar(255) NOT NULL
);

INSERT INTO `tbl_order` (`id`, `product_id`, `product_name`, `size`, `color`, `quantity`, `unit_price`, `payment_id`) VALUES
(1, 1, 'ÁO THUN TAY DÀI BÉ TRAI', 'M', 'Trắng', '1', '89000', '1001254745'),
(2, 1, 'ÁO LEN GILE BÉ TRAI', 'M', 'Nâu Sẫm', '1', '169000', '1658898544');


CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `about_title` varchar(255) NOT NULL,
  `about_content` text NOT NULL,
  `about_banner` varchar(255) NOT NULL,
  `about_meta_title` varchar(255) NOT NULL,
  `about_meta_keyword` text NOT NULL,

  `faq_title` varchar(255) NOT NULL,
  `faq_banner` varchar(255) NOT NULL,
  `faq_meta_title` varchar(255) NOT NULL,
  `faq_meta_keyword` text NOT NULL,

  `blog_title` varchar(255) NOT NULL,
  `blog_banner` varchar(255) NOT NULL,
  `blog_meta_title` varchar(255) NOT NULL,
  `blog_meta_keyword` text NOT NULL,
  `blog_meta_description` text NOT NULL,

  `contact_title` varchar(255) NOT NULL,
  `contact_banner` varchar(255) NOT NULL,
  `contact_meta_title` varchar(255) NOT NULL,
  `contact_meta_keyword` text NOT NULL
);

INSERT INTO `tbl_page` (`id`, `about_title`, `about_content`, `about_banner`, `about_meta_title`, `about_meta_keyword`, `faq_title`, `faq_banner`, `faq_meta_title`, `faq_meta_keyword`,`blog_title`, `blog_banner`, `blog_meta_title`, `blog_meta_keyword`, `blog_meta_description`, `contact_title`, `contact_banner`, `contact_meta_title`, `contact_meta_keyword`) VALUES
(1, 'About Us', '<p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\">Chào mùng đến với Turtle-K Shop!</p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">Chúng tôi mong muốn cung cấp cho khách hàng nhiều loại sản phẩm mới nhất. Mặc dù shop mới thành lập, nhưng chúng tôi biết chính xác nên đi theo hướng nào khi cung cấp cho bạn các sản phẩm chất lượng cao nhưng thân thiện với ngân sách. Chúng tôi cung cấp tất cả những điều này trong khi cung cấp dịch vụ khách hàng xuất sắc và hỗ trợ thân thiện.</span></p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">Chúng tôi luôn theo dõi các xu hướng mới nhất và đặt mong muốn của khách hàng lên hàng đầu. Đó là lý do tại sao chúng tôi đã làm hài lòng khách hàng và rất vui mừng được trở thành nơi các khách hàng tin tưởng và ủng hộ rất nhiều.
</span></p><p style=\"border: 0px solid; margin-top: 1.5rem; margin-bottom: 0px;\"><span style=\"border: 0px solid;\">Lợi ích của khách hàng luôn là ưu tiên hàng đầu đối với chúng tôi, vì vậy chúng tôi hy vọng bạn sẽ thích các sản phẩm của chúng tôi nhiều như chúng tôi thích cung cấp chúng cho bạn.</span></p><p style=\"\">Chúng tôi đảm bảo bạn sẽ có được những bộ trang phục chất lượng tốt nhất với chính sách đổi trả và đổi trả không rắc rối. Chúng tôi đảm bảo những gì bạn thấy chính xác là những gì bạn nhận được!</p><ul><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Giá cả hợp lý.</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Luôn hỗ trợ khách hàng 24/7</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Email - Nhắn tin - Gọi điện</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Chúng tôi luôn sẵn sàng hỗ trợ bạn 24/7 trực tuyến và qua điện thoại.</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Kích thước và màu sắc</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Giao hàng nhanh</span></font></li><li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Shop rất mong muốn nhận được nhiều sự ủng hộ của các quý khách hàng nhiều hơn.</span></font></li>
<li style=\"text-align: justify;\"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Dễ dàng đổi trả</span></font></li></ul><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Mua một bộ trang phục nhưng muốn trả lại nó? Chúng tôi có chính sách hoàn trả dễ dàng trong 3 ngày. Vui lòng mail cho chúng tôi theo địa chỉ khanhb1305@gmail.com.com để biết thêm chi tiết.</span></font></p><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Váy mơ ước cho mọi dịp</b></span></font></p><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Turtle-K Shop mang tất cả được lựa chọn cẩn thận bởi các nhà tạo mẫu của chúng tôi. Nếu bạn quan tâm đến một mẫu cụ thể, vui lòng gửi thư cho chúng tôi, chúng tôi sẽ cố gắng hết sức để cung cấp cho bạn chiếc váy yêu thích.</span></font></p><p style=\"text-align: justify; \"><font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Bảo mật đã xác minh</b></span></font></p><p style=\"text-align: justify; \">
<font face=\"apercu, Arial, sans-serif\"><span style=\"font-size: 14px;\">Tất cả các giao dịch của chúng tôi đều được Noron xác minh và với các tiêu chuẩn bảo mật cao nhất. Ngoài ra, còn có rất nhiều điều thú vị khác thông qua các ưu đãi và quà tặng thú vị thường xuyên, vì vậy hãy quảng bá và giới thiệu chúng tôi với mọi người từ gia đình, bạn bè và đồng nghiệp của bạn và nhận phần thưởng cho điều đó. Và trên hết, bạn có thể chia sẻ trải nghiệm người dùng của mình bằng cách đăng các bài đánh giá. Đừng chần chờ gì nữa Hãy đăng ký với chúng tôi ngay bây giờ! bắt đầu theo dõi, bắt đầu mua và bắt đầu yêu và bắt đầu Giới thiệu vẻ đẹp trong bạn.</span></font></p>
\r\n', 'about-banner.jpg', 'Turtle-K - About Us', 'about, about us, thời trang, shop, thông tin', 
'FAQ', 'faq-banner.jpg', 'Turtle-K - FAQ', '', 
'', 'Blog', 'blog-banner.jpg', 'Turtle-K - Blog', '',
'Liên hệ', 'contact-banner.jpg', 'Turtle-K - Contact', '');





CREATE TABLE `tbl_product_color` (
	 `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	 `color_id` int(11) NOT NULL,
	 `p_id` int(11) NOT NULL
);

INSERT INTO `tbl_product_color` (`id`,`color_id`, `p_id`) VALUES
(1,6,1), (2,15,1), (3,7,1),
(4,17,2), (5,18,2), 
(6,6,3),
(7,1,4),
(8,15,5), (9,19,5),
(10,7,7), (11,11,7), (12,12,7),
(13,6,6), (14,20,6),
(15,6,8), (16,19,8),
(17,10,9), (18,6,9), (19,1,9),
(20,10,10), (21,13,10),
(22,1,11), (23,4,11),
(24,10,12),
(25,6,13), (26,10,13),
(27,4,14), (28,3,14), (29,15,14),
(30,15,15), (31,3,15),
(32,6,16), (33,10,16), (34,13,16),
(35,3,17), (36,10,17),
(37,1,18),
(38,4,19), (39,10,19), (40,15,19),
(41,8,20),
(42,3,20),
(43,6,20),
(44,5,20),
(45,2,21),
(46,15,21),
(47,6,22),
(48,2,23),
(49,5,24),
(50,8,24),
(51,15,24),
(52,3,25),
(53,6,25)
;


CREATE TABLE `tbl_product_photo` (
  `pp_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `p_id` int(11) NOT NULL
);

INSERT INTO `tbl_product_photo` (`pp_id`, `photo`, `p_id`) VALUES
(1,'2.png',1),
(2,'3.png',1),
(3,'4.jpg',2),
(4,'5.jpg',2),
(5,'6.png',3),
(6,'7.png',3),
(7,'8.png',4),
(8,'9.png',4),
(9,'10.jpg',5),
(10,'11.jpg',5),
(11,'12.jpg',6),
(12,'13.jpg',6),
(13.,'14.png',7),
(14,'15.png',7),
(15,'16.png',8),
(16,'17.png',8),
(17,'18.png',9),
(18,'19.png',9),
(19,'20.png',10),
(20,'21.png',10),
(21,'22.png',11),
(22,'23.png',11),
(23,'24.png',12),
(24,'25.png',12),
(25,'26.png',13),
(26,'27.png',13),
(27,'28.png',14),
(28,'29.png',14),
(29,'30.png',15),
(30,'31.png',15),
(31,'32.png',16),
(32,'33.png',16),
(33,'34.png',17),
(34,'35.png',17),
(35,'36.png',18),
(36,'37.png',18),
(37,'38.png',19),
(38,'39.png',19),
(39,'40.png',20),
(40,'41.png',20),
(41,'42.png',21),
(42,'43.png',21),
(43,'44.png',22),
(44,'45.png',22),
(45,'46.png',23),
(46,'47.png',23),
(47,'48.png',24),
(48,'49.png',24),
(49,'50.png',25),
(50,'51.png',25)
;

CREATE TABLE `tbl_size` (
  `size_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `size_name` varchar(255) NOT NULL
);
INSERT INTO `tbl_size` (`size_id`, `size_name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL'),
(7, '3XL'),
(8, '31'),
(9, '32'),
(10, '33'),
(11, '34'),
(12, '35'),
(13, '36'),
(14, '37'),
(15, '38'),
(16, '39'),
(17, '40'),
(18, '41'),
(19, '42'),
(20, '43'),
(21, '44'),
(22, '45'),
(23, '46'),
(24, '47'),
(25, '48'),
(26, 'Free Size'),
(27, 'Oversize'),
(28, '10'),
(29, '12 Months');



CREATE TABLE `tbl_product_size` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `size_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL
);


INSERT INTO `tbl_product_size` (`id`,`size_id`, `p_id`) VALUES
(1,1,1),
(2,2,1),
(3,3,1),
(4,1,2),
(5,2,2),
(6,3,2),
(7,1,3),
(8,2,3),
(9,3,3),
(10,4,3),
(11,1,4),
(12,2,4),
(13,3,4),
(14,1,5),
(15,2,5),
(16,3,5),
(17,1,6),
(18,2,6),
(19,3,6),
(20,1,7),
(21,2,7),
(22,3,7),
(23,1,8),
(24,2,8),
(25,3,8),
(26,1,9),
(27,2,9),
(28,3,9),
(29,4,9),
(30,1,10),
(31,2,10),
(32,3,10),
(33,4,10),
(34,1,11),
(35,2,11),
(36,3,11),
(37,4,11),
(38,2,12),
(39,3,12),
(40,4,12),
(41,5,12),
(42,3,13),
(43,4,13),
(44,5,13),
(45,6,13),
(46,1,14),
(47,2,14),
(48,3,14),
(49,4,14),
(50,2,15),
(51,3,15),
(52,4,15),
(53,2,16),
(54,3,16),
(55,4,16),
(56,5,16),
(57,26,17),
(58,26,18),
(59,8,19),
(60,9,19),
(61,10,19),
(62,11,19),
(63,12,19),
(64,13,19),

(65,8,20),
(66,9,20),
(67,10,20),
(68,11,20),
(69,12,20),
(70,13,20),

(71,3,21),
(72,4,21),
(73,5,21),
(74,6,21),

(75,3,22),
(76,4,22),
(77,5,22),
(78,6,22),

(79,3,23),
(80,4,23),
(81,5,23),
(82,6,23),

(83,27,24),

(84,3,25),
(85,4,25),
(86,5,25),
(87,6,25);

CREATE TABLE `tbl_rating` (
  `rt_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `rating` int(11) NOT NULL
);

CREATE TABLE `tbl_service` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `photo` varchar(255) NOT NULL
);

INSERT INTO `tbl_service` (`id`, `title`, `content`, `photo`) VALUES
(5, 'Hoàn trả', 'Trả lại bất kì mặt hàng nào bị lỗi trước 5 ngày.', 'service-5.png'),
(6, 'Miễn phí vẫn chuyển', 'Tận hưởng giao hàng miễn phí trong TP.Cần Thơ.', 'service-6.png'),
(7, 'Chuyển phát nhanh', 'Các mặt hàng được vận chuyển trong vòng 24 giờ.', 'service-7.png'),
(8, 'Bảo đảm sự hài lòng', 'Chúng tôi đảm bảo cho bạn sự hài lòng về chất lượng.', 'service-8.png'),
(9, 'Thanh toán', 'Cung cấp tùy chọn thanh toán an toàn cho khách hàng.', 'service-9.png'),
(10, 'Hoàn tiền 100%', 'Bảo đảm hoàn lại tiền cho các sản phẩm hoàn trả sau 2 ngày.', 'service-10.png');

CREATE TABLE `tbl_settings` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  `logo` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `footer_about` text NOT NULL,
  `footer_copyright` text NOT NULL,
  `contact_address` text NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `contact_fax` varchar(20) NOT NULL,
  `contact_map_iframe` text NOT NULL,
  `receive_email` varchar(100) NOT NULL,
  `receive_email_subject` varchar(100) NOT NULL,
  `receive_email_thank_you_message` text NOT NULL,
  `forget_password_message` text NOT NULL,
  `total_recent_post_footer` int(10) NOT NULL,
  `total_popular_post_footer` int(10) NOT NULL,
  `total_recent_post_sidebar` int(11) NOT NULL,
  `total_popular_post_sidebar` int(11) NOT NULL,
  `total_featured_product_home` int(11) NOT NULL,
  `total_latest_product_home` int(11) NOT NULL,
  `total_popular_product_home` int(11) NOT NULL,

  `meta_title_home` text NOT NULL,
  `meta_keyword_home` text NOT NULL,
  `meta_description_home` text NOT NULL,
  `banner_login` varchar(255) NOT NULL,
  `banner_registration` varchar(255) NOT NULL,
  `banner_forget_password` varchar(255) NOT NULL,
  `banner_reset_password` varchar(255) NOT NULL,
  `banner_search` varchar(255) NOT NULL,
  `banner_cart` varchar(255) NOT NULL,
  `banner_checkout` varchar(255) NOT NULL,
  `banner_product_category` varchar(255) NOT NULL,
  `banner_blog` varchar(255) NOT NULL,
  `cta_title` varchar(255) NOT NULL,
  `cta_content` text NOT NULL,
  `cta_read_more_text` varchar(255) NOT NULL,
  `cta_read_more_url` varchar(255) NOT NULL,
  `cta_photo` varchar(255) NOT NULL,

  `featured_product_title` varchar(255) NOT NULL,
  `featured_product_subtitle` varchar(255) NOT NULL,
  `latest_product_title` varchar(255) NOT NULL,
  `latest_product_subtitle` varchar(255) NOT NULL,
  `popular_product_title` varchar(255) NOT NULL,
  `popular_product_subtitle` varchar(255) NOT NULL,
  `testimonial_title` varchar(255) NOT NULL,
  `testimonial_subtitle` varchar(255) NOT NULL,
  `testimonial_photo` varchar(255) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_subtitle` varchar(255) NOT NULL,
  `newsletter_text` text NOT NULL,
  `paypal_email` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `stripe_secret_key` varchar(255) NOT NULL,
  `bank_detail` text NOT NULL,
  `before_head` text NOT NULL,
  `after_body` text NOT NULL,
  `before_body` text NOT NULL,
  `home_service_on_off` int(11) NOT NULL,
  `home_welcome_on_off` int(11) NOT NULL,
  `home_featured_product_on_off` int(11) NOT NULL,
  `home_latest_product_on_off` int(11) NOT NULL,
  `home_popular_product_on_off` int(11) NOT NULL,
  `home_testimonial_on_off` int(11) NOT NULL,
  `home_blog_on_off` int(11) NOT NULL,
  `newsletter_on_off` int(11) NOT NULL,
  `ads_above_welcome_on_off` int(1) NOT NULL,
  `ads_above_featured_product_on_off` int(1) NOT NULL,
  `ads_above_latest_product_on_off` int(1) NOT NULL,
  `ads_above_popular_product_on_off` int(1) NOT NULL,
  `ads_above_testimonial_on_off` int(1) NOT NULL,
  `ads_category_sidebar_on_off` int(1) NOT NULL
);

INSERT INTO `tbl_settings` (`id`, `logo`, `favicon`, `footer_about`, `footer_copyright`, `contact_address`, `contact_email`, `contact_phone`, `contact_fax`, `contact_map_iframe`, `receive_email`, `receive_email_subject`, `receive_email_thank_you_message`, `forget_password_message`, `total_recent_post_footer`, `total_popular_post_footer`, `total_recent_post_sidebar`, `total_popular_post_sidebar`, `total_featured_product_home`, `total_latest_product_home`, `total_popular_product_home`, `meta_title_home`, `meta_keyword_home`, `meta_description_home`, `banner_login`, `banner_registration`, `banner_forget_password`, `banner_reset_password`, `banner_search`, `banner_cart`, `banner_checkout`, `banner_product_category`, `banner_blog`, `cta_title`, `cta_content`, `cta_read_more_text`, `cta_read_more_url`, `cta_photo`, `featured_product_title`, `featured_product_subtitle`, `latest_product_title`, `latest_product_subtitle`, `popular_product_title`, `popular_product_subtitle`, `testimonial_title`, `testimonial_subtitle`, `testimonial_photo`, `blog_title`, `blog_subtitle`, `newsletter_text`, `paypal_email`, `stripe_public_key`, `stripe_secret_key`, `bank_detail`, `before_head`, `after_body`, `before_body`, `home_service_on_off`, `home_welcome_on_off`, `home_featured_product_on_off`, `home_latest_product_on_off`, `home_popular_product_on_off`, `home_testimonial_on_off`, `home_blog_on_off`, `newsletter_on_off`, `ads_above_welcome_on_off`, `ads_above_featured_product_on_off`, `ads_above_latest_product_on_off`, `ads_above_popular_product_on_off`, `ads_above_testimonial_on_off`, `ads_category_sidebar_on_off`) VALUES
(1, 'logo.png', 'logo.png', 'footer about\r\n', 'Copyright © 2022 - Website Turtle-K  - Developed By Trần Tuấn Khanh', 'Đ.Trần Nam Phú, P.An Khánh, Q.Ninh Kiều, TP.Cần Thơ', 'khanhb1305@gmail.com', '+84369818290', '', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4192.55767369942!2d105.760173248042!3d10.035207439672567!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0883fbc944b83%3A0x77fc34233e5e1320!2zTmluaCBLaeG7gXUsIEPhuqduIFRoxqEsIFZpZXRuYW0!5e0!3m2!1sen!2snp!4v1670471180856!5m2!1sen!2snp" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
 'khanhb1305@gmail.com', 'Thư điện tử của khách truy cập từ trang web Turtle-K', 'Cảm ơn bạn đã gửi email. Chúng tôi sẽ sớm liên lạc lại với bạn.', 'Một liên kết xác nhận được gửi đến địa chỉ email của bạn. Bạn sẽ nhận được thông tin đặt lại mật khẩu trong đó.', 4, 4, 5, 5, 8, 8, 8, 'Turtle-K - Shop bán hàng uy tín và chất lượng', 'cửa hàng thời trang trực tuyến, cửa hàng trẻ em, đồ trẻ em', '', 'banner_login.jpg', 'banner_registration.jpg', 'banner_forget_password.jpg', 'banner_reset_password.jpg', 'banner_search.jpg', 'banner_cart.jpg', 'banner_checkout.jpg', 'banner_product_category.jpg', 'banner_blog.jpg', 'Chào mừng đến với Turtle Shop', '', 'Xem ngay', '#', 'cta.jpg',
 'SẢN PHẨM NỔI BẬT', 'Danh sách sản phẩm hot nhất năm nay', 'SẢN PHẨM MỚI NHẤT', 'Danh sách sản phẩm mới nhất', 'SẢN PHẨM PHỔ BIẾN', 'Danh sách sản phẩm bán chạy nhất', 
'Bản quyền', 'Xem khách hàng phản hồi như thế nào.', 'testimonial.jpg', 'Blog mới nhất', 'Xem tất cả các bài báo và tin tức mới nhất của chúng tôi từ bên dưới.', 'Đăng ký nhận bản tin của chúng tôi để biết các chương trình khuyến mãi và giảm giá mới nhất.', 'khanhb1305@gmail.com', 'pk_test_0SwMWadgu8DwmEcPdUPRsZ7b', 'sk_test_TFcsLJ7xxUtpALbDo1L5c1PN',
'Tên ngân hàng: Sacombank\r\nSố tài khoản: 935784212845\r\nChi nhánh: Turtle-K Shop\r\nTP: Cần Thơ', '', '', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);


CREATE TABLE `tbl_shipping_cost` (
   `shipping_cost_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 `country_id` int(11) NOT NULL,
  `amount` decimal(10) NOT NULL
);


INSERT INTO `tbl_shipping_cost` (`shipping_cost_id`, `country_id`, `amount`) VALUES
(1, 1, 30000),
(2, 2, 30000),
(3, 3, 30000),
(4, 4, 50000),
(5, 5, 50000),
(6, 6, 50000),
(7, 7, 30000),
(8,8,30000),
(9,9,50000),
(10,10,40000),
(11, 11,40000),
(12, 12, 30000),
(13,13,50000),
(14,14, 0),
(15,15, 40000),
(16,16, 40000),
(17,17, 40000),
(18,18, 50000),
(19,19, 30000),
(20,20, 30000),
(21,21, 40000),
( 22,22,50000),
(23,23, 50000),
(24, 24,50000),
(25, 25,50000),
(26, 26,50000),
(27, 27,50000),
(28,28,40000),
(29, 29,30000),
(30, 30,30000),
( 31,31,40000),
( 32,32,40000),
(33,33,30000),
(34, 34,40000),
(35, 35,40000),
( 36,36,50000),
(37, 37,50000),
(38, 38,40000),
( 39,39,30000),
( 40,40,40000),
( 41,41,40000),
(42, 42,40000),
(43,43,50000),
(44, 44,50000),
(45, 45,40000),
(46, 46,40000),
(47, 47,40000),
(48,48,40000),
(49,49,40000),
(50, 50,40000),
(51, 51,30000),
(52, 52,50000),
(53, 53,30000),
(54, 54,50000),
(55, 55,50000),
(56, 56,40000),
(57, 57,40000),
(58, 58,30000),
(59, 59,30000),
(60,60,50000),
(61, 61,30000),
(62,62,50000),
(63,63,50000);




CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `photo` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `button_text` varchar(255) NOT NULL,
  `button_url` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL
);

INSERT INTO `tbl_slider` (`id`, `photo`, `heading`, `content`, `button_text`, `button_url`, `position`) VALUES
(1, 'slider-1.png', 'Welcome to Christmas fashion', 'Mua sắm trực tuyến thời gian trẻ em.', 'Xem ngay', 'product-category.php?id=4&type=mid-category', 'Center'),
(2, 'slider-2.png', 'Giảm giá mạnh tất cả các mặt hàng ', 'Chương trình áp dụng đối tất cả các khách hàng', 'Mua ngay', 'product.php', 'Center'),
(3, 'slider-3.png', 'Hỗ trợ khách hàng 24/7', '', 'Xem chi tiết', 'about.php', 'Right');


CREATE TABLE `tbl_social` (
  `social_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `social_name` varchar(30) NOT NULL,
  `social_url` varchar(255) NOT NULL,
  `social_icon` varchar(30) NOT NULL
);

INSERT INTO `tbl_social` (`social_id`, `social_name`, `social_url`, `social_icon`) VALUES
(1, 'Facebook', 'https://www.facebook.com/#', 'fa fa-facebook'),
(2, 'Twitter', 'https://www.twitter.com/#', 'fa fa-twitter'),
(3, 'Tiktok', '', ''),
(4, 'Pinterest', '', 'fa fa-pinterest'),
(5, 'YouTube', 'https://www.youtube.com/#', 'fa fa-youtube'),
(6, 'Instagram', 'https://www.instagram.com/#', 'fa fa-instagram');

CREATE TABLE `tbl_user` (
  `id` int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL
);
INSERT INTO `tbl_user` (`id`, `full_name`, `email`, `phone`, `password`, `photo`, `role`, `status`) VALUES
(1, 'Admin', 'admin@gmail.com', '0369818290', 'd00f5d5217896fb7fd601412cb890830', 'user-1.png', 'Admin', 'Active');
select * from tbl_rating;