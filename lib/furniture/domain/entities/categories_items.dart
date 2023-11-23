import 'package:equatable/equatable.dart';

class CategoriesItems extends Equatable{

  final int id;
  final String image;
  final String name;
  final int price;


  const CategoriesItems({required this.id,required this.image,required this.name,required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [id ,  image , name , price];
}
