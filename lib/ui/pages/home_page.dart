import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/cubit/destination_cubit.dart';
import 'package:airplane_booking/models/destination_model.dart';
import 'package:airplane_booking/ui/widgets/destination_card.dart';
import 'package:airplane_booking/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().getDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Howdy,',
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              state.user.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 24,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/image_profile.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Where to fly today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget _topDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destination) {
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget _newDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
            top: 30, bottom: 140, left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 30),
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: destinations.map((DestinationModel destination) {
                return DestinationTile(destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgHeaderColor,
      body: SafeArea(
        child: BlocConsumer<DestinationCubit, DestinationState>(
          listener: (context, state) {
            if (state is DestinationFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: redColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is DestinationSuccess) {
              return ListView(
                children: [
                  _header(),
                  _topDestinations(state.destinations),
                  _newDestinations(state.destinations),
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
