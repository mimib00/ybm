import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/custom_text_form_field.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

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
        key: controller.registerForm,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: getVerticalSize(30),
              ),
              GradientText(
                'Sign Up',
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
                'Add your details to create an account',
                style: GoogleFonts.poppins(
                  fontSize: getFontSize(16),
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(
                controller: controller.name,
                text: 'Full Name',
                prefix: Image.asset('assets/images/userIcon.png'),
                keyboard: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Must enter a name";
                  return null;
                },
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(
                controller: controller.username,
                text: 'Username',
                prefix: Image.asset('assets/images/userIcon.png'),
                keyboard: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Must enter a username";
                  return null;
                },
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
              CustomTextFormField(
                controller: controller.email,
                text: 'Email',
                prefix: const Icon(Icons.email_outlined),
                keyboard: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Must enter a Email";
                  if (!value.isEmail) return "Email not valid";
                  return null;
                },
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              IntlPhoneField(
                validator: (value) {
                  if (value == null || value.number.isEmpty) {
                    return "Field is required";
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.phone = value.completeNumber;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  hintText: "Phone number",
                  hintStyle: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    fontSize: getFontSize(14),
                    color: textColor,
                  ),
                  fillColor: const Color(0xffF0F0F0),
                  filled: true,
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Color(0xffF0F0F0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.white60,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(
                controller: controller.password,
                text: 'Password',
                prefix: Image.asset('assets/images/passwordIcon.png'),
                obscure: true,
                keyboard: TextInputType.visiblePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Must enter a password";
                  if (value.length < 8) return "Password must be 8 or more characters";
                  return null;
                },
              ),
              SizedBox(
                height: getVerticalSize(30),
              ),
              CustomElevatedButton(
                text: 'Next',
                onPressed: () {
                  if (controller.registerForm.currentState!.validate()) {
                    Get.toNamed(Routes.company);
                  }
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
                  )),
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
                    ),
                  ),
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
                        text: "SIGN IN",
                        recognizer: TapGestureRecognizer()..onTap = () => Get.offAllNamed(Routes.login),
                        style: const TextStyle(color: secondaryColor, fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
              SizedBox(
                height: getVerticalSize(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
