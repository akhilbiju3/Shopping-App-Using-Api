import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/controller/homescreen_controller/homescreen_controller.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/home_screen/shop_homepage.dart';
import 'package:sampleproviderproject/view/splash_screen/splash.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShopProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenController(),)
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
