import 'package:cloud_firestore/cloud_firestore.dart';

class DocumentStoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDocumentData({
    required String phoneNumber,
    required String drivingLicenseIssuanceDate,
    required String drivingLicenseExpiryDate,
    required String emiratesIdIssuanceDate,
    required String emiratesIdExpiryDate,
    required String drivingLicenseFrontImageUrl,
    required String drivingLicenseBackImageUrl,
    required String emiratesIdFrontImageUrl,
    required String emiratesIdBackImageUrl,
    required String driverImage,
  }) async {
    try {

      final driverSnapshot = await _firestore.collection('drivers').doc(phoneNumber).get();

      final firstName = driverSnapshot['firstName'];
      final lastName = driverSnapshot['lastName'];
      final email = driverSnapshot['email'];
      final city = driverSnapshot['city'];
      final license = driverSnapshot['license'];
      final language = driverSnapshot['language'];
      final termsAccepted = driverSnapshot['termsAccepted'];

   
      await _firestore.collection('driverrequest').doc(phoneNumber).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'city': city,
        'license': license,
        'language': language,
        'termsAccepted': termsAccepted,
        'drivingLicenseIssuanceDate': drivingLicenseIssuanceDate,
        'drivingLicenseExpiryDate': drivingLicenseExpiryDate,
        'emiratesIdIssuanceDate': emiratesIdIssuanceDate,
        'emiratesIdExpiryDate': emiratesIdExpiryDate,
        'drivingLicenseFrontImageUrl': drivingLicenseFrontImageUrl,
        'drivingLicenseBackImageUrl': drivingLicenseBackImageUrl,
        'emiratesIdFrontImageUrl': emiratesIdFrontImageUrl,
        'emiratesIdBackImageUrl': emiratesIdBackImageUrl,
        'driverImage': driverImage,
      });
    } catch (e) {
      print('Error saving document data: $e');
      throw e;
    }
  }
}
