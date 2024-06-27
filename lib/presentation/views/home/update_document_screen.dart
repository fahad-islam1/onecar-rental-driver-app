import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/home/document_update_view_model.dart';
import 'package:one_car_rental_driver_app/res/colors/colors.dart';

class DocumentUpdateForm extends StatefulWidget {
  final String phoneNumber;

  const DocumentUpdateForm({super.key, required this.phoneNumber});

  @override
  _DocumentUpdateFormState createState() => _DocumentUpdateFormState();
}

class _DocumentUpdateFormState extends State<DocumentUpdateForm> {
  final DocumentUpdateViewModel viewModel = Get.put(DocumentUpdateViewModel());
  final _formKey = GlobalKey<FormState>();

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
                : buildFormView(),
      ),
    );
  }

  Widget buildLoadingView() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildSubmittedView() {
    return Center(
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

  Widget buildFormView() {
    return Stack(
      children: [
        Form(
          key: _formKey,
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
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.saveDocumentData(
                            phoneNumber: widget.phoneNumber);
                      }
                    },
                    child: CommonButton(title: 'Submit', width: 200.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget attachFile({required VoidCallback onTap, Rx<File?>? pickedFile}) {
    return Obx(() => InkWell(
          onTap: onTap,
          child: DottedBorder(
            borderType: BorderType.RRect,
            padding: const EdgeInsets.all(6),
            color: Colors.purple,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.white,
                child: pickedFile != null && pickedFile.value != null
                    ? Image.file(
                        pickedFile.value!,
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.purple,
                          size: 40,
                        ),
                      ),
              ),
            ),
          ),
        ));
  }

  Widget dateField(BuildContext context, String labelText,
      {required VoidCallback onTap, required RxString displayText}) {
    return Obx(() => InkWell(
          onTap: onTap,
          child: Container(
            width: 150,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    displayText.value.isEmpty ? labelText : displayText.value,
                    style: TextStyle(fontSize: 16, color: grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  Icons.calendar_month,
                  color: grey,
                ),
              ],
            ),
          ),
        ));
  }
}
