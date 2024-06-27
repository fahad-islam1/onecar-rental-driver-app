import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_textfield.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/auth/signup1_view_model.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo2.png',
                  height: 100.0,
                ),
              ),
              const SizedBox(height: 20),
              buildFieldLabel('First Name'),
              const SizedBox(height: 8),
              Obx(() => buildTextField(
                    labelText: 'First Name',
                    controller: controller.firstNameController,
                    isValid: controller.firstNameValid.value,
                    onChanged: (value) {
                      controller.validateFields();
                    },
                  )),
              const SizedBox(height: 12),
              buildFieldLabel('Last Name'),
              const SizedBox(height: 8),
              Obx(() => buildTextField(
                    labelText: 'Last Name',
                    controller: controller.lastNameController,
                    isValid: controller.lastNameValid.value,
                    onChanged: (value) {
                      controller.validateFields();
                    },
                  )),
              const SizedBox(height: 12),
              buildFieldLabel('Email'),
              const SizedBox(height: 8),
              Obx(() => buildTextField(
                    labelText: 'Email',
                    controller: controller.emailController,
                    isValid: controller.emailValid.value,
                    onChanged: (value) {
                      controller.validateFields();
                    },
                  )),
              const SizedBox(height: 12),
              buildFieldLabel('Phone Number'),
              const SizedBox(height: 8),
              IntlPhoneField(
                decoration: const InputDecoration(
                    labelText: 'Phone Number', border: OutlineInputBorder()),
                initialCountryCode: 'AE',
                onChanged: (phone) {
                  controller.phoneNumberController.text = phone.completeNumber;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: controller.signUpStep1,
                  child: CommonButton(
                    title: 'Next',
                    width: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
