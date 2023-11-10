import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sampleproviderproject/view/home_screen/shop_homepage.dart';
class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then(
        (value) => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ShopHome(),
            )));
  }
  
       

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/loginsucess.json'),
          )
        ],
      ),
    );
  }
}
