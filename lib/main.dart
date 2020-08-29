import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ukwenza/constants/index.dart';
import 'package:ukwenza/pages/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        while (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return MaterialApp(
          title: 'ukwenza',
          theme: ThemeData(
            fontFamily: 'WorkSans',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(
            seconds: 5,
            backgroundColor: ukwenzaWhite,
            title: Text(
              "ukwenza",
              style: TextStyle(
                color: ukwenzaBlue,
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
            loaderColor: Colors.transparent,
            loadingText: Text(
              "collaborate on a new level",
              style: TextStyle(
                color: ukwenzaBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
            navigateAfterSeconds: LoginPage(),
          ),
        );
      },
    );
  }
}
