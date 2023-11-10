import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sampleproviderproject/model/api_model_class/api_model_class.dart';

class HomeScreenController extends ChangeNotifier {
  bool isLoading = false;
  var shop;
  StoreApiRsponse? userresponse;
  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    var response = await http.get(url);
    print(response.body);
    var decodedData = jsonDecode(response.body);
    shop = decodedData.map((e) => StoreApiRsponse.fromJson(e)).toList();
    print("id=${shop[8].title}");

    isLoading = false;
    notifyListeners();
  }
}
