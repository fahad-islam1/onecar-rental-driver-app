import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/firestore_service.dart';
import 'package:one_car_rental_driver_app/presentation/views/auth/verify_screen.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class SignUpController2 extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  final selectedCity = 'Dubai'.obs;
  final selectedLicense = 'Automatic'.obs;
  final selectedLanguage = ''.obs;
  final termsAccepted = false.obs;

  void setSelectedCity(String city) {
    selectedCity.value = city;
  }

  void setSelectedLicense(String license) {
    selectedLicense.value = license;
  }

  void setSelectedLanguage(String language) {
    selectedLanguage.value = language;
  }

  void setTermsAccepted(bool value) {
    termsAccepted.value = value;
  }

  Future<void> signUpStep2(String phoneNumber) async {
    try {
      await _firestoreService.signUpStep2(
        phoneNumber: phoneNumber,
        city: selectedCity.value,
        license: selectedLicense.value,
        language: selectedLanguage.value,
        termsAccepted: termsAccepted.value,
      );

      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
        },
        verificationFailed: (FirebaseAuthException e) {
          Message.showError('Error', '${e.message}');
          print('Error sending OTP: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.to(
            () => OtpVerificationScreen(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 700),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
        },
      );
    } catch (e) {
      Message.showError('Error', '$e');
      print('Error signing up step 2: $e');
    }
  }
}
