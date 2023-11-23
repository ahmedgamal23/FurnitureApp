import 'package:equatable/equatable.dart';

class FurnitureDetails extends Equatable{
  final int id;
  final String description;
  const FurnitureDetails({required this.id ,required this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [id , description];
}
