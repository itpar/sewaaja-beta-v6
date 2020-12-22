/// lib/presentation/search/pages/search_page.dart
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => SearchPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello, Search!"),
      ),
    );
  }
}
