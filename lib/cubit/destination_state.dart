part of 'destination_cubit.dart';

abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object> get props => [];
}

class DestinationInitial extends DestinationState {}

class DestinationLoading extends DestinationState {}

class DestinationSuccess extends DestinationState {
  final List<DestinationModel> destinations;

  const DestinationSuccess(this.destinations);

  @override
  List<Object> get props => [destinations];
}

class DestinationFailure extends DestinationState {
  final String error;

  const DestinationFailure(this.error);

  @override
  List<Object> get props => [error];
}
