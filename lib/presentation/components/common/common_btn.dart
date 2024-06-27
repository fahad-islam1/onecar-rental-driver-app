// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

class CommonButton extends StatelessWidget {
  // ignore: use_super_parameters
  const CommonButton({
    Key? key,
    required this.title,
    required this.width,
    this.isLoading = false,
  }) : super(key: key);
  final String title;
  final double width;
  final isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 45,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: white,
                fontSize: 20,
              )),
    );
  }
}
