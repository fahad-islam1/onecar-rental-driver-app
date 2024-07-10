

  import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:one_car_rental_driver_app/presentation/components/common/common_btn.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/attach_file.dart';
import 'package:one_car_rental_driver_app/presentation/components/documents/date_field.dart';
import 'package:one_car_rental_driver_app/presentation/view_model/documents/document_update_view_model.dart';

Widget buildFormView(BuildContext context, DocumentUpdateViewModel documentsViewModel, String phoneNumber) {
    return Stack(
      children: [
        Form(
          key: documentsViewModel.formKey,
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
                        documentsViewModel.pickImage(ImageSource.gallery, 'driver'),
                    pickedFile: documentsViewModel.driverImage,
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
                            onTap: () => documentsViewModel.pickDate('dlIssuance'),
                            displayText: documentsViewModel.drivingLicenseIssuanceDate,
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
                            onTap: () => documentsViewModel.pickDate('dlExpiry'),
                            displayText: documentsViewModel.drivingLicenseExpiryDate,
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
                                    onTap: () => documentsViewModel.pickImage(
                                        ImageSource.gallery, 'dlFront'),
                                    pickedFile:
                                        documentsViewModel.drivingLicenseFrontImage,
                                  ),
                                  const Text('Front'),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => documentsViewModel.pickImage(
                                        ImageSource.gallery, 'dlBack'),
                                    pickedFile:
                                        documentsViewModel.drivingLicenseBackImage,
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
                            onTap: () => documentsViewModel.pickDate('idIssuance'),
                            displayText: documentsViewModel.emiratesIdIssuanceDate,
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
                            onTap: () => documentsViewModel.pickDate('idExpiry'),
                            displayText: documentsViewModel.emiratesIdExpiryDate,
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
                                    onTap: () => documentsViewModel.pickImage(
                                        ImageSource.gallery, 'idFront'),
                                    pickedFile: documentsViewModel.emiratesIdFrontImage,
                                  ),
                                  const Text('Front'),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Column(
                                children: [
                                  attachFile(
                                    onTap: () => documentsViewModel.pickImage(
                                        ImageSource.gallery, 'idBack'),
                                    pickedFile: documentsViewModel.emiratesIdBackImage,
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
                      if (documentsViewModel.formKey.currentState!.validate()) {
                        documentsViewModel.saveDocumentData(phoneNumber: phoneNumber);
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

