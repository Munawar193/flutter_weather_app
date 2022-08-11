import 'package:pawang_hujan/app/data/services/weather_service.dart';
import 'package:get/get.dart';

import '../../../../data/models/weather_model/weather_mode.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  String city;
  HomeController({required this.city});
  CurrentWeatherData currentWeatherData = const CurrentWeatherData();

  @override
  void onInit() {
    initState();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
  }

  void getCurrentWeatherData() {
    WeatherService(city: city).getCurrentWeatherData(
        onSuccess: (data) {
          isLoading.value = false;
          currentWeatherData = data;
          update();
          isLoading.value = true;
        },
        onError: (error) => {
              print(error),
              update(),
            });
  }
}
