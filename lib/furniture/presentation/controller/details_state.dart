import 'package:equatable/equatable.dart';
import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';

abstract class DetailsState extends Equatable{
  final List<FurnitureDetails> detailsList;

  const DetailsState({required this.detailsList});

  @override
  List<Object> get props =>[detailsList];
}

class InitialState extends DetailsState{
  const InitialState({List<FurnitureDetails> detailsList = const []}):super(detailsList: detailsList);
}

class DetailsDataState extends DetailsState{
  const DetailsDataState({required List<FurnitureDetails> detailsList}):super(detailsList: detailsList);
}
