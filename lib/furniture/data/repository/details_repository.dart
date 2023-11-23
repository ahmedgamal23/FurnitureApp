import 'package:furniture_app/furniture/data/datasource/details_datsource.dart';
import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';
import 'package:furniture_app/furniture/domain/repository/base_details_repository.dart';

class DetailsRepository extends BaseDetailsRepository{
  final BaseDetailsDataSource baseDetailsDataSource;
  DetailsRepository(this.baseDetailsDataSource);

  @override
  Future<FurnitureDetails> getFurnitureDetails(int id) async{
    return await baseDetailsDataSource.getFurnitureDetails(id);
  }
}
