import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/cart_screen/cart_screen_widget/cart_screen_widget.dart';
import 'package:sampleproviderproject/view/order_placed_screen/order.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    final cartScreenProvider = Provider.of<ShopProvider>(context);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 50.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed:cartScreenProvider.itemList.isNotEmpty
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderPlaced(),
                        ));
                      }
                    :() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Empty Cart"),
                              content: Text("Your cart is empty."),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                child: Text('Order Now'),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Container(
        child: ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return CartScreenWidget(
                productName: cartScreenProvider.itemList[index].pName,
                productPrice: cartScreenProvider.itemList[index].pPrice,
                productImage: cartScreenProvider.itemList[index].pImage,
                productQuantity:
                    cartScreenProvider.itemList[index].pQuantity.toString(),
                individualPrice: cartScreenProvider.itemList[index].inPrice,
                index: index,
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: cartScreenProvider.itemList.length),
      ),
    );
  }
}
