import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/firestore_service.dart';
import 'package:one_car_rental_driver_app/presentation/views/auth/verify_screen.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class LoginViewModel extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirestoreService firestoreService = FirestoreService();

  final RxString phoneNumber = ''.obs;
  final RxBool isLoading = false.obs;

  void setPhoneNumber(String number) {
    phoneNumber.value = number;
  }

  Future<void> loginWithPhoneNumber() async {
    try {
      isLoading.value = true;
      bool isUserRegistered = await firestoreService.isUserRegistered(phoneNumber.value);
      
      if (isUserRegistered) {
        await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber.value,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          
          },
          verificationFailed: (FirebaseAuthException e) {
            Message.showError('Error', e.message!);
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.to(
              () => OtpVerificationScreen(
                phoneNumber: phoneNumber.value,
                verificationId: verificationId,
              ),
              transition: Transition.leftToRight,
              duration: Duration(milliseconds: 700),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        Message.showError('Error', 'User not found. Please sign up first.');
      }
    } catch (e) {
      Message.showError('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
