import 'package:airplane_booking/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userCollection.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(id).get();
      return UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          hobby: snapshot['hobby'],
          balance: snapshot['balance']);
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> updateBalance(String id, int balanceNew) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(id).get();
      UserModel user = UserModel(
          id: id,
          email: snapshot['email'],
          name: snapshot['name'],
          hobby: snapshot['hobby'],
          balance: snapshot['balance']);
      user.balance = user.balance - balanceNew;
      _userCollection.doc(id).update({'balance': user.balance});
      return user;
    } catch (e) {
      throw e;
    }
  }
}
