import 'package:general/general.dart';

void main(List<String> args) {
  double latitude1 = -6.2088;
  double longitude1 = 106.8456;

  // Data Kedua
  double latitude2 = -6.2156;
  double longitude2 = 106.8652;
  GeneralLibraryBase general_library = GeneralLibraryBase();
  double data = general_library.location.distanceBetween(
    startLatitude: latitude1,
    startLongitude: longitude1,
    endLatitude: latitude2,
    endLongitude: longitude2,
  );
  print(data);

  double distanceInKilometers = convertMetersToKilometers(data);

  print('Jarak dalam meter: ${data.toStringAsFixed(2)} m');

  print('Jarak dalam kilometer: ${distanceInKilometers.toStringAsFixed(2)} km');
}

double convertMetersToKilometers(double meters) {
  return meters / 1000.0;
}
