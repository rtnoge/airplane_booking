import 'package:airplane_booking/cubit/page_cubit.dart';
import 'package:airplane_booking/ui/pages/home_page.dart';
import 'package:airplane_booking/ui/pages/setting_page.dart';
import 'package:airplane_booking/ui/pages/book_page.dart';
import 'package:airplane_booking/ui/pages/wallet_page.dart';
import 'package:airplane_booking/ui/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget _bottomNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Icon Home
              NavItem(index: 0, iconUrl: 'assets/icon_home.png'),
              NavItem(index: 1, iconUrl: 'assets/icon_booking.png'),
              NavItem(index: 2, iconUrl: 'assets/icon_card.png'),
              NavItem(index: 3, iconUrl: 'assets/icon_settings.png'),
            ],
          ),
        ),
      );
    }

    Widget _content(int _currentIndex) {
      switch (_currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, _currentIndex) {
        return Scaffold(
          backgroundColor: bgHeaderColor,
          // bottomNavigationBar: _bottomNavbar(),
          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Stack(
            children: [
              // Text('Main Page'),
              _content(_currentIndex),
              _bottomNavbar(),
            ],
          ),
        );
      },
    );
  }
}
