import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/page_name.dart';

class EventTickets extends StatelessWidget {
  const EventTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 39),
          child: Image.asset(
            'assets/images/menuIcon.png',
          ),
        ),
        elevation: 0,
        title: Image.asset(
          'assets/images/groupLogo.png',
          width: 158,
          height: 80.02,
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 39, right: 20),
            child: GestureDetector(
              onTap: () {
                // Get.toNamed(AppLinks.notification);
              },
              child: Container(
                height: 39,
                width: 39,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                child: Image.asset('assets/images/notificationIcon.png'),
              ),
            ),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          const PageName(pageName: 'Events'),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'OCT\n22',
              style:
                  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.56)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'UK Black Business Show 2022',
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
              style:
                  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.68)),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "by Black UK Business",
              style:
                  GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.68)),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomElevatedButton(text: 'Tickets', onPressed: () {}),
          ),
          const SizedBox(
            height: 42,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/calenderIcon.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Date',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.87)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Sat,22 Oct 2022\n09:00 - 12:00 BST',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.68)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/locationIcon.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'location',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.87)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Business Design\nCenter 22 Up\nStreet , London',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.68)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/refundIcon.png',
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Refund Policies',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.87)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'No Refund',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.68)),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
