import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:one_car_rental_driver_app/presentation/components/documents/documents_under_review.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/documents_upload.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/loading.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/documents/document_update_view_model.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

class DocumentUpdateForm extends StatelessWidget {
  final String phoneNumber;

  DocumentUpdateForm({super.key, required this.phoneNumber});

  final DocumentUpdateViewModel documentsViewModel =
      Get.put(DocumentUpdateViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: const Text(
          'Update Document',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => documentsViewModel.isLoading.value
            ? buildLoadingView()
            : documentsViewModel.submitted.value
                ? buildSubmittedView()
                : buildFormView(context, documentsViewModel, phoneNumber),
      ),
    );
  }
}
