import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/model/CustomBottomNavItem.dart';
import 'package:onlineshopping/utils/ColorToken.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final List<CustomBottomNavItem> items;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      child: Box(
        style: Style(
           $box.borderRadius.all(30.0),
          $box.border(
            width: 0.1,
            style: BorderStyle.solid,
            strokeAlign: 0.1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: items.asMap().entries.map((entry) {
            int index = entry.key;
            CustomBottomNavItem item = entry.value;
            return GestureDetector(
              onTap: () => onItemTapped(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    size: 28.0,
                    color: currentIndex == index
                        ? $token.color.primary.resolve(context)
                        : Colors.grey,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
