import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';

class CartScreenWidget extends StatefulWidget {
  final String productName;
  final int productPrice;
  final String productQuantity;
  final String productImage;
  final int index;
  final int individualPrice;
  const CartScreenWidget(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productImage,
      required this.index, required this.individualPrice});

  @override
  State<CartScreenWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<CartScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ShopProvider>(context);
    int totalPrice =
        counter.itemList[widget.index].pQuantity * widget.individualPrice;
    return Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.productImage),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      softWrap: true,
                      maxLines: 1,
                      widget.productName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Total Price :${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          counter.decrementItemQuantity(widget.index);
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
                        "${widget.productQuantity}",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          counter.incrementItemQuantity(widget.index);
                        },
                        child: Icon(Icons.add_circle,
                            color: Colors.black, size: 27),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              counter.deleteitem(widget.index);
                            },
                            child: Icon(Icons.delete)),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
