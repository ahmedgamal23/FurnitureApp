import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/furniture/domain/entities/furniture_details.dart';
import 'package:furniture_app/furniture/presentation/controller/details_state.dart';
import '../../domain/usecase/details_usecase.dart';
import 'details_event.dart';

class DetailsBloc extends Bloc<DetailsEvent , DetailsState>{
  final BaseDetailsUseCase baseDetailsUseCase;

  DetailsBloc(this.baseDetailsUseCase):super(const InitialState()){
    /// ------
    on<DetailsDataEvent>((event, emit) async {
      final result = await baseDetailsUseCase.execute(event.id);
      List<FurnitureDetails> updatedDetailsData = List.from(state.detailsList)..add(result);
      emit(DetailsDataState(detailsList: updatedDetailsData));
    });
  }

}
