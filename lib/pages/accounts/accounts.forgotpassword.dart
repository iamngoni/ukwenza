import 'package:flutter/material.dart';
import 'package:localregex/localregex.dart';
import 'package:ukwenza/constants/index.dart';
import 'package:ukwenza/services/index.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _authService = new AuthService();
  bool _isLoading = false;
  final regex = new LocalRegex();
  final _emailTextEditingController = new TextEditingController();

  resetPassword() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      var value = await _authService.resetPassword(
        email: _emailTextEditingController.text,
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
              child: Stack(
                children: [
                  Container(
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
                            "Reset Password",
                            style: TextStyle(
                              color: ukwenzaWhite,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
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
                                  height: 30,
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
                                        resetPassword();
                                      },
                                      child: Text(
                                        "Reset Password",
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
