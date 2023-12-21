import 'package:get/get.dart';
import 'package:weatherapp/app/modules/bottom_nav_bar/controllers/bottom_navbar_controller.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(BottomNavBarController());
  }
}
