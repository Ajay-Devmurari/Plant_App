import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/screen/cart_screen.dart';
import 'package:plant_app/screen/favorite_screen.dart';
import 'package:plant_app/screen/user_profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    UserProfileScreen(),
  ];

  final List<String> titles = ['Home', 'My Cart', 'Favorites', 'Profile'];

  final List<IconData> icons = [
    Icons.home,
    Icons.shopping_bag_outlined,
    Icons.favorite_outline_rounded,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titles[currentIndex],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.notifications_none_rounded, size: 30),
          ],
        ),
      ),
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SalomonBottomBar(
              backgroundColor: Colors.transparent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              currentIndex: currentIndex,
              onTap: (index) => setState(() => currentIndex = index),
              unselectedItemColor: Colors.grey.shade500,
              items: List.generate(icons.length, (index) {
                return SalomonBottomBarItem(
                  icon: Icon(icons[index]),
                  title: Text(
                    titles[index],
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  selectedColor: Constants.primaryColor,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
