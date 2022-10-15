import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';

class PageName extends StatelessWidget {
  final String pageName;
  const PageName({
    Key? key,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Get.width,
      decoration: const BoxDecoration(
        gradient: gradientColor,
      ),
      child: Center(
        child: Text(
          pageName,
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
