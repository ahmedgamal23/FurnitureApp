import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';
import 'package:furniture_app/furniture/domain/repository/base_details_repository.dart';

abstract class BaseDetailsUseCase{
  Future<FurnitureDetails> execute(int id);
}

class DetailsUseCase extends BaseDetailsUseCase{
  final BaseDetailsRepository baseDetailsRepository;
  DetailsUseCase(this.baseDetailsRepository);

  @override
  Future<FurnitureDetails> execute(int id) {
    return baseDetailsRepository.getFurnitureDetails(id);
  }
}
