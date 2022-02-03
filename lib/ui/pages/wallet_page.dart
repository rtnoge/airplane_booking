import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    context.read<AuthCubit>().getCurrentUser(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          print(state.user.balance);
          return Center(
            child: Container(
              width: 300,
              height: 211,
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_card.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(fontWeight: light),
                          ),
                          Text(
                            state.user.name,
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icon_plane.png')),
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Pay',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  Text('Balance',
                      style: whiteTextStyle.copyWith(
                        fontWeight: light,
                      )),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(state.user.balance),
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
