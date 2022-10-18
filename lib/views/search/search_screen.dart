import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/meta/widgets/page_name.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const PageName(
            pageName: 'Find Business',
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GradientText(
              'Business of the Month',
              gradient: gradientColor,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              'assets/images/searchScreenImageOne.png',
              height: 191,
              width: 380,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 58,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: Text(
                      'The New Startup Business',
                      style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/starIcon.png'),
                      Padding(
                        padding: const EdgeInsets.only(right: 11.0),
                        child: Text(
                          '4(2.5k)',
                          style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w600, fontSize: 13, color: const Color(0xffFEC810)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GradientText(
              'Business Categories',
              gradient: gradientColor,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categoriesContainers('assets/images/searchScreenCoffeeIcon.png'),
                categoriesContainers('assets/images/searchScreenRiceBowl.png'),
                categoriesContainers('assets/images/searchScreenBowlAndCoffee.png'),
                categoriesContainers('assets/images/searchScreenGirl.png')
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GradientText(
                  'Featured Business',
                  gradient: gradientColor,
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GradientText(
                  'View All',
                  gradient: gradientColor,
                  style: GoogleFonts.nunito(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 141,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/searchScreenSofasImage.png',
                    height: 141,
                    width: 136,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'The New Startup\nBusiness',
                        style: GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Loremipsum\nLoremipsum',
                        style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: secondaryColor),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Text(
                            '4(2.5k)',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w600, fontSize: 13, color: const Color(0xffFEC810)),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Container(
                            height: 26,
                            width: 78,
                            decoration: BoxDecoration(gradient: gradientColor, borderRadius: BorderRadius.circular(2)),
                            child: Center(
                              child: Text(
                                'Details',
                                style:
                                    GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget categoriesContainers(String image) {
    return Column(
      children: [
        Container(
          height: 81,
          width: 81,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          child: Image.asset(image),
        ),
        const SizedBox(
          height: 8,
        ),
        GradientText(
          'Business',
          gradient: gradientColor,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
