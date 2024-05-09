import 'package:get/get.dart';
import 'package:gomart/api_controller/api_method.dart';

class RatingController extends GetxController {
  var rating;
  var review;
  ratingApi(itemid) async {
    var mydata = {"order_review": "good", "rating": "2.3", "item_id": itemid};
    await Api_Method()
        .getapi(api_name: "addRating", data: mydata)
        .then((value) {
      print(value.toString());
      if (value['status'] == true) {
        rating = value['rating'];
        review = value['order_review'];
      }
    });
  }
}
