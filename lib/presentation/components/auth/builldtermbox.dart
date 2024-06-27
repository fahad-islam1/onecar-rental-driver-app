  import 'package:flutter/material.dart';

Widget buildTermsCheckbox({
    required bool isChecked,
    required void Function(bool?) onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        GestureDetector(
          onTap: () {
            // Add your terms & conditions action here
          },
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'I Accept ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: 'Terms & Condition',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }