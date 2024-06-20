import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/model/CustomBottomNavItem.dart';
import 'package:onlineshopping/screens/profile_screen.dart';
import 'package:onlineshopping/utils/ColorToken.dart';
import 'package:onlineshopping/widgets/home/CustomBottomNavigation.dart';
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
          CustomBottomNavItem(icon: CupertinoIcons.home),
          CustomBottomNavItem(icon: CupertinoIcons.square_favorites_alt),
          CustomBottomNavItem(icon: CupertinoIcons.creditcard),
          CustomBottomNavItem(icon: CupertinoIcons.person_2),
        ],
      ),
    );
  }
}
