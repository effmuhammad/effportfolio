import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:html' as html;
import 'package:effportfolio/view/home_page/theme/app_theme.dart';

class ButtonViewMyCV extends StatelessWidget {
  final String pdfUrl;

  const ButtonViewMyCV({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppThemeData.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppThemeData.cornerRadiusCardButton,
          ),
        ),
      ),
      onPressed: () async {
        // Load the PDF file from the assets folder
        // Load the PDF file from the assets folder
        ByteData data = await rootBundle.load(pdfUrl);
        List<int> bytes = data.buffer.asUint8List();

        // Create a blob URL for the PDF file
        var blob = html.Blob([bytes], 'application/pdf');
        var url = html.Url.createObjectUrlFromBlob(blob);

        // Open the PDF file in a new tab
        html.window.open(url, '_blank');
      },
      child: const Text(
        'View My CV',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          color: AppThemeData.textWhite,
        ),
      ),
    );
  }
}
