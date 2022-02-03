// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String hobby;
  late int balance;

  UserModel(
      {required this.id,
      required this.email,
      this.name = '',
      this.hobby = '',
      this.balance = 0});

  @override
  List<Object?> get props => [id, email, name, hobby, balance];
}
