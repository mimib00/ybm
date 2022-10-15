import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';

class CustomDrawerList extends StatefulWidget {
  const CustomDrawerList({Key? key}) : super(key: key);

  @override
  State<CustomDrawerList> createState() => _CustomDrawerListState();
}

class _CustomDrawerListState extends State<CustomDrawerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 639,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/images/drawerUserIcon.png'),
              title: Text(
                'My Business Listing',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("Routes.notification");
              },
              leading: Image.asset('assets/images/drawerNotificationIcon.png'),
              title: Text(
                'Notification',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.chatSearch");
              },
              leading: Image.asset('assets/images/drawerChatIcon.png'),
              title: Text(
                'Chat',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Image.asset('assets/images/drawerEventsIcon.png'),
              title: Text(
                'Events',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.bookmarkedBusiness");
              },
              leading: Image.asset('assets/images/drawerBookmarkIcon.png'),
              title: Text(
                'Bookmarked Businesses',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.searchBusiness");
              },
              leading: Image.asset(
                'assets/images/drawerSearchIcon.png',
                color: Colors.black,
              ),
              title: Text(
                'Business Search',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.youtubeTutorial");
              },
              leading: Image.asset(
                'assets/images/drawerYoutubeIcon.png',
                color: Colors.black,
              ),
              title: Text(
                'YouTube Tutorials',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.FAQ");
              },
              leading: Image.asset(
                'assets/images/drawerInfoIcon.png',
                color: Colors.black,
              ),
              title: Text(
                'FAQ',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.contactUs");
              },
              leading: Image.asset(
                'assets/images/drawerInfoIcon.png',
                color: Colors.black,
              ),
              title: Text(
                'Help',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.black),
              ),
            ),
            const Divider(
              thickness: 0.6,
              color: textColor,
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.termsAndConditions");
              },
              title: Text(
                'Terms & Conditions',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: textColor),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.aboutUs");
              },
              title: Text(
                'About Us',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: textColor),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed("AppLinks.login");
              },
              title: Text(
                'Logout',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400, fontSize: 16, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
