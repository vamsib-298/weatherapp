// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/home/views/home_view.dart';

// Define a StatelessWidget for the BottomNavigationBarView
class BottomNavigationBarView extends GetView<BottomNavBarController> {
  // Create an instance of BottomNavBarController using Get.put for state management
  @override
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  // Constructor for the BottomNavigationBarView
  BottomNavigationBarView({super.key});

  // Build method that returns the UI for the bottom navigation bar
  @override
  Widget build(BuildContext context) {
    // Scaffold is a basic material design visual layout structure
    return Scaffold(
      // Obx widget rebuilds when the selectedIndex in the controller changes
      body: Obx(() => getPageOnSelectedMenu(controller.selectedIndex.value)),
      // Display the bottom navigation bar
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  // Define the items for the bottom navigation bar
  List<BottomNavigationBarItem> _getNavItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.wb_sunny),
        label: "Weather",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings",
      ),
    ];
  }

  // Build the bottom navigation bar widget
  Widget bottomNavigationBar() {
    return  BottomNavigationBar(
        items: _getNavItems(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // Update selectedIndex when a tab is tapped
        onTap: (index) {
          controller.updateSelectedIndex(index);
        },
      );
  }

  // Define the content to be displayed based on the selected index
  Widget getPageOnSelectedMenu(int index) {
    switch (index) {
      case 0:
        return const HomeView(); // Display HomeView when index is 0
      case 1:
        return Container(color: Colors.yellow); // Display a yellow container for index 1
      case 2:
        return Container(color: Colors.blue); // Display a blue container for index 2
      default:
        return const HomeView(); // Display HomeView for other indices
    }
  }
}

// Define a controller class for the BottomNavigationBarView
class BottomNavBarController extends GetxController {
  // Observable integer to track the selected index of the bottom navigation bar
  final RxInt selectedIndex = 0.obs;

  // Method to update the selected index based on user interaction
  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
