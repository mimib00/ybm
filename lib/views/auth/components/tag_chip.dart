import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';

class TagChip extends StatelessWidget {
  final String title;
  final Function()? delete;
  const TagChip({
    super.key,
    required this.title,
    this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(15),
      label: Text(
        title,
        style: GoogleFonts.nunito(
          fontSize: getFontSize(14),
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      deleteIconColor: Colors.white,
      onDeleted: delete,
      backgroundColor: primaryColor,
    );
  }
}
