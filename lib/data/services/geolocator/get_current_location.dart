// import 'package:geolocator/geolocator.dart';

// abstract class CurrentLocation {
//   Future<Map<String, dynamic>> determinePosition();
// }

// class CurrentLocationIMPL extends CurrentLocation {
//   @override
//   Future<Map<String, dynamic>> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.',
//       );
//     }

//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     return {
//       'latitude': position.latitude,
//       'longitude': position.longitude,
//     };
//   }
// }
