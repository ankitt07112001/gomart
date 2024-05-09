import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gomart/model/foodlist.dart';
import 'package:gomart/pages/Addresspg.dart';
import 'package:gomart/pages/Listview.dart';
import 'package:gomart/pages/Paymentpg.dart';
import 'package:gomart/pages/Paymentpgdone.dart';
import 'package:gomart/pages/cart.dart';
import 'package:gomart/pages/catdetail.dart';
import 'package:gomart/pages/explore.dart';
import 'package:gomart/pages/favourite.dart';
import 'package:gomart/pages/foodalldetails.dart';
import 'package:gomart/pages/home.dart';
import 'package:gomart/pages/mainscreen.dart';
import 'package:gomart/pages/profile_desing.dart';
import 'package:gomart/pages/shop.dart';
import 'package:gomart/pages/splashscreen.dart';
import 'package:provider/provider.dart';
import 'model/favoriteprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Shop()),
      ChangeNotifierProvider(create: (context) => Favprovider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splashscreen(),
        routes: {
          "catdetail": (context) => Mycatdetail(
                title: '',
              ),
          "home": (context) => Myhome(),
          "mainscreen": (context) => Mymainscreen(),
          "explore": (context) => Myexplore(
                visible: true,
                // title: '',
              ),
          "cart": (context) => Mycart(
                visible: true,
              ),
          "favourite": (context) => Favourite(
                visible: true,
              ),
          "profile_desining": (context) => profile(
                visible: true,
              ),
          "foodalldetails": (context) => Myalldetails(),
          "splashscreen": (context) => Splashscreen(),
          "Addresspg": (context) => Addresspg(),
          "Paymentpg": (context) => Paymentpg(),
          "listview": (context) => Mylistview(),
          "Paymentpgdone": (context) => Paymentpage_Done(),
          "shop": (context) => Myshop(),
        },
      ),
    );
  }
}
