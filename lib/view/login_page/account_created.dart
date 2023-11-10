import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sampleproviderproject/view/login_page/login_page.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key});

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Loginpage(),
            )));

    Future.delayed(Duration(seconds: 3), () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              
              content: Text('Login With Your New Credentials'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/accountcreated.json'),
          )
        ],
      ),
    );
  }
}
