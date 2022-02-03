import 'package:airplane_booking/models/destination_model.dart';
import 'package:airplane_booking/services/destination_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void getDestinations() async {
    try {
      emit(DestinationLoading());

      List<DestinationModel> destinations =
          await DestinationService().getDestinations();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailure(e.toString()));
    }
  }
}
