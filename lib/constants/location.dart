import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GetGeoLocation extends GetxController {
  double? latitude;
  double? longitude;
  var locationName = ''.obs;

@override
  void onInit() {
    super.onInit();
    determinePosition();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = location.latitude;
    longitude = location.longitude;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude!, longitude!);
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark userPlacemark = placemarks[0]; // Get the first placemark

      String cityName = userPlacemark.locality ?? ''; // City name
      String countryName = userPlacemark.country ?? ''; // Country name
      locationName.value = userPlacemark.street ?? ''; // Full address

      print('City: $cityName, Country: $countryName, Address: $locationName');
    } else {
      print('No placemarks found for the provided coordinates');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
