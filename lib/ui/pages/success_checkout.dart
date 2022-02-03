import 'package:airplane_booking/cubit/page_cubit.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:airplane_booking/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckout extends StatelessWidget {
  const SuccessCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgHeaderColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_success.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Text('Well Booked 😍',
                    style: blackTextStyle.copyWith(
                      fontSize: 32,
                      fontWeight: semiBold,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Are you ready to explore the new\nworld of experiences?',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CustomButton(
                text: 'My Bookings',
                onPressed: () {
                  context.read<PageCubit>().setPage(1);
                  Navigator.pushNamed(context, '/home');
                },
                margin: EdgeInsets.only(top: 50),
                width: 220,
              )
            ],
          ),
        ),
      ),
    );
  }
}
