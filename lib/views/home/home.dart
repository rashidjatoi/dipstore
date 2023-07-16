import 'package:dipstore/controller/home_controller.dart';
import 'package:dipstore/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());

    List<BottomNavigationBarItem> navigationItems = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        activeIcon: Icon(Icons.search),
        label: "Search",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        activeIcon: Icon(Icons.shopping_bag),
        label: "Bag",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: "Profile",
      ),
    ];

    var pagesList = [const HomeView(), Container(), Container(), Container()];
    return Obx(() => Scaffold(
          body: pagesList[homeController.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            items: navigationItems,
            currentIndex: homeController.currentIndex.value,
            selectedItemColor: const Color(0xff059669),
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            // showSelectedLabels: false,
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            onTap: (value) {
              homeController.currentIndex.value = value;
            },
          ),
        ));
  }
}
