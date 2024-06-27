import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/auth/signup2_viewmpdel.dart';

class SignUpScreen2 extends StatelessWidget {
  SignUpScreen2({Key? key, required this.phoneNumber}) : super(key: key);
  final String phoneNumber;
  final SignUpController2 controller = Get.put(SignUpController2());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset('assets/images/logo2.png', height: 100),
            ),
            SizedBox(height: 20),
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedCity.value,
                  decoration: InputDecoration(
                    labelText: 'City',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Dubai', 'Abu Dhabi', 'Sharjah']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.setSelectedCity(newValue!);
                  },
                )),
            SizedBox(height: 20),
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedLicense.value,
                  decoration: InputDecoration(
                    labelText: 'License',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['Automatic', 'Manual'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.setSelectedLicense(newValue!);
                  },
                )),
            SizedBox(height: 20),
            Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedLanguage.value.isEmpty
                      ? null
                      : controller.selectedLanguage.value,
                  decoration: InputDecoration(
                    labelText: 'Preferred Language',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>['English', 'Arabic', 'Hindi']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.setSelectedLanguage(newValue!);
                  },
                )),
            SizedBox(height: 20),
            Obx(() => Row(
                  children: [
                    Checkbox(
                      value: controller.termsAccepted.value,
                      onChanged: (bool? value) {
                        controller.setTermsAccepted(value ?? false);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your terms & conditions action here
                      },
                      child: Text(
                        'I Accept Terms & Condition',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  controller.signUpStep2(phoneNumber);
                },
                child: CommonButton(
                  title: 'Sign Up',
                  width: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
