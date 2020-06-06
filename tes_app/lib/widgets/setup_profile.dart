import 'package:flutter/material.dart';
import 'package:tes_app/screens/formadd/form_add_screen.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class SetUpProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
      ),
      home: Scaffold(
        key: _scaffoldState,
        
        body: FormAddScreen(),
      ),
    );
  }
}
