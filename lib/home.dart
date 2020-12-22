import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_loginn/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter_loginn/presentation/tabs/pages/tabs_page.dart';


class HomePage extends StatelessWidget {

  final String username;

  HomePage({this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsPage(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.muliTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}



