import 'package:flutter/material.dart';
import 'package:tes_app/screens/dashboard_screen.dart';
import 'screens/getting_started_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) =>Dashboard() // instead of GettingStartedScreen()
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => // this will remove the error now
            Scaffold(
          body: Center(
              child: FlutterLogo(
            size: 400,
          ),
        ),
        ),
      ),
      // routes: {
      //   LoginScreen.routeName: (ctx) => LoginScreen(),
      // },
    );
  }
}
