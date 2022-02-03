import 'package:airplane_booking/cubit/transaction_cubit.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:airplane_booking/ui/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().getTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: TEST
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        print('state: $state');
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transaction.length == 0) {
            return Center(
              child: Text('No Transaction'),
            );
          } else {
            return SafeArea(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 30),
                itemCount: state.transaction.length,
                itemBuilder: (context, index) {
                  return TransactionTile(state.transaction[index]);
                },
              ),
            );
          }
        }
        return Center(
          child: Text(state.toString()),
        );
      },
    );
  }
}
