import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/utils/color_token.dart';
import 'package:onlineshopping/widgets/home/bottom_navigation_item.dart';

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
      height: 58.0,
      child: Box(
        style: Style(
            $box.borderRadius(12, 12, 0, 0),
            $box.border(
                width: 0.01, style: BorderStyle.solid, strokeAlign: 0.01)),
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
                  SizedBox(
                    width: 74.0,
                    child: Icon(
                      currentIndex == index
                          ? item.filledIcon
                          : item.outlinedIcon,
                      color: currentIndex == index
                          ? $token.color.primary.resolve(context)
                          : Colors.grey,
                      size: 24.0,
                    ),
                  ),
                   Text(
                   item.title,
                    style: TextStyle(
                     color: currentIndex == index
                          ? $token.color.primary.resolve(context)
                          : Colors.grey,
                    ),
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
