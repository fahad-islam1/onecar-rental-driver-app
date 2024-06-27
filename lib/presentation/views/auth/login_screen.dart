import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/auth/login_view_model.dart';
import 'package:one_car_rental_driver_app/presentation/views/auth/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Get.put(LoginViewModel());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo2.png',
                  height: 100.0,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please enter your number',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                initialCountryCode: 'AE',
                onChanged: (phone) {
                  loginViewModel.setPhoneNumber(phone.completeNumber);
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () async {
                    await loginViewModel.loginWithPhoneNumber();
                  },
                  child: Obx(() => CommonButton(
                        isLoading: loginViewModel.isLoading.value,
                        title: 'Login',
                        width: 200,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SignUpScreen(),
                        transition: Transition.leftToRight,
                        duration: const Duration(milliseconds: 700));
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
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
