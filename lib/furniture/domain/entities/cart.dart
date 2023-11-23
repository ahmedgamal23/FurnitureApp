import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final int id;
  final String imagePath;
  final String imageName;
  final double price;

  const Cart({required this.id,required this.imagePath,required this.imageName,required this.price});

  @override
  List<Object?> get props => [];
}
