import 'package:get/get.dart';
import 'package:gomart/api_controller/api_method.dart';

import '../model/api_model/GetFavModel.dart';

class FavouriteController extends GetxController {
  var GetfavouriteList = [].obs;
  var isLoadingGetFav = false.obs;
  var isLoadingDelete = false.obs;
  favouriteApi(id, like) async {
    var mydata = {"item_id": id, "like_status": like};
    print("id" + id.toString());
    await Api_Method()
        .getapi(api_name: "addFavorite", data: mydata)
        .then((value) {
      print(value.toString());
      if (value['status'] == true) {
        Get.snackbar("Successfull", value['message'].toString());
      } else {
        Get.snackbar("retry", value['message'].toString());
      }
    });
  }

  getFavouriteApi() async {
    isLoadingGetFav.value = true;
    await Api_Method()
        .getapi(api_name: "getFavoriteList", data: []).then((value) {
      GetFavouriteModel getfav = GetFavouriteModel.fromJson(value);
      GetfavouriteList.value = getfav.data;
      print(value.toString());
      if (value['status'] == true) {
        isLoadingGetFav.value = false;
        print("loading" + isLoadingGetFav.value.toString());
      } else {
        isLoadingGetFav.value = false;
      }
      isLoadingGetFav.value = false;
    });
  }

  deleteFavApi(id, index) async {
    isLoadingDelete.value = true;
    var mydata = {"id": id};
    await Api_Method()
        .getapi(api_name: "RemoveFavorite", data: mydata)
        .then((value) {
      if (value["status"] == true) {
        Get.snackbar("Successfull", value["message"]);
        isLoadingDelete.value = false;
        GetfavouriteList.removeAt(index);
      } else {
        Get.snackbar("Retry", value["message"]);
        isLoadingDelete.value = false;
      }
      isLoadingDelete.value = false;
    });
  }
}
