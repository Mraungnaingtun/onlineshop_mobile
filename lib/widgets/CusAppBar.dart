import 'package:flutter/material.dart';
import 'package:onlineshopping/widgets/CustomSearchDelegate.dart';

class CusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function(String) onSearch;

  const CusAppBar({super.key, required this.title, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(title),
          const Spacer(),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(onSearch: onSearch),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
