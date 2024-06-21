import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomNavItem {
  final IconData outlinedIcon;
  final IconData filledIcon;
  final String title;

  const CustomBottomNavItem({
    required this.outlinedIcon,
    required this.filledIcon,
    required this.title,
  });
}
