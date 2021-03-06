import 'package:airplane_booking/models/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionService {
  CollectionReference _transactionCollection =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> createTransaction(TransactionModel transaction) async {
    try {
      _transactionCollection.add({
        'destination': transaction.destination.toJson(),
        'amountTraveler': transaction.amountTraveler,
        'selectedSeats': transaction.selectedSeats,
        'insurance': transaction.insurance,
        'refundable': transaction.refundable,
        'vat': transaction.vat,
        'price': transaction.price,
        'grandTotal': transaction.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> getTransaction() async {
    try {
      QuerySnapshot result = await _transactionCollection.get();
      List<TransactionModel> transactionList = result.docs.map(
        (doc) {
          return TransactionModel.fromJson(
              doc.id, doc.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactionList;
    } catch (e) {
      throw e;
    }
  }
}
