
  import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
