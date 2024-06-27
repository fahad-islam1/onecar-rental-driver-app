import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:one_car_rental_driver_app/res/colors/utils/snackmsg.dart';

class FirestorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File file, String folder, String filename) async {
    try {
      final ref = _storage.ref().child('$folder/$filename');
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      Message.showError('Error uploading image', '$e');
      print('Error uploading image: $e');
      throw e;
    }
  }
}
