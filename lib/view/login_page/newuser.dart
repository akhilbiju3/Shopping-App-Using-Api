import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/provider/loginpage_provider.dart';
import 'package:sampleproviderproject/view/login_page/account_created.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key});

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  SharedPreferences? storage;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    storage = await SharedPreferences.getInstance();
  }

  void save() {
    storage?.setString('username', _usernameController.text);
    storage?.setString('password', _passwordController.text);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AccountCreated(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var loginPageProvider = Provider.of<LoginProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("New User"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Enter a Username', border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: loginPageProvider.isobscureText,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginPageProvider.isobscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      loginPageProvider.toggleObscureText();
                    },
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Enter a Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: save,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
