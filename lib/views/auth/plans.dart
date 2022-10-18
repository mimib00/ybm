import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/views/auth/components/plan_card.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class PlansScreen extends GetView<AuthController> {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(20)),
            child: Column(
              children: [
                SizedBox(
                  height: getVerticalSize(20),
                ),
                GradientText(
                  'Choose the best plan for your Business',
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(18),
                    fontWeight: FontWeight.w700,
                  ),
                  gradient: gradientColor,
                ),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                const PlanCard(
                  title: 'Free Version',
                  price: '\$ 0.00 /month',
                  perks: [
                    'Minimal data',
                    'Minimal media',
                  ],
                  packageName: 'Choose Free Version',
                  free: true,
                ),
                const PlanCard(
                  title: 'Startup Package(Recommended)',
                  price: '\$ 25.00 /month',
                  perks: [
                    'Minimal data',
                    'Minimal media',
                    "Exercitation veniam ",
                    "Exercitation consequat nostrud",
                    'Amet minim mollit ',
                  ],
                  packageName: 'Choose Startup Package',
                ),
                const PlanCard(
                  title: 'Premium Package',
                  price: '\$ 85.99 /month',
                  perks: [
                    'Minimal data',
                    'Minimal media',
                    "Exercitation veniam ",
                    "Exercitation consequat nostrud",
                    'Amet minim mollit ',
                    "Exercitation veniam ",
                    "Exercitation consequat nostrud",
                    'Amet minim mollit ',
                  ],
                  packageName: 'Choose Premium Package',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
