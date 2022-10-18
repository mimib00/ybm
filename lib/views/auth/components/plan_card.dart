import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> perks;
  final String packageName;
  final bool free;
  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.perks,
    required this.packageName,
    this.free = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: free ? Border.all(color: secondaryColor) : null,
        gradient: free ? null : gradientColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: getVerticalSize(24)),
            Text(
              title,
              style: GoogleFonts.sourceSansPro(
                fontSize: getFontSize(18),
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: getVerticalSize(8)),
            Text(
              price,
              style: GoogleFonts.sourceSansPro(
                fontSize: getFontSize(22),
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: getVerticalSize(33),
            ),
            ...perks
                .map(
                  (e) => SizedBox(
                    width: getHorizontalSize(386),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_rounded,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          e,
                          style: GoogleFonts.nunito(
                            fontSize: getFontSize(14),
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            SizedBox(
              height: getVerticalSize(50),
            ),
            free
                ? CustomElevatedButton(
                    text: packageName,
                    onPressed: () {
                      Get.offAllNamed(Routes.thanks);
                    },
                  )
                : ElevatedButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: "Not available yet");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      packageName,
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
