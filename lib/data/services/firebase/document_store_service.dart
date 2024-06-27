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
      await _firestore.collection('driverrequest').doc(phoneNumber).set({
        'drivingLicenseIssuanceDate': drivingLicenseIssuanceDate,
        'drivingLicenseExpiryDate': drivingLicenseExpiryDate,
        'emiratesIdIssuanceDate': emiratesIdIssuanceDate,
        'emiratesIdExpiryDate': emiratesIdExpiryDate,
        'drivingLicenseFrontImageUrl': drivingLicenseFrontImageUrl,
        'drivingLicenseBackImageUrl': drivingLicenseBackImageUrl,
        'emiratesIdFrontImageUrl': emiratesIdFrontImageUrl,
        'emiratesIdBackImageUrl': emiratesIdBackImageUrl,
        'driverimage': driverImage,
      });
    } catch (e) {
      print('Error saving document data: $e');
      throw e;
    }
  }
}
