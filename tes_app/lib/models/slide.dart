import 'package:flutter/material.dart';

class Slide{
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/image1.jpg',
    title: 'A Cool Way To Get Started',
    description: 'Excellent Tutorials is a Private Science-Commercial Specialized College which was launched in 2008, and after a series of continuous assessment it was then registered with the Ministry ',
  ),
   Slide(
    imageUrl: 'assets/images/image2.jpg',
    title: 'Get Help On Button Click',
    description: 'Excellent Tutorials is a Private Science-Commercial Specialized College which was launched in 2008, and after a series of continuous assessment it was then registered with the Ministry ',
  ), Slide(
    imageUrl: 'assets/images/image3.jpg',
    title: 'It\'s Just the Beginning',
    description: 'Excellent Tutorials is a Private Science-Commercial Specialized College which was launched in 2008, and after a series of continuous assessment it was then registered with the Ministry ',
  ),
];