// import 'package:geolocator/geolocator.dart';

// Future<String> checkPermissions() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Check if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return 'Location services are disabled.';
//   }

//   // Check for location permissions.
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return 'Location permissions are denied';
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return 'Location permissions are permanently denied, we cannot request permissions.';
//   }

//   return "permission granted";
// }
