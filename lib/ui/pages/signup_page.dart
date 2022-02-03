import 'package:airplane_booking/cubit/auth_cubit.dart';
import 'package:airplane_booking/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:airplane_booking/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController(text: '');
  final TextEditingController _emailController =
      TextEditingController(text: '');
  final TextEditingController _passwordController =
      TextEditingController(text: '');
  final TextEditingController _hobbyController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Text(
              'Join us and get\nyour next journey',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget _fullnameInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Full Name', style: blackTextStyle),
            SizedBox(height: 6),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: TextFormField(
                  controller: _nameController,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Full Name',
                      hintStyle: greyTextStyle.copyWith(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _emailInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email Address', style: blackTextStyle),
            SizedBox(height: 6),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: TextFormField(
                  controller: _emailController,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Email Address',
                      hintStyle: greyTextStyle.copyWith(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _passwordInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Password', style: blackTextStyle),
            SizedBox(height: 6),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Password',
                      hintStyle: greyTextStyle.copyWith(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _hobbyInput() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hobby', style: blackTextStyle),
            SizedBox(height: 6),
            Container(
              height: 55,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                border: Border.all(color: primaryColor),
              ),
              child: Center(
                child: TextFormField(
                  controller: _hobbyController,
                  style: blackTextStyle.copyWith(fontSize: 16),
                  decoration: InputDecoration.collapsed(
                      hintText: 'Your Hobby',
                      hintStyle: greyTextStyle.copyWith(fontSize: 16)),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _button() {
      return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/bonus', (route) => false);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: redColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomButton(
            text: 'Get Started',
            onPressed: () => context.read<AuthCubit>().signUp(
                email: _emailController.text,
                password: _passwordController.text,
                name: _nameController.text,
                hobby: _hobbyController.text),
          );
        },
      );
    }

    Widget _footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 73, top: 50),
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/sign-in'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account? ',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    )),
                Text('Sign-in',
                    style: greyTextStyle.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: light,
                    )),
              ],
            ),
          ),
        ),
      );
    }

    Widget _form() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(left: 20, right: 20, top: defaultMargin),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fullnameInput(),
            SizedBox(height: 20),
            _emailInput(),
            SizedBox(height: 20),
            _passwordInput(),
            SizedBox(height: 20),
            _hobbyInput(),
            SizedBox(height: 30),
            _button(),
            SizedBox(height: 30),
          ],
        ),
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgHeaderColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  _form(),
                  _footer(),
                ],
              ),
            ),
          ),
        ));
  }
}
