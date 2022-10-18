import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/setup/components/topic_chip.dart';
import 'package:ybm/views/setup/controller/setup_controller.dart';

class FiltersScreen extends GetView<SetupController> {
  const FiltersScreen({super.key});

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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          'Filter',
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
              SizedBox(height: getVerticalSize(34)),
              GradientText('Business Type',
                  style: GoogleFonts.poppins(
                    fontSize: getFontSize(20),
                    fontWeight: FontWeight.w500,
                  ),
                  gradient: gradientColor),
              SizedBox(height: getVerticalSize(25)),
              Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Electronic',
                            selected: controller.filters.contains('Electronic'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Shopping',
                            selected: controller.filters.contains('Shopping'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Bar',
                            selected: controller.filters.contains('Bar'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Car',
                            selected: controller.filters.contains('Car'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Travel',
                            selected: controller.filters.contains('Travel'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Coffee',
                            selected: controller.filters.contains('Coffee'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Music',
                            selected: controller.filters.contains('Music'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Football',
                            selected: controller.filters.contains('Football'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Cricket',
                            selected: controller.filters.contains('Cricket'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Bikes',
                            selected: controller.filters.contains('Bikes'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Books',
                            selected: controller.filters.contains('Books'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectFilter(value),
                            title: 'Animals',
                            selected: controller.filters.contains('Animals'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      GradientText(
                        'Ratings',
                        style: GoogleFonts.poppins(
                          fontSize: getFontSize(20),
                          fontWeight: FontWeight.w500,
                        ),
                        gradient: gradientColor,
                      ),
                      SizedBox(height: getVerticalSize(23)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: 'All',
                            selected: controller.ratings.contains('All'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: '1.0',
                            selected: controller.ratings.contains('1.0'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: '2.0',
                            selected: controller.ratings.contains('2.0'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: '3.0',
                            selected: controller.ratings.contains('3.0'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: '4.0',
                            selected: controller.ratings.contains('4.0'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectRating(value),
                            title: '5.0',
                            selected: controller.ratings.contains('5.0'),
                            leading: Image.asset('assets/images/starIcon.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getVerticalSize(19),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: getVerticalSize(120),
              ),
              CustomElevatedButton(
                text: 'Confirm',
                onPressed: () async {
                  if (controller.filters.isEmpty) {
                    Fluttertoast.showToast(msg: "Must pick at least 1 filer");
                  } else if (controller.ratings.isEmpty) {
                    Fluttertoast.showToast(msg: "Must pick at least 1 rating");
                  } else {
                    await controller.saveFilters();
                    Get.offAllNamed(Routes.root);
                  }
                },
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
