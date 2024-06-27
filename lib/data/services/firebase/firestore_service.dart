import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signUpStep1({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      await firestore.collection('drivers').doc(phoneNumber).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print('Error signing up step 1: $e');
      throw e;
    }
  }

  Future<void> signUpStep2({
    required String phoneNumber,
    required String city,
    required String license,
    required String language,
    required bool termsAccepted,
  }) async {
    try {
      await firestore.collection('drivers').doc(phoneNumber).update({
        'city': city,
        'license': license,
        'language': language,
        'termsAccepted': termsAccepted,
      });
    } catch (e) {
      print('Error signing up step 2: $e');
      throw e;
    }
  }

  Future<void> saveOtpVerification({
    required String phoneNumber,
    required otp,
  }) async {
    try {
      await firestore.collection('drivers').doc(phoneNumber).update({
        'otp': otp,
        'otpVerified': true,
      });
    } catch (e) {
      print('Error saving OTP verification: $e');
      throw e;
    }
  }



    Future<bool> isUserRegistered(String phoneNumber) async {
    final result = await firestore
        .collection('users')
        .where('phoneNumber', isEqualTo: phoneNumber)
        .get();
    
    return result.docs.isNotEmpty;
  }
}
