// Import the necessary packages
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/bottom_nav_bar/controllers/bottom_navbar_controller.dart';

// Define a binding class for the BottomNavigationBarView
class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    // Lazily put an instance of BottomNavBarController into the GetX dependency injection system
    Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
  }
}
