import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class PhoneAuth extends GetView<AuthController> {
  const PhoneAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getVerticalSize(90),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
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
                height: getVerticalSize(80),
              ),
              GradientText(
                'OTP Verfication',
                style: GoogleFonts.poppins(
                  fontSize: getFontSize(32),
                  fontWeight: FontWeight.w500,
                ),
                gradient: gradientColor,
              ),
              SizedBox(
                height: getVerticalSize(2),
              ),
              Text(
                'Enter the code you received on your phone number',
                style: GoogleFonts.nunito(
                  fontSize: getFontSize(14),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              SizedBox(
                child: Pinput(
                  controller: controller.pin,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  defaultPinTheme: PinTheme(
                    height: getVerticalSize(59),
                    width: getHorizontalSize(82),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF0F0F0),
                    ),
                  ),
                  onCompleted: (value) {
                    controller.saveOtp(value);
                  },
                ),
              ),
              SizedBox(
                height: getVerticalSize(260),
              ),
              // Obx(
              //   () {
              //     return Visibility(
              //       visible: controller.otp.value.length == 6,
              //       child: CustomElevatedButton(
              //         text: 'Verify',
              //         onPressed: () {
              //           // Get.toNamed(Routes.plans);
              //         },
              //       ),
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: getVerticalSize(50),
              // ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(14),
                  ),
                  children: [
                    const TextSpan(text: "Don’t Receive Code? ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: "Resend Code",
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
