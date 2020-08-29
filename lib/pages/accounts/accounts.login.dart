import 'package:flutter/material.dart';
import 'package:localregex/localregex.dart';
import 'package:ukwenza/constants/index.dart';
import 'package:ukwenza/pages/accounts/accounts.signup.dart';
import 'package:ukwenza/pages/index.dart';
import 'package:ukwenza/services/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = new AuthService();
  bool _isLoading = false;
  final regex = new LocalRegex();
  final _emailTextEditingController = new TextEditingController();
  final _passwordTextEditingController = new TextEditingController();

  logIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      var value = await _authService.signInWithEmailAndPassword(
        email: _emailTextEditingController.text,
        password: _passwordTextEditingController.text,
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
                    ukwenzaBlue,
                  ],
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
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
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
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
                                  return regex.isEconet(value)
                                      ? null
                                      : "Please provide a valid email";
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
                                vertical: 15.0,
                                horizontal: 15.0,
                              ),
                              child: Container(
                                width: getWidth(context),
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage(),
                                    ),
                                  ),
                                  child: Text(
                                    "Forgot your password?",
                                    style: TextStyle(
                                      color: ukwenzaWhite.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                  ),
                                ),
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
                                    logIn();
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: ukwenzaBlack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: getWidth(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Not yet a member? ",
                                    style: TextStyle(
                                      color: ukwenzaWhite.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    ),
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                        color: ukwenzaWhite,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Text(
                                "or login with",
                                style: TextStyle(
                                  color: ukwenzaWhite.withOpacity(0.6),
                                ),
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
                                  color: ukwenzaDeepBlue.withOpacity(0.3),
                                ),
                                width: getWidth(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      onPressed: null,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                            ),
                                            child: Image(
                                              color: ukwenzaWhite,
                                              image: AssetImage(
                                                "assets/images/gg.png",
                                              ),
                                              height: 20,
                                            ),
                                          ),
                                          Text(
                                            "Google",
                                            style: TextStyle(
                                              color: ukwenzaWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    VerticalDivider(),
                                    MaterialButton(
                                      onPressed: null,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                            ),
                                            child: Image(
                                              color: ukwenzaWhite,
                                              image: AssetImage(
                                                "assets/images/fb.png",
                                              ),
                                              height: 20,
                                            ),
                                          ),
                                          Text(
                                            "Facebook",
                                            style: TextStyle(
                                              color: ukwenzaWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
