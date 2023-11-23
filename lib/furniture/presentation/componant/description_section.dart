import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/details_datsource.dart';
import '../../data/repository/details_repository.dart';
import '../../domain/repository/base_details_repository.dart';
import '../../domain/usecase/details_usecase.dart';
import '../controller/details_bloc.dart';
import '../controller/details_event.dart';
import '../controller/details_state.dart';

class DescriptionSection extends StatelessWidget {
  final int id;
  const DescriptionSection({super.key , required this.id});

  @override
  Widget build(BuildContext context) {
    BaseDetailsDataSource baseDetailsDataSource = DetailsDataSource();
    BaseDetailsRepository baseDetailsRepository = DetailsRepository(baseDetailsDataSource);
    BaseDetailsUseCase baseDetailsUseCase = DetailsUseCase(baseDetailsRepository);
    return BlocProvider(
      create: (context){
        return DetailsBloc(baseDetailsUseCase)..add(DetailsDataEvent(id: id));
      },
      child: BlocBuilder<DetailsBloc , DetailsState>(
        buildWhen: (previous , current)=> previous != current,
        builder: (context , state) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 10 , left: 10 , right: 10),
            child: Text(
              state.detailsList.isEmpty?"":state.detailsList[0].description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
