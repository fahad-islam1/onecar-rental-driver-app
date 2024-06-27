import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/auth/otp_viewmodel.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;
  final OtpVerificationController controller =
      Get.put(OtpVerificationController());

  OtpVerificationScreen(
      {Key? key, required this.phoneNumber, required this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo2.png',
                height: 100.0,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  List.generate(6, (index) => buildOtpField(index, context)),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  controller.verifyOtpAndRegister(phoneNumber, verificationId);
                },
                child: Obx(
                  () => CommonButton(
                    isLoading: controller.isLoading.value,
                    title: 'Verify OTP',
                    width: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOtpField(int index, BuildContext context) {
    return SizedBox(
      width: 50,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (value) {
          controller.onOtpChange(value, index);
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
          counter: Offstage(),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
