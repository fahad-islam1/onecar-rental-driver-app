
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

Widget dateField(BuildContext context, String labelText,
      {required VoidCallback onTap, required RxString displayText}) {
    return Obx(() => InkWell(
          onTap: onTap,
          child: Container(
            width: 150,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    displayText.value.isEmpty ? labelText : displayText.value,
                    style: TextStyle(fontSize: 16, color: grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.calendar_month,
                  color: grey,
                ),
              ],
            ),
          ),
        ));
  }
