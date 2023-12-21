// Import the necessary package
import 'package:get/get.dart';

// Define a controller class for the BottomNavigationBarView
class BottomNavBarController extends GetxController {
  // Observable integer to track the selected index of the bottom navigation bar
  RxInt selectedIndex = 0.obs;

  // Method to update the selected index based on user interaction
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
