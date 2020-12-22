/// lib/presentation/home/pages/home_page.dart
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget {

  PageHome({this.username});
  final String username;

  static Route<dynamic> route() => MaterialPageRoute(
        builder: (context) => PageHome(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello, Home!"),
      ),
    );
  }
}
