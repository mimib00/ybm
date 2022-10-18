import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ybm/core/routes/routes.dart';
import 'package:ybm/meta/models/offer.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/widgets/page_name.dart';
import 'package:ybm/views/offers/controller/offers_controller.dart';

class OffersScreen extends GetView<OffersController> {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PageName(pageName: 'Offers'),
            const SizedBox(height: 49),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Active Offer',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            FirestoreListView<Offer>(
              shrinkWrap: true,
              query: controller.offers,
              pageSize: 5,
              itemBuilder: (context, doc) {
                return Text(doc.id);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.offersAdd);
        },
        child: Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: gradientColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 50,
                spreadRadius: 10,
                color: secondaryColor.withOpacity(0.1),
              )
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
