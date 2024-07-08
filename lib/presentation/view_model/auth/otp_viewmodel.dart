import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/firestore_service.dart';
import 'package:one_car_rental_driver_app/presentation/views/documents/update_document_screen.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class OtpVerificationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService firestoreService = FirestoreService();

  final List<String> otp = ['', '', '', '', '', ''].obs;
  final RxBool isLoading = false.obs;

  void onOtpChange(String value, int index) {
    if (value.isNotEmpty) {
      otp[index] = value;
    } else {
      otp[index] = '';
    }
  }

  bool isOtpComplete() {
    return otp.every((element) => element.isNotEmpty);
  }

  Future<void> verifyOtpAndRegister(
      String phoneNumber, String verificationId) async {
    try {
      isLoading.value = true;
      if (isOtpComplete()) {
        String otpCode = otp.join();
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otpCode,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        Get.offAll(
          () => DocumentUpdateForm(
            phoneNumber: phoneNumber,
          ),
          transition: Transition.leftToRight,
          duration: Duration(milliseconds: 700),
        );
        Message.showSuccess('Otp verifid', 'Your otp is verifed Successfully');
      } else {
        Message.showError('Error', 'Please enter the complete OTP');
        print('Please enter the complete OTP');
      }
    } catch (e) {
      Message.showError('Error', 'Error verifying OTP and registering');
      print('Error verifying OTP and registering: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
