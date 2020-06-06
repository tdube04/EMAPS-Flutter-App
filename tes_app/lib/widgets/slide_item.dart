import 'package:flutter/material.dart';
import '../models/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape:BoxShape.circle,
            image: DecorationImage(image:AssetImage(slideList[index].imageUrl),
            fit: BoxFit.cover,
            )
          ),
        ),
        SizedBox(height: 15,),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize:22,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 10,),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}



