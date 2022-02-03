import 'package:airplane_booking/models/transaction_model.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionTile(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //change String to ArrayList
    String seatString = transaction.selectedSeats;
    List<String> seatArr = seatString.split(",");

    return Container(
      width: double.infinity,
      height: 173,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    // image: AssetImage('assets/image_destination1.png'),
                    image: NetworkImage(transaction.destination.img_url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
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
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                '${transaction.amountTraveler} Person • ${seatArr.length} Seats',
                style: greyTextStyle.copyWith(
                  fontWeight: light,
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price', style: blackTextStyle),
              Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transaction.grandTotal),
                  style: purpleTextStyle.copyWith(fontWeight: semiBold))
            ],
          ),
        ],
      ),
    );
  }
}
