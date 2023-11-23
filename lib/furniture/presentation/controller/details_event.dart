import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable{
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class DetailsDataEvent extends DetailsEvent{
  final int id;
  const DetailsDataEvent({required this.id});
}
