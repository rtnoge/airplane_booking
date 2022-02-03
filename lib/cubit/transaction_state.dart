part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<TransactionModel> transaction;

  const TransactionSuccess(this.transaction);

  @override
  List<Object> get props => [transaction];
}

class TransactionFailure extends TransactionState {
  final String error;

  TransactionFailure(this.error);

  @override
  List<Object> get props => [error];
}
