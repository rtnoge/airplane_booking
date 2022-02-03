import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _card() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
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
                    'IDR 280.000.000',
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget _title() {
      return Container(
        margin: EdgeInsets.only(top: 80),
        child: Text(
          'Big Bonus 🎉',
          style: blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget _subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget _button() {
      return CustomButton(
        text: 'Start Fly Now',
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, '/home', (route) => false),
        margin: EdgeInsets.only(top: 50),
        width: 220,
      );
    }

    return Scaffold(
      backgroundColor: bgHeaderColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _card(),
              _title(),
              _subtitle(),
              _button(),
            ],
          ),
        ),
      ),
    );
  }
}
