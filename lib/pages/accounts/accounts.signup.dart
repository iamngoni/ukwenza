import 'package:flutter/material.dart';
import 'package:localregex/localregex.dart';
import 'package:ukwenza/constants/index.dart';
import 'package:ukwenza/services/index.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = new AuthService();
  bool _isLoading = false;
  final regex = new LocalRegex();
  final _nameTextEditingController = new TextEditingController();
  final _surnameTextEditingController = new TextEditingController();
  final _emailTextEditingController = new TextEditingController();
  final _passwordTextEditingController = new TextEditingController();

  signMeUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      var value = await _authService.signUpWithEmailAndPassword(
        name: _nameTextEditingController.text,
        surname: _surnameTextEditingController.text,
        email: _emailTextEditingController.text,
        password: _passwordTextEditingController.text,
      );
      print(value);
    }
  }

  _onTapBack() {
    return Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -15.0,
        backgroundColor: ukwenzaMainBlue1,
        elevation: 0,
        leading: GestureDetector(
          onTap: _onTapBack,
          child: Icon(
            Icons.chevron_left,
            size: 30,
          ),
        ),
        title: GestureDetector(
          onTap: _onTapBack,
          child: Text(
            "Back",
          ),
        ),
      ),
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
              child: Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create an Account",
                        style: TextStyle(
                          color: ukwenzaWhite,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: ukwenzaWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: ukwenzaWhite,
                            ),
                            Text(
                              "Add photo",
                              style: TextStyle(
                                color: ukwenzaWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
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
                                controller: _nameTextEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Name",
                                  labelStyle: accountsFormTextStyle,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return value.isEmpty
                                      ? "Please provide a name"
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
                                controller: _surnameTextEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Surname",
                                  labelStyle: accountsFormTextStyle,
                                ),
                                keyboardType: TextInputType.name,
                                validator: (value) {
                                  return value.isEmpty
                                      ? "Please provide a surname"
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
                                alignment: Alignment.center,
                                child: Text(
                                  "Terms of Service and Privacy Policy",
                                  style: TextStyle(
                                    color: ukwenzaWhite.withOpacity(0.6),
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
                                    signMeUp();
                                  },
                                  child: Text(
                                    "Create",
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
