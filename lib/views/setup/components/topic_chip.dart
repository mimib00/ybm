import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';

class TopicChip extends StatelessWidget {
  final String title;
  final Widget? leading;
  final bool selected;
  final Function(String value) onTap;
  const TopicChip({
    super.key,
    required this.title,
    required this.onTap,
    this.leading,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(title),
      child: Chip(
        avatar: leading,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        label: Text(title),
        labelStyle: GoogleFonts.nunito(
          fontSize: getFontSize(14),
          fontWeight: FontWeight.w600,
          color: selected ? Colors.white : Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: selected ? BorderSide.none : const BorderSide(color: Colors.black, width: 0.5),
        ),
        backgroundColor: selected ? primaryColor : Colors.white,
      ),
    );
  }
}
