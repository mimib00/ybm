import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/widgets/page_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const PageName(pageName: 'Dashboard'),
          const SizedBox(
            height: 49,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                reviewContainer('4.9', '253 Reviews', 'assets/images/blueStarIcon.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: reviewContainer('44k', 'Views', 'assets/images/blueEyeIcon.png'),
                ),
                reviewContainer('443', 'Likes', 'assets/images/blueLikeIcon.png')
              ],
            ),
          ),
          const SizedBox(
            height: 54,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/graph.png',
                height: 199,
                width: Get.width,
                fit: BoxFit.fitWidth,
              ),
              Positioned(top: 9, right: 39, child: Image.asset('assets/images/exchangeIcon.png')),
              Positioned(top: 9, right: 12, child: Image.asset('assets/images/filterIcon.png')),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Reviews',
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                Container(
                  height: 28,
                  width: 72,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
                  child: Center(
                      child: Text(
                    'View All',
                    style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: secondaryColor),
                  )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          recentReviewTile('assets/images/profilePicture1.png'),
          recentReviewTile('assets/images/profilePicture2.png'),
          recentReviewTile('assets/images/profilePicture3.png'),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget reviewContainer(String rating, String reviewCount, String image) {
    return Container(
      height: 69.68,
      width: 115,
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 9,
          ),
          Row(
            children: [
              const SizedBox(
                width: 9,
              ),
              Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Image.asset(image)),
              const SizedBox(
                width: 11,
              ),
              Text(
                rating,
                style: GoogleFonts.nunito(fontSize: 15, fontWeight: FontWeight.w700, color: secondaryColor),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(
              reviewCount,
              style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget recentReviewTile(String image) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        'John Doe',
        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      subtitle: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.',
        softWrap: true,
        style: GoogleFonts.nunito(
            fontStyle: FontStyle.italic, fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
      ),
      trailing: SizedBox(
        height: 16,
        width: 38,
        child: Row(
          children: [
            Image.asset('assets/images/starIcon.png'),
            Text(
              '4.8',
              style: GoogleFonts.nunito(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
