import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/firestore_service.dart';
import 'package:one_car_rental_driver_app/presentation/views/auth/sign_up_screen2.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class SignUpController extends GetxController {
  final FirestoreService _firestoreService = FirestoreService();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  var firstNameValid = true.obs;
  var lastNameValid = true.obs;
  var emailValid = true.obs;
  var phoneNumberValid = true.obs;

  void validateFields() {
    firstNameValid.value = firstNameController.text.isNotEmpty;
    lastNameValid.value = lastNameController.text.isNotEmpty;
    emailValid.value = emailController.text.isNotEmpty;
    phoneNumberValid.value = phoneNumberController.text.isNotEmpty;
  }

  Future<void> signUpStep1() async {
    try {
      // Perform validation
      validateFields();

      // Proceed if all fields are valid
      if (firstNameValid.value &&
          lastNameValid.value &&
          emailValid.value &&
          phoneNumberValid.value) {
        await _firestoreService.signUpStep1(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
        );
        Get.to(
            () => SignUpScreen2(
                  phoneNumber: phoneNumberController.text,
                ),
            transition: Transition.leftToRight,
            duration: Duration(milliseconds: 700));
      } else {
        Message.showError("Error ", "Please fill in all required fields");
      }
    } catch (e) {
      print('Error signing up step 1: $e');
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
