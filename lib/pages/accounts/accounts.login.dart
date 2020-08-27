import 'package:flutter/material.dart';
import 'package:ukwenza/constants/index.dart';
import 'package:ukwenza/services/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = new AuthService();
  bool _isLoading = false;
  final _emailTextEditingController = new TextEditingController();
  final _passwordTextEditingController = new TextEditingController();

  logMeIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      var value = await _authService.signInWithEmailAndPassword(
        _emailTextEditingController.text,
        _passwordTextEditingController.text,
      );
      print(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Container(
              height: getHeight(context),
              width: getWidth(context),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ukwenzaMainBlue1,
                    ukwenzaMainBlue2,
                  ],
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: getHeight(context),
                    width: getWidth(context),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ukwenzaMainBlue1,
                          ukwenzaMainBlue2,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login to\nYour Account",
                            style: TextStyle(
                              color: ukwenzaWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ukwenzaDeepBlue,
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: _emailTextEditingController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Email",
                                      labelStyle: accountsFormTextStyle,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      return value.isEmpty
                                          ? "Please provide email"
                                          : null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: ukwenzaDeepBlue,
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: _passwordTextEditingController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "Password",
                                      labelStyle: accountsFormTextStyle,
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      return value.length > 6
                                          ? null
                                          : "Provide password 6+ characters";
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5.0,
                                  ),
                                  child: Text(
                                    "forgot your password?",
                                    style: TextStyle(
                                      color: ukwenzaWhite,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        10.0,
                                      ),
                                      color: ukwenzaWhite,
                                    ),
                                    width: getWidth(context),
                                    child: MaterialButton(
                                      onPressed: () {
                                        logMeIn();
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: ukwenzaDeepBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        color: ukwenzaDeepBlue,
                                      ),
                                    ),
                                    Text(
                                      "Signup",
                                      style: TextStyle(
                                        color: ukwenzaWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Center(
                      child: Container(
                        width: getWidth(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
