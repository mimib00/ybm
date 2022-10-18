import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getVerticalSize(90),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/groupLogo.png',
          height: getVerticalSize(88),
          width: getHorizontalSize(173.76),
          fit: BoxFit.fill,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: getVerticalSize(20),
              ),
              Center(
                child: GradientText(
                  'THANK YOU FOR\nREGISTERING',
                  align: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: getFontSize(23),
                    fontWeight: FontWeight.w500,
                  ),
                  gradient: gradientColor,
                ),
              ),
              Image.asset('assets/images/thankYou.png'),
              Center(
                child: Text(
                  'Information will be verified and you will be\nnotified by email when you have been\napproved\nYou will then be able to add to your\nbusiness profile',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4B4A4A),
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(35),
              ),
              CustomElevatedButton(
                text: 'Confirm',
                onPressed: () {
                  Get.offAllNamed(Routes.terms);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
