import 'package:equatable/equatable.dart';

class Furniture extends Equatable{
  /// CategoryPart
  final int categoryId;
  final String categoryName;
  final String categoryImage;
  final int categoryCount;
  /// RecommendedPart
  final int recommendedId;
  final String recommendedName;
  final String recommendedImage;
  final double recommendedPrice;


  const Furniture(
      {required this.categoryId,
      required this.categoryName,
      required this.categoryImage,
      required this.categoryCount,
      required this.recommendedId,
      required this.recommendedName,
      required this.recommendedImage,
      required this.recommendedPrice,
      });

  @override
  List<Object?> get props => [categoryId , categoryName , categoryImage , categoryCount ,
                              recommendedId , recommendedName , recommendedImage , recommendedPrice];
}
