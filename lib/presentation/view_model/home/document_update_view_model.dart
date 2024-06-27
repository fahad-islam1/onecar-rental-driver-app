import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/document_store_service.dart';
import 'package:one_car_rental_driver_app/data/services/firebase/firestorage_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class DocumentUpdateViewModel extends GetxController {
  final DocumentStoreService _storeService = DocumentStoreService();
  final FirestorageService storageService = FirestorageService();

  RxBool isLoading = false.obs;
  var submitted = false.obs;
  Rx<File?> drivingLicenseFrontImage = Rx<File?>(null);
  Rx<File?> drivingLicenseBackImage = Rx<File?>(null);
  Rx<File?> emiratesIdFrontImage = Rx<File?>(null);
  Rx<File?> emiratesIdBackImage = Rx<File?>(null);
  Rx<File?> driverImage = Rx<File?>(null);

  RxString drivingLicenseIssuanceDate = ''.obs;
  RxString drivingLicenseExpiryDate = ''.obs;
  RxString emiratesIdIssuanceDate = ''.obs;
  RxString emiratesIdExpiryDate = ''.obs;

  Future<void> saveDocumentData({
    required String phoneNumber,
  }) async {
    try {
      isLoading.value = true;

      final dlFrontFile = drivingLicenseFrontImage.value;
      final dlBackFile = drivingLicenseBackImage.value;
      final idFrontFile = emiratesIdFrontImage.value;
      final idBackFile = emiratesIdBackImage.value;
      final driverFile = driverImage.value;

      if (dlFrontFile == null ||
          dlBackFile == null ||
          idFrontFile == null ||
          idBackFile == null ||
          driverFile == null) {
        isLoading.value = false;
        Message.showError('Error', 'Please select all the required images');
        return;
      }
      final folder = 'documents/$phoneNumber';
      // Upload images
      final dlFrontUrl =
          await storageService.uploadImage(dlFrontFile, folder, 'dl_front.jpg');
      final dlBackUrl =
          await storageService.uploadImage(dlBackFile, folder, 'dl_back.jpg');
      final idFrontUrl =
          await storageService.uploadImage(idFrontFile, folder, 'id_front.jpg');
      final idBackUrl =
          await storageService.uploadImage(idBackFile, folder, 'id_back.jpg');
      final driverImageUrl =
          await storageService.uploadImage(driverFile, folder, 'driver.jpg');

      await _storeService.saveDocumentData(
        phoneNumber: phoneNumber,
        drivingLicenseIssuanceDate: drivingLicenseIssuanceDate.value,
        drivingLicenseExpiryDate: drivingLicenseExpiryDate.value,
        emiratesIdIssuanceDate: emiratesIdIssuanceDate.value,
        emiratesIdExpiryDate: emiratesIdExpiryDate.value,
        drivingLicenseFrontImageUrl: dlFrontUrl,
        drivingLicenseBackImageUrl: dlBackUrl,
        emiratesIdFrontImageUrl: idFrontUrl,
        emiratesIdBackImageUrl: idBackUrl,
        driverImage: driverImageUrl,
      );

      isLoading.value = false;
      submitted.value = true;
      Message.showSuccess('Success', 'Document data uploaded successfully');
    } catch (e) {
      isLoading.value = false;
      print('Error saving document data: $e');
      Message.showError('Error', 'Failed to upload document data');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage(ImageSource source, String type) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      switch (type) {
        case 'dlFront':
          drivingLicenseFrontImage.value = file;
          break;
        case 'dlBack':
          drivingLicenseBackImage.value = file;
          break;
        case 'idFront':
          emiratesIdFrontImage.value = file;
          break;
        case 'idBack':
          emiratesIdBackImage.value = file;
          break;
        case 'driver':
          driverImage.value = file;
          break;
      }
      update();
    }
  }

  Future<void> pickDate(String type) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final formattedDate =
          '${pickedDate.month}-${pickedDate.day}-${pickedDate.year}';
      switch (type) {
        case 'dlIssuance':
          drivingLicenseIssuanceDate.value = formattedDate;
          break;
        case 'dlExpiry':
          drivingLicenseExpiryDate.value = formattedDate;
          break;
        case 'idIssuance':
          emiratesIdIssuanceDate.value = formattedDate;
          break;
        case 'idExpiry':
          emiratesIdExpiryDate.value = formattedDate;
          break;
      }
      update();
    }
  }
}
