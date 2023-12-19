class AppLink {
  static const String server = "https://dilkhoshsaadon.shop";
//! Image Link-=-----------------------------
  // static const String imageststatic =
  //     "http://192.168.0.191/upload";
  // static const String linkStaticImageItems =
  //     "http://192.168.0.191/ecommerece/upload";
//! Categories Image :
  static const String imagestCategories =
      "https://dilkhoshsaadon.shop/upload/catagories/";
//! Items Image :
  static const String imagestItems =
      "https://dilkhoshsaadon.shop/upload/items/";
//! Consatnt Image :
  static const String imagesConstant =
      "https://dilkhoshsaadon.shop/upload/constant/";
  static const String test = "$server/test.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String getUser = "$server/auth/get_user.php";
  static const String updateUser = "$server/auth/update_user.php";
  static const String verifycodessignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/auth/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/auth/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/auth/forgetpassword/verifycode.php";

  //! Home
  static const String homepage = "$server/home.php";

  //! items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";
  static const String itemsImage = "$server/items/items_image.php";

  //! Favorite
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  //! Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  //! Address
  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  //! Coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //! Orders
  static const String checkout = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String rating = "$server/rating.php";
  //! Notification;
  static const String deleteNotification = "$server/notifications/delete.php";
  static const String viewnotification = "$server/notifications/view.php";
  static const String readNotification = "$server/notifications/read.php";
  static const String offers = "$server/offers.php";
}
