import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/api_controller/OrderController.dart';
import 'package:gomart/api_controller/addressCongtroller.dart';
import 'package:gomart/api_controller/cartController.dart';
import 'package:gomart/pages/Paymentpgdone.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Mypayment extends GetxController {
  var addController = Get.put(AddressControlller());
  var cartController = Get.put(CartController());
  var orderController = Get.put(OrderController());
  var box = GetStorage();
  late Razorpay _razorpay;
  TextEditingController amountct = TextEditingController();
  opencheckout(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_AUl9nW1XSEcQgY',
      'amount': amount,
      'name': box.read("user_name"),
      'prefill': {
        'contact': box.read("user_number"),
        'email': box.read("user_email")
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('error: $e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "payment succeesful" + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
    orderController.addOrderApi(
        cartController.getCartItem, addController.address);
    Get.to(Paymentpage_Done());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "payment Failed" + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "payment done" + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
}
