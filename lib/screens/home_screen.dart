import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/widgets/home/bottom_navigation_item.dart';
import 'package:onlineshopping/screens/profile_screen.dart';
import 'package:onlineshopping/utils/color_token.dart';
import 'package:onlineshopping/widgets/home/custom_bottom_navigation.dart';
import 'package:onlineshopping/widgets/home/home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeContent(),
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: $token.color.surface.resolve(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
        items: const [
           CustomBottomNavItem(
            outlinedIcon: CupertinoIcons.house_alt,
            filledIcon: CupertinoIcons.house_alt_fill,
            title: "Home"
          ),
          CustomBottomNavItem(
            outlinedIcon: CupertinoIcons.square_favorites_alt,
            filledIcon: CupertinoIcons.square_favorites_alt_fill,
            title: "Favrouite"
          ),
          CustomBottomNavItem(
            outlinedIcon: CupertinoIcons.creditcard,
            filledIcon: CupertinoIcons.creditcard_fill,
            title: "Saved"
          ),
          CustomBottomNavItem(
            outlinedIcon: CupertinoIcons.person_2,
            filledIcon: CupertinoIcons.person_2_fill,
            title: "Account"
          ),
        ],
      ),
    );
  }
}
