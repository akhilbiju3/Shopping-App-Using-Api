import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sampleproviderproject/view/home_screen/shop_homepage.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset('assets/lottie/Animation - 1699601245203.json'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>ShopHome(),
                  ));
                },
                child: Text("Continue Shooping"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
