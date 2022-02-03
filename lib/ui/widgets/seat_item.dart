import 'package:airplane_booking/cubit/seat_cubit.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItem({Key? key, required this.id, this.isAvailable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //0: available to select, 1: selected, 2: unavailable

    bool isSelected = context.watch<SeatCubit>().isSelected(id);
    _backgroundColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        if (isSelected) {
          return primaryColor;
        } else {
          return availableColor;
        }
      }
    }

    _borderColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        return primaryColor;
      }
    }

    _child() {
      if (isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: _backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _borderColor(),
            width: 1,
          ),
        ),
        child: _child(),
      ),
    );
  }
}
