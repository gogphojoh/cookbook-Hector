// Example: Images -> Display images from the internet
import 'package:flutter/material.dart';

class ImageFromInternet extends StatelessWidget {
  const ImageFromInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network('https://picsum.photos/250?image=9'),
    );
  }
}