import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/controller/homescreen_controller/homescreen_controller.dart';
import 'package:sampleproviderproject/model/shop_model/shop_model_class.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/cart_screen/cart.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key, required this.imageIndex});
  final int imageIndex;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  ShopProvider shop = ShopProvider();

  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomeScreenController>(context, listen: true);
    final counter = Provider.of<ShopProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Cartscreen(),
              ));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            homeProvider.shop[widget.imageIndex].images[0]),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  homeProvider.shop[widget.imageIndex].title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.amber,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "MRP: ₹${homeProvider.shop[widget.imageIndex].price}",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 100,
                  child: Text(
                    maxLines: 4,
                    homeProvider.shop[widget.imageIndex].description.toString(),
                    style: TextStyle(
                        fontSize: 15, overflow: TextOverflow.ellipsis),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Quantity",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        counter.decrement();
                      },
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.black,
                        size: 27,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${counter.current_Index}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        counter.increment();
                      },
                      child:
                          Icon(Icons.add_circle, color: Colors.black, size: 27),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Price :",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                          Text(
                              "₹${(counter.current_Index * homeProvider.shop[widget.imageIndex].price).toStringAsFixed(2)}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis))
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (counter.current_Index <= 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Please select a quantity greater than zero.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            Provider.of<ShopProvider>(context, listen: false)
                                .additem(
                              ShopModelClass(
                                pName:
                                    homeProvider.shop[widget.imageIndex].title,
                                pImage: homeProvider
                                    .shop[widget.imageIndex].images[0],
                                pPrice: (counter.current_Index *
                                        homeProvider
                                            .shop[widget.imageIndex].price)
                                    .toInt(),
                                pQuantity: counter.current_Index,
                                inPrice:
                                    homeProvider.shop[widget.imageIndex].price,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Center(child: Text('Item added to cart')),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shop,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Add To Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
