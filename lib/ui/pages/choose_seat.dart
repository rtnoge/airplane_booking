import 'package:airplane_booking/cubit/seat_cubit.dart';
import 'package:airplane_booking/models/destination_model.dart';
import 'package:airplane_booking/models/transaction_model.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:airplane_booking/ui/pages/checkout_page.dart';
import 'package:airplane_booking/ui/widgets/button.dart';
import 'package:airplane_booking/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeat extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeat(this.destination);

  @override
  Widget build(BuildContext context) {
    Widget _title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text('Select Your\nFavorite Seat',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            )),
      );
    }

    Widget _seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_available.png'),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Text('Available', style: blackTextStyle),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_selected.png'),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Text('Selected', style: blackTextStyle),
              ],
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon_unavailable.png'),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Text('Unavailable', style: blackTextStyle),
              ],
            ),
          ],
        ),
      );
    }

    Widget _seatComponent() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                //0: available to select, 1: selected, 2: unavailable
                //SEAT 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A1',
                      isAvailable: false,
                    ),
                    SeatItem(
                      id: 'B1',
                      isAvailable: false,
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          '1',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(
                      id: 'C1',
                    ),
                    SeatItem(
                      id: 'D1',
                      isAvailable: false,
                    ),
                  ],
                ),
                //SEAT 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(
                      id: 'A2',
                    ),
                    SeatItem(
                      id: 'B2',
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          '2',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(id: 'C2'),
                    SeatItem(id: 'D2', isAvailable: false),
                  ],
                ),
                //SEAT 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A3'),
                    SeatItem(id: 'B3'),
                    Container(
                      width: 48,
                      height: 48,
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          '3',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(id: 'C3'),
                    SeatItem(id: 'D3'),
                  ],
                ),
                //SEAT 4
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A4'),
                    SeatItem(id: 'B4', isAvailable: false),
                    Container(
                      width: 48,
                      height: 48,
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          '4',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(id: 'C4'),
                    SeatItem(id: 'D4'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SeatItem(id: 'A5'),
                    SeatItem(id: 'B5'),
                    Container(
                      width: 48,
                      height: 48,
                      margin: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          '5',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    SeatItem(id: 'C5', isAvailable: false),
                    SeatItem(id: 'D5'),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget _button() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            margin: EdgeInsets.only(top: 30, bottom: 46),
            text: 'Continue to Checkout',
            onPressed: () {
              //counting grand total
              int price = destination.price * state.length;
              int grandTotal = price + (price * 0.45).toInt();

              print('to checkout page');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                        destination: destination,
                        amountTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat: 0.45,
                        price: price,
                        grandTotal: grandTotal),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: bgHeaderColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            _title(),
            _seatStatus(),
            _seatComponent(),
            _button(),
          ],
        ),
      ),
    );
  }
}
