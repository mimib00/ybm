import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class TermsScreen extends GetView<AuthController> {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: gradientColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Terms and Conditions',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontSize: getFontSize(20),
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
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
                child: GradientText('Terms and Conditions',
                    align: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: getFontSize(24),
                      fontWeight: FontWeight.w500,
                    ),
                    gradient: gradientColor),
              ),
              SizedBox(
                height: getVerticalSize(60),
              ),
              Text(
                'Privacy Policy',
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getVerticalSize(7)),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(14),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(height: getVerticalSize(30)),
              Text(
                'Privacy Policy',
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getVerticalSize(7)),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(14),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(height: getVerticalSize(30)),
              Text(
                'Privacy Policy',
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: getVerticalSize(7)),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(14),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(height: getVerticalSize(50)),
              CustomElevatedButton(
                text: 'Agree',
                onPressed: () async {
                  await controller.updateUser({"agreed": true});
                  Get.offAllNamed(Routes.topics);
                },
              ),
              SizedBox(height: getVerticalSize(25)),
            ],
          ),
        ),
      ),
    );
  }
}
