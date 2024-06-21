import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:onlineshopping/utils/color_token.dart';

class SearchBox extends StatefulWidget {
  final String hintText;
  final Function(String) onSearch;

  const SearchBox({
    super.key,
    required this.hintText,
    required this.onSearch,
  });

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _authService = FirebaseAuth.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

   Future<void> _signOut() async {
    await _authService.signOut();
   }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.borderRadius.all(8),
        // $box.margin.top(30),
        $box.padding.all(20),
      ),
      child: Box(
        style: Style(
        $box.borderRadius.all(8),
        $box.color($token.color.cardBackgroundColor.resolve(context)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => widget.onSearch(value),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.signpost_outlined),
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
