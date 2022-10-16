import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  Location location = Location();

  bool serviceEnabled = false;
  PermissionStatus permissionGranted = PermissionStatus.denied;
  LocationData? locationData;

  @override
  void onInit() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    super.onInit();
  }
}
