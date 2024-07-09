import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/date_field.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/attach_file.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/documents/document_update_view_model.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

class DocumentUpdateForm extends StatelessWidget {
  final String phoneNumber;

  DocumentUpdateForm({super.key, required this.phoneNumber});

  final DocumentUpdateViewModel viewModel = Get.put(DocumentUpdateViewModel());
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
        () => viewModel.isLoading.value
            ? buildLoadingView()
            : viewModel.submitted.value
                ? buildSubmittedView()
                : buildFormView(context),
      ),
    );
  }

  Widget buildLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildSubmittedView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your documents are under review.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget buildFormView(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Attach your picture',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: attachFile(
                    onTap: () =>
                        viewModel.pickImage(ImageSource.gallery, 'driver'),
                    pickedFile: viewModel.driverImage,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Driving License Issuance Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          dateField(
                            context,
                            'MM-dd-yyyy',
                            onTap: () => viewModel.pickDate('dlIssuance'),
                            displayText: viewModel.drivingLicenseIssuanceDate,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Driving License Expiry Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          dateField(
                            context,
                            'MM-dd-yyyy',
                            onTap: () => viewModel.pickDate('dlExpiry'),
                            displayText: viewModel.drivingLicenseExpiryDate,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => viewModel.pickImage(
                                        ImageSource.gallery, 'dlFront'),
                                    pickedFile:
                                        viewModel.drivingLicenseFrontImage,
                                  ),
                                  const Text('Front'),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => viewModel.pickImage(
                                        ImageSource.gallery, 'dlBack'),
                                    pickedFile:
                                        viewModel.drivingLicenseBackImage,
                                  ),
                                  const Text('Back'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Emirates ID Issuance Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          dateField(
                            context,
                            'MM-dd-yyyy',
                            onTap: () => viewModel.pickDate('idIssuance'),
                            displayText: viewModel.emiratesIdIssuanceDate,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Emirates ID Expiry Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          dateField(
                            context,
                            'MM-dd-yyyy',
                            onTap: () => viewModel.pickDate('idExpiry'),
                            displayText: viewModel.emiratesIdExpiryDate,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => viewModel.pickImage(
                                        ImageSource.gallery, 'idFront'),
                                    pickedFile: viewModel.emiratesIdFrontImage,
                                  ),
                                  const Text('Front'),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => viewModel.pickImage(
                                        ImageSource.gallery, 'idBack'),
                                    pickedFile: viewModel.emiratesIdBackImage,
                                  ),
                                  const Text('Back'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.saveDocumentData(phoneNumber: phoneNumber);
                      }
                    },
                    child: const CommonButton(title: 'Submit', width: 200.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
