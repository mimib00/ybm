import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/custom_textFormField.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({Key? key}) : super(key: key);

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
      body: Form(
        key: controller.loginForm,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
          child: ListView(
            children: [
              SizedBox(
                height: getVerticalSize(50),
              ),
              GradientText(
                'Login',
                style: GoogleFonts.poppins(
                  fontSize: getFontSize(32),
                  fontWeight: FontWeight.w500,
                ),
                gradient: gradientColor,
              ),
              SizedBox(height: getVerticalSize(2)),
              Text(
                'Enter account details',
                style: GoogleFonts.poppins(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(height: getVerticalSize(25)),
              CustomTextFormField(
                controller: controller.email,
                text: 'Username',
                prefix: Image.asset('assets/images/userIcon.png'),
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(
                text: 'Password',
                controller: controller.password,
                prefix: Image.asset('assets/images/passwordIcon.png'),
                obscure: true,
              ),
              SizedBox(
                height: getVerticalSize(14),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.forgetPassword),
                child: Text(
                  'Forget password',
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.italic,
                    fontSize: getFontSize(12),
                    fontWeight: FontWeight.w400,
                    color: secondaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              CustomElevatedButton(
                text: 'Login',
                onPressed: () {
                  Get.toNamed(Routes.root);
                },
              ),
              SizedBox(
                height: getVerticalSize(60),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 2,
                      color: Color(0xffC4C4C4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'OR',
                      style: GoogleFonts.nunito(
                        fontSize: getFontSize(14),
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Divider(
                    height: 1,
                    thickness: 2,
                    color: Color(0xffC4C4C4),
                  ))
                ],
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: getVerticalSize(60),
                    width: getHorizontalSize(160),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), border: Border.all(color: secondaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/googleImage.png", width: 20),
                        Text("Login with Google",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: getFontSize(12), color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    height: getVerticalSize(60),
                    width: getHorizontalSize(160),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), border: Border.all(color: secondaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/facebookIcon.png", width: 20),
                        Text("Login with Facebook",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400, fontSize: getFontSize(12), color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: GoogleFonts.nunito(
                      fontSize: getFontSize(14),
                    ),
                    children: [
                      const TextSpan(text: "Don’t have an account? ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                        text: "SIGN UP",
                        recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.register),
                        style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
