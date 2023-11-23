import 'package:flutter/material.dart';
import '../componant/details_page_body.dart';

class DetailsPage extends StatelessWidget {
  final int id;
  final String imagePath;
  final String imageName;
  final double price;
  const DetailsPage({super.key , required this.id , required this.imagePath ,required this.imageName , required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: DetailsPageBody(id:id , imagePath: imagePath , imageName: imageName , price: price),
      ),
    );
  }
}
