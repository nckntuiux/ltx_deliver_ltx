import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:superellipse_shape/superellipse_shape.dart';

import 'assets/styles.dart';
import 'assets/strings.dart';

import 'view/home.dart';

int _selectedBottomIndex = 0;

void main() {
  SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  runApp(LunatexApp());
  imageCache.clear();
}

class LunatexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Lunatex',
      debugShowCheckedModeBanner: false,
      theme: ltxTheme,
      home: MyHomePage(),
    );
  }
}