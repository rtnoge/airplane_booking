import 'package:airplane_booking/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavItem extends StatelessWidget {
  final int index;
  final String iconUrl;

  const NavItem({
    Key? key,
    required this.iconUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Image.asset(
            iconUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? primaryColor
                : greyColor,
          ),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? primaryColor
                  : transparentColor,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ],
      ),
    );
  }
}
