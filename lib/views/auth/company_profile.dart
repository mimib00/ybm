import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:ybm/core/controllers/location_controller.dart';
import 'package:ybm/meta/utils/constants.dart';
import 'package:ybm/meta/utils/math_utils.dart';
import 'package:ybm/meta/widgets/custom_elevated_button.dart';
import 'package:ybm/meta/widgets/custom_text_form_field.dart';
import 'package:ybm/meta/widgets/gradient_text.dart';
import 'package:ybm/meta/widgets/image_selector.dart';
import 'package:ybm/views/auth/components/location_picker.dart';
import 'package:ybm/views/auth/components/photo_picker.dart';
import 'package:ybm/views/auth/components/tag_chip.dart';
import 'package:ybm/views/auth/controller/auth_controller.dart';

class CompanyProfile extends GetView<AuthController> {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getVerticalSize(90),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/images/groupLogo.png',
          height: getVerticalSize(88),
          width: getHorizontalSize(173.76),
          fit: BoxFit.fill,
        ),
      ),
      body: Form(
        key: controller.companyForm,
        child: Padding(
          padding: EdgeInsets.only(
            left: getHorizontalSize(20),
            right: getHorizontalSize(20),
            bottom: 30,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: getVerticalSize(30),
                ),
                GradientText(
                  'Setup Company Profile',
                  style: GoogleFonts.poppins(
                    fontSize: getFontSize(28),
                    fontWeight: FontWeight.w500,
                  ),
                  gradient: gradientColor,
                ),
                SizedBox(
                  height: getVerticalSize(2),
                ),
                Text(
                  'Add your company details to create an account',
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(16),
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                ImageSelector(
                  onTap: (photo) {
                    if (photo == null) return;
                    controller.setPhoto(photo);
                  },
                ),
                SizedBox(
                  height: getVerticalSize(35),
                ),
                CustomTextFormField(
                  controller: controller.businessName,
                  text: 'Business Name',
                  prefix: Image.asset('assets/images/userIcon.png'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Must enter a Business Name";
                    return null;
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                CustomTextFormField(
                  controller: controller.businessDescription,
                  text: 'Business Description',
                  lines: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Must enter a Business Description";
                    return null;
                  },
                ),
                // SizedBox(
                //   height: getVerticalSize(25),
                // ),
                // CustomTextFormField(
                //   controller: controller.businessAddress,
                //   text: 'Business Address',
                //   prefix: Image.asset('assets/images/userIcon.png'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) return "Must enter a Address";
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Obx(
                  () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Visibility(
                          visible: controller.address.value.isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Business Address',
                                style: GoogleFonts.poppins(
                                  fontSize: getFontSize(14),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                // width: 100.w,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF0F0F0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(controller.address.value),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(25),
                        ),
                        Text(
                          'Select business address by clicking on the map',
                          style: GoogleFonts.poppins(
                            fontSize: getFontSize(10),
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: getVerticalSize(5),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 200,
                            width: 100.w,
                            child: GoogleMap(
                              onTap: (position) {
                                Get.to(
                                  () => LocationPicker(
                                    onSelect: (value) {
                                      final LocationController locationController = Get.find();
                                      controller.selectLocation(
                                        LatLng(
                                          value.geometry?.location.lat ?? locationController.locationData!.latitude!,
                                          value.geometry?.location.lng ?? locationController.locationData!.longitude!,
                                        ),
                                        value.formattedAddress ?? "",
                                      );
                                    },
                                    initialPosition: position,
                                  ),
                                );
                              },
                              initialCameraPosition: controller.cameraPosition,
                              markers: controller.markers,
                              zoomControlsEnabled: false,
                              zoomGesturesEnabled: false,
                              scrollGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              rotateGesturesEnabled: false,
                              onMapCreated: (GoogleMapController ctrl) {
                                controller.mapController.complete(ctrl);
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Text(
                  'Business Category',
                  style: GoogleFonts.poppins(
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                CustomTextFormField(
                  controller: controller.businessCategory,
                  text: 'Type Business Category',
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Must enter a Business Category";
                    return null;
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Text(
                  'Social Media tags',
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Obx(
                  () {
                    return Wrap(
                      children: controller.tags
                          .map(
                            (e) => TagChip(
                              title: e,
                              delete: () {
                                controller.removeTag(e);
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: controller.tag,
                        text: 'Type Tags',
                        validator: (value) {
                          if (controller.tags.isEmpty) return "Tags must not be empty";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(180),
                        ),
                        backgroundColor: secondaryColor,
                      ),
                      onPressed: () {
                        controller.addTag();
                      },
                      child: const Icon(Icons.check),
                    )
                  ],
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Text(
                  'Images (max 5)',
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Obx(
                  () {
                    return SizedBox(
                      height: getVerticalSize(104),
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          ...controller.photos
                              .map(
                                (element) => SizedBox(
                                  height: getVerticalSize(104),
                                  width: getHorizontalSize(104),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.file(
                                              element,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          top: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.removePhotos(element);
                                            },
                                            child: const CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              child: Icon(
                                                Icons.close_rounded,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          Visibility(
                            visible: controller.photos.length < 5,
                            child: PhotoPicker(
                              onSelect: (photo) {
                                if (photo == null) return;
                                controller.addPhotos(photo);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                CustomTextFormField(
                  controller: controller.vat,
                  text: 'VAt Reg. Number (Optional)',
                  prefix: Image.asset('assets/images/userIcon.png'),
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                Text(
                  'Prof of Ownership',
                  style: GoogleFonts.nunito(
                    fontSize: getFontSize(14),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                Obx(
                  () {
                    return SizedBox(
                      height: getVerticalSize(104),
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          ...controller.proof
                              .map(
                                (element) => SizedBox(
                                  height: getVerticalSize(104),
                                  width: getHorizontalSize(104),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.file(
                                              element,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          top: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.removeProof(element);
                                            },
                                            child: const CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.red,
                                              foregroundColor: Colors.white,
                                              child: Icon(
                                                Icons.close_rounded,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          Visibility(
                            visible: controller.proof.length < 2,
                            child: PhotoPicker(
                              onSelect: (photo) {
                                if (photo == null) return;
                                controller.addProof(photo);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
                CustomElevatedButton(
                  text: 'Confirm',
                  onPressed: () async {
                    // if (controller.companyForm.currentState!.validate()) {
                    //   if (controller.photo == null) {
                    //     Fluttertoast.showToast(msg: "Must provide company image");
                    //   } else if (controller.location.value == null) {
                    //     Fluttertoast.showToast(msg: "Must select business location");
                    //   } else if (controller.photos.isEmpty) {
                    //     Fluttertoast.showToast(msg: "Must provide images");
                    //   } else {
                    //     await controller.register();
                    //   }
                    // }
                    await controller.register();
                  },
                ),
                SizedBox(
                  height: getVerticalSize(25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
