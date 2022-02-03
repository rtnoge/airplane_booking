import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String photo;
  const PhotoItem(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
