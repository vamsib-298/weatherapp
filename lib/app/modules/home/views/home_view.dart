import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/bottom_nav_bar/views/bottom_navbar_view.dart';
import 'package:weatherapp/app/modules/detail_page/controllers/detail_page_controller.dart';
import 'package:weatherapp/app/modules/detail_page/views/detail_page_view.dart';
import 'package:weatherapp/app/modules/home/controllers/home_controller.dart';
import 'package:weatherapp/res/colors/app_color.dart';
import 'package:weatherapp/res/paddings/app_paddings.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: AppPaddings.searchBar,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchBarColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: AppPaddings.searchbarrow,
                    child: Icon(
                      Icons.search,
                      color: AppColors.iconColor,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller.cityController,
                      onChanged: (value) {
                        controller.filterCities(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter city name',
                        hintStyle: TextStyle(color: AppColors.iconColor),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: AppColors.iconColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.filteredCities.length,
                itemBuilder: (context, index) {
                  return _buildCityBox(controller.filteredCities[index]);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }

  Widget _buildCityBox(Weather weather) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CityWeatherView(weather: weather));
      },
      child: SizedBox(
        width: 200,
        height: 100,
        child: Card(
          margin: const EdgeInsets.all(5.0),
          child: ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(weather.city),
            trailing: Text('${weather.temperature.toStringAsFixed(1)}°C'),
          ),
        ),
      ),
    );
  }
}
