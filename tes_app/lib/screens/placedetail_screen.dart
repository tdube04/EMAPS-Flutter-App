import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatefulWidget {
  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(')'),
      ),
      body:Container(
        child: GridView.count(
          crossAxisCount: 2,
            children: <Widget>[
              Card(
                child: InkWell(
                  onTap: (){},
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[]
                    ),
                  )
                ),)
            ],
        )
      )
    );
  }
}