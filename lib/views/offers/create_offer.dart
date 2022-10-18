import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/custom_text_form_field.dart';
import 'package:ybm/views/offers/controller/offers_controller.dart';

class CreateOfferScreen extends GetView<OffersController> {
  const CreateOfferScreen({super.key});

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
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Add New Offer',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: getVerticalSize(25)),
              Container(
                height: getVerticalSize(126),
                width: getHorizontalSize(388),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffd9f4ff)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/uploadIcon.png'),
                    Text(
                      'Upload Company Image',
                      style: GoogleFonts.nunito(
                        fontSize: getFontSize(16),
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getVerticalSize(25)),
              CustomTextFormField(
                controller: TextEditingController(),
                text: 'Offer Title',
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                text: 'Offer Description',
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 59,
                    width: 160,
                    child: CustomTextFormField(controller: TextEditingController(), text: 'Offer Start From'),
                  ),
                  SizedBox(
                    height: 59,
                    width: 160,
                    child: CustomTextFormField(controller: TextEditingController(), text: 'Offer End on'),
                  ),
                ],
              ),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomTextFormField(controller: TextEditingController(), text: 'Discount Percentage'),
              SizedBox(
                height: getVerticalSize(25),
              ),
              CustomElevatedButton(text: 'Confirm', onPressed: () {}),
              SizedBox(
                height: getVerticalSize(25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
