import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ybm/meta/utils/math_utils.dart';

class ImageSelector extends StatefulWidget {
  final Function(File? photo) onTap;
  const ImageSelector({
    super.key,
    required this.onTap,
  });

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  File? photo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();

        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
        if (image == null) {
          widget.onTap.call(null);
          return;
        }
        final file = File(image.path);
        setState(() {
          photo = file;
        });
        widget.onTap.call(file);
      },
      child: Container(
        height: getVerticalSize(126),
        width: getHorizontalSize(388),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffd9f4ff),
        ),
        child: photo == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/uploadIcon.png'),
                  Text(
                    'Upload Company Image',
                    style: GoogleFonts.nunito(
                      fontSize: getFontSize(16),
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            : Image.file(photo!),
      ),
    );
  }
}
