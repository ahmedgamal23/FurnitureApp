import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';

abstract class BaseDetailsRepository{
  Future<FurnitureDetails> getFurnitureDetails(int id);
}
