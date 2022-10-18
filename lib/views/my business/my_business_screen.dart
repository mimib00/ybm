import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';

class MyBusinessScreen extends StatelessWidget {
  const MyBusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/rangeRover.png',
                  height: 325,
                  width: 428,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  left: 16,
                  top: 59,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 52,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppLinks.notification);
                    },
                    child: Container(
                      height: 39,
                      width: 39,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                      child: Image.asset(
                        'assets/images/notificationIcon.png',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.000001,
                  child: Container(
                    height: 49,
                    width: Get.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: secondaryColor,
                    ),
                    child: Center(
                        child: Text(
                      'Click here to redeem your 50% time offer',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 69,
                  child: Row(
                    children: [
                      ratingButtons('assets/images/starIcon.png', '4.8'),
                      const SizedBox(
                        width: 4,
                      ),
                      iconButtons('assets/images/threeDots.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      iconButtons('assets/images/shareIcon.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      iconButtons('assets/images/bookmarkIcon.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      iconButtons('assets/images/commentIcon.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      iconButtons('assets/images/likeIcon.png'),
                      const SizedBox(
                        width: 4,
                      ),
                      ratingButtons('assets/images/eyeIcon.png', '25k')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bros Car Club',
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  Container(
                    height: 30.86,
                    width: 93,
                    decoration: BoxDecoration(
                        gradient: gradientColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(blurRadius: 50, spreadRadius: 10, color: Colors.black.withOpacity(0.15))
                        ]),
                    child: Center(
                      child: Text(
                        'Edit',
                        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.black,
                    size: 16,
                  ),
                  Text(
                    '71-75 Shelton Street, Covent Garden\nLondon, England',
                    style: GoogleFonts.nunito(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 59,
              color: Colors.white,
              child: TabBar(
                isScrollable: true,
                indicatorColor: secondaryColor,
                labelColor: secondaryColor,
                labelStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w700),
                unselectedLabelColor: textColor,
                unselectedLabelStyle: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400),
                tabs: const [
                  Text('About'),
                  Text("Services"),
                  Text('Photos'),
                  Text('Map'),
                  Text('Reviews'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                aboutTab(),
                servicesTab(),
                photosTab(),
                mapTab(),
                reviewsTab(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget ratingButtons(String image, String text) {
    return Container(
      height: getVerticalSize(33),
      width: getHorizontalSize(82),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            text,
            style: GoogleFonts.nunito(
              fontSize: getFontSize(14),
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButtons(String image) {
    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Image.asset(image),
    );
  }

  Widget aboutTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text:
                      'Bros Car Club began with a vision. A vision to serve the market with the highest quality & increasingly accessible luxury car options around. With a strong vast and capable network, our founders',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 14, color: textColor)),
              TextSpan(
                  text: ' Read more...',
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 14, color: secondaryColor))
            ])),
            const SizedBox(
              height: 186,
            ),
            CustomElevatedButton(text: 'Contact Business Now', onPressed: () {}),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget servicesTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 31,
            ),
            servicesListTile('assets/images/carBlueImg.png'),
            const SizedBox(
              height: 15,
            ),
            servicesListTile('assets/images/carRedImg.png'),
            const SizedBox(
              height: 21,
            ),
            CustomElevatedButton(text: 'Contact Business Now', onPressed: () {}),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget servicesListTile(String image) {
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: ListTile(
        leading: Image.asset(
          image,
          height: 75,
          width: 81,
          fit: BoxFit.cover,
        ),
        isThreeLine: true,
        title: Text('THE CAR RIDE',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medium', style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black)),
            Text('Lorem Ipsum is simply dummy text of the printing and typesett.',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 12, color: textColor)),
          ],
        ),
        trailing: Text('\$750.0',
            style: GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 14, color: secondaryColor)),
      ),
    );
  }

  Widget photosTab() {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 30,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
            children: [
              Image.asset('assets/images/carWhiteImg.png', height: 145, width: 186, fit: BoxFit.contain),
              Image.asset('assets/images/carRollsImg.png', height: 145, width: 186, fit: BoxFit.contain),
              Image.asset('assets/images/carRollsImg.png', height: 145, width: 186, fit: BoxFit.contain),
              Image.asset('assets/images/carBenelyImg.png', height: 145, width: 186, fit: BoxFit.contain),
            ],
          ),
        )
      ],
    );
  }

  Widget mapTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/rect.png',
                  height: 322,
                  width: 388,
                  fit: BoxFit.fill,
                ),
                Positioned(
                    top: 171,
                    left: 157,
                    child: Image.asset(
                      'assets/images/groupBlueEllipse.png',
                      height: 39,
                      width: 39,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  top: 120,
                  left: 197,
                  child: Container(
                    height: 55,
                    width: 182,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 50)]),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '71- 75 Shelton Street – Covent Garden',
                        style: GoogleFonts.nunito(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    )),
                  ),
                ),
                Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Image.asset('assets/images/exchangeIcon.png')),
                Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/images/filterIcon.png')))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget reviewTile(String image, String name) {
    return ListTile(
      leading: Image.asset(
        image,
        height: 67,
        width: 77.6,
        fit: BoxFit.fill,
      ),
      isThreeLine: true,
      title: Text(
        name,
        style: GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w600),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '12 Dec, 2021',
            style: GoogleFonts.sourceSansPro(
                fontSize: 12, fontWeight: FontWeight.w600, color: const Color(0xff707586).withOpacity(0.7)),
          ),
          Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout',
            style: GoogleFonts.sourceSansPro(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xff0F1218)),
          ),
        ],
      ),
      trailing: RatingBar.builder(
          itemSize: 10,
          initialRating: 1,
          itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
          onRatingUpdate: (rating) {}),
    );
  }

  Widget reviewsTab() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        reviewTile('assets/images/0elizaProfile.png', 'Elizabeth Chris'),
        const SizedBox(
          height: 15,
        ),
        reviewTile('assets/images/saraThomas.png', 'Sara Thomas'),
        const SizedBox(
          height: 15,
        ),
        reviewTile('assets/images/jeffSam.png', 'Jeff Sam'),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomElevatedButton(text: 'Contact Business Now', onPressed: () {}),
        )
      ],
    ));
  }
}
