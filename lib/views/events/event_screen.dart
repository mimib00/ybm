import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/meta/widgets/page_name.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PageName(pageName: 'Events'),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: GestureDetector(
              // onTap: () => Get.toNamed(AppLinks.eventTicket),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/eventImg1.png',
                    height: 182,
                    width: 374,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      left: 17,
                      bottom: 33,
                      child: Text(
                        'Webinar Title',
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
                      )),
                  Positioned(
                      left: 2,
                      bottom: 12,
                      child: Image.asset(
                        'assets/images/eventStackImgIcon.png',
                        height: 16,
                        width: 16,
                        fit: BoxFit.fill,
                      )),
                  Positioned(
                      left: 37,
                      bottom: 12,
                      child: Text(
                        '25/12/2022',
                        style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Upcoming Events',
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                Row(
                  children: [
                    Container(
                      height: 28,
                      width: 72,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
                      child: Center(
                          child: Text(
                        'View All',
                        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryColor),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset('assets/images/exchangeIcon.png'),
                    ),
                    Image.asset('assets/images/filterIcon.png')
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          eventTile('assets/images/eventImg2.png'),
          const SizedBox(
            height: 15,
          ),
          eventTile('assets/images/eventImg3.png'),
          const SizedBox(
            height: 15,
          ),
          eventTile('assets/images/eventImg4.png'),
        ],
      ),
    );
  }

  Widget eventTile(String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.eventTicket),
        child: Container(
          height: 150,
          width: 374,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 125,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Meet & Greet with Julia Morris',
                    style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Julia Morrison',
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.w400, color: textColor.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GradientText(
                    '\$750',
                    gradient: gradientColor,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/walletIcon.png'),
                      Text(
                        '25 / 02 / 2022',
                        style: GoogleFonts.nunito(
                            fontSize: 12, fontWeight: FontWeight.w400, color: textColor.withOpacity(0.7)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/clockIcon.png'),
                      Text(
                        '3 min',
                        style: GoogleFonts.nunito(
                            fontSize: 12, fontWeight: FontWeight.w400, color: textColor.withOpacity(0.7)),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
