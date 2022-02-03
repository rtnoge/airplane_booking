import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/cubit/destination_cubit.dart';
import 'package:airplane_booking/cubit/page_cubit.dart';
import 'package:airplane_booking/cubit/seat_cubit.dart';
import 'package:airplane_booking/cubit/transaction_cubit.dart';
import 'package:airplane_booking/ui/pages/bonus_page.dart';
import 'package:airplane_booking/ui/pages/get_started_page.dart';
import 'package:airplane_booking/ui/pages/main_page.dart';
import 'package:airplane_booking/ui/pages/signin_page.dart';
import 'package:airplane_booking/ui/pages/signup_page.dart';
import 'package:airplane_booking/ui/pages/splash_page.dart';
import 'package:airplane_booking/ui/pages/success_checkout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
        BlocProvider(create: (context) => SeatCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/home': (context) => MainPage(),
          '/success-checkout': (context) => SuccessCheckout(),
        },
      ),
    );
  }
}
