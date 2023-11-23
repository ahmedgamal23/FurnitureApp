import 'package:flutter/material.dart';
import 'package:furniture_app/furniture/presentation/componant/add_cart_section.dart';
import 'package:furniture_app/furniture/presentation/componant/description_section.dart';

class DetailsPageBody extends StatelessWidget {
  final int id;
  final String imagePath;
  final String imageName;
  final double price;
  const DetailsPageBody({super.key , required this.id , required this.imagePath ,required this.imageName , required this.price});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// 1
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height-150,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  /// for image details
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.fill
                      ),
                    ),
                  ),
                  /// title
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10 , left: 10),
                    child: const Text(
                      "Wood Frame",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  /// price
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10 , left: 10),
                    child: Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  /// name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10 , left: 10),
                    child: Text(
                      imageName,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  /// description
                  DescriptionSection(id: id),
                ],
              ),
            ),
          ),
          ///2
          AddCartSection(id: id , imageName: imageName , imagePath: imagePath , price: price),
        ],
      ),

    );
  }
}
