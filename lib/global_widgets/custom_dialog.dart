import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDialogs {
  // ====================================== Image Selection Dialog ======================================
  static Future<dynamic> showImageSelectionDialog(BuildContext context,
      {required Function() onSelectGallery,
      required Function() onSelectCamera}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Select Image"),
          children: [
            SimpleDialogOption(
              onPressed: onSelectCamera,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_rounded,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      CustomText(
                        text: 'Pick from camera',
                        fontSize: 18,
                      ),
                    ],
                  )),
            ),
            SimpleDialogOption(
              onPressed: onSelectGallery,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.image,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    CustomText(
                      text: 'Pick from gallery',
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
