import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class FAQScren extends GetView<AuthController> {
  const FAQScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: getVerticalSize(20),
            ),
            GradientText(
              'Please answer these questions so we can best serve your business',
              style: GoogleFonts.sourceSansPro(
                fontSize: getFontSize(18),
                fontWeight: FontWeight.w700,
              ),
              gradient: gradientColor,
            ),
            SizedBox(height: getVerticalSize(15)),
            Container(
              height: getVerticalSize(144),
              width: getHorizontalSize(391),
              decoration: BoxDecoration(
                color: const Color(0xffDCF3FD),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: getVerticalSize(48),
                    width: double.infinity,
                    color: const Color(0xff00ACEF).withOpacity(0.07),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Q 01: Lorem ipsum is a placeholder text?',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: getFontSize(14),
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, top: 8, right: 14),
                    child: Text(
                      'When booking a sedan, you will receive a booking confirmation via email directly after the booking. This confirms your booking. You will receive.',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: getFontSize(15),
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
