import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
 bool isobscureText = true;

 
  void toggleObscureText() {
    
      isobscureText = !isobscureText;
      notifyListeners();
  }
}