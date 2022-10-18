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

class TopicsScreen extends GetView<SetupController> {
  const TopicsScreen({super.key});

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
              SizedBox(height: getVerticalSize(60)),
              Center(
                child: GradientText(
                  'Select topic of interest',
                  align: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: getFontSize(32),
                    fontWeight: FontWeight.w500,
                  ),
                  gradient: gradientColor,
                ),
              ),
              SizedBox(height: getVerticalSize(37)),
              Obx(
                () {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Electronic',
                            selected: controller.topics.contains('Electronic'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Shopping',
                            selected: controller.topics.contains('Shopping'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Bar',
                            selected: controller.topics.contains('Bar'),
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
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Car',
                            selected: controller.topics.contains('Car'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Travel',
                            selected: controller.topics.contains('Travel'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Coffee',
                            selected: controller.topics.contains('Coffee'),
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
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Music',
                            selected: controller.topics.contains('Music'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Football',
                            selected: controller.topics.contains('Football'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Cricket',
                            selected: controller.topics.contains('Cricket'),
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
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Bikes',
                            selected: controller.topics.contains('Bikes'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Books',
                            selected: controller.topics.contains('Books'),
                          ),
                          TopicChip(
                            onTap: (value) => controller.selectTopic(value),
                            title: 'Animals',
                            selected: controller.topics.contains('Animals'),
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
                height: getVerticalSize(140),
              ),
              CustomElevatedButton(
                text: 'Confirm',
                onPressed: () async {
                  if (controller.topics.length < 3) {
                    Fluttertoast.showToast(msg: "Must pick at least 3 topics");
                    return;
                  }
                  await controller.saveTopics();
                  Get.toNamed(Routes.filters);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
