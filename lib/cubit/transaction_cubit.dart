import 'package:airplane_booking/models/transaction_model.dart';
import 'package:airplane_booking/services/transaction_service.dart';
import 'package:airplane_booking/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }

  void getTransaction() async {
    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionService().getTransaction();

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }

  void updateBalance(TransactionModel transaction) async {
    try {
      //get id current user
      User? user = FirebaseAuth.instance.currentUser;

      //get transaction price
      int newBalance = transaction.grandTotal;

      await UserService().updateBalance(user!.uid, newBalance);
    } catch (e) {
      emit(TransactionFailure(e.toString()));
    }
  }
}
