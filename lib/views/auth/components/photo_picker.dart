import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';

class PhotoPicker extends StatelessWidget {
  final Function(File? photo) onSelect;
  const PhotoPicker({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();

        final XFile? image = await picker.pickImage(source: ImageSource.gallery);
        if (image == null) {
          onSelect.call(null);
          return;
        }
        final file = File(image.path);

        onSelect.call(file);
      },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: secondaryColor,
          strokeWidth: 2,
          radius: const Radius.circular(10),
          dashPattern: const [6],
          child: SizedBox(
            height: getVerticalSize(104),
            width: getHorizontalSize(104),
            child: const Icon(
              Icons.add_rounded,
              color: primaryColor,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
