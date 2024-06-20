import 'package:flutter/material.dart';

class CusAppBar extends StatelessWidget {
  final String title;
  const CusAppBar({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0, // Adjust font size
                color: Colors.white, // White text for dark background
              ),
            ),
          ],
        ),
      ),
    );
  }
}
