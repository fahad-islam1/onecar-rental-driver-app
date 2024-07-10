
  import 'package:flutter/material.dart';

Widget buildLoadingView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Icon(
            Icons.cloud_upload,
            size: 50,
          ),
        ],
      ),
    );
  }