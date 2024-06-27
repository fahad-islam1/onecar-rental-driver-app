import 'package:flutter/material.dart';

Widget buildFieldLabel(String label) {
  return Text(
    label,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}

Widget buildTextField({
  required String labelText,
  required TextEditingController controller,
  required bool isValid,
  required ValueChanged<String> onChanged,
}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: isValid ? null : 'This field cannot be empty',
      border: OutlineInputBorder(),
    ),
  );
}
