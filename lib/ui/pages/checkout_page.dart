import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/cubit/transaction_cubit.dart';
import 'package:airplane_booking/models/transaction_model.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:airplane_booking/ui/widgets/button.dart';
import 'package:airplane_booking/ui/widgets/interest_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatefulWidget {
  final TransactionModel transaction;

  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    context.read<AuthCubit>().getCurrentUser(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _route() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 291,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget _detailsComponent() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      image:
                          NetworkImage(widget.transaction.destination.img_url),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      widget.transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                InterestItem(item: 'Traveler'),
                Text('${widget.transaction.amountTraveler} person',
                    style: blackTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'Seat'),
                Text(widget.transaction.selectedSeats,
                    style: blackTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'Insurance'),
                Text(widget.transaction.insurance ? 'YES' : 'NO',
                    style: widget.transaction.insurance
                        ? greenTextStyle.copyWith(fontWeight: semiBold)
                        : redTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'Refundable'),
                Text(widget.transaction.refundable ? 'YES' : 'NO',
                    style: widget.transaction.refundable
                        ? greenTextStyle.copyWith(fontWeight: semiBold)
                        : redTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'VAT'),
                Text('${(widget.transaction.vat * 100).toStringAsFixed(0)}%',
                    style: blackTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'Price'),
                Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(widget.transaction.price),
                    style: blackTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                InterestItem(item: 'Grand Total'),
                Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'IDR ',
                      decimalDigits: 0,
                    ).format(widget.transaction.grandTotal),
                    style: purpleTextStyle.copyWith(fontWeight: semiBold))
              ],
            ),
          ],
        ),
      );
    }

    Widget _paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 23,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          image: DecorationImage(
                            image: AssetImage('assets/image_card.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/icon_plane.png'),
                                ),
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
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                              locale: 'id',
                              symbol: 'IDR ',
                              decimalDigits: 0,
                            ).format(state.user.balance),
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          )
                        ],
                      )
                    ],
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

    Widget _button() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            context.read<TransactionCubit>().updateBalance(widget.transaction);
            Navigator.pushNamedAndRemoveUntil(
                context, '/success-checkout', (route) => false);
          } else if (state is TransactionFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(backgroundColor: redColor, content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }

          return CustomButton(
            margin: EdgeInsets.only(top: 30),
            text: 'Pay Now',
            onPressed: () {
              print('tes Pay Now');
              context
                  .read<TransactionCubit>()
                  .createTransaction(widget.transaction);
            },
          );
        },
      );
    }

    Widget _linkTnC() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: GestureDetector(
            onTap: () {},
            child: Text('Terms and Conditions',
                style: greyTextStyle.copyWith(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: light,
                )),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgHeaderColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            _route(),
            _detailsComponent(),
            _paymentDetails(),
            _button(),
            _linkTnC()
          ],
        ),
      ),
    );
  }
}
