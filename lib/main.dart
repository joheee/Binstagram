import 'package:binstagram/apptheme.dart';
import 'package:binstagram/home.dart';
import 'package:binstagram/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main(List<String> args){
  runApp(const Binstagram());
}

class Binstagram extends StatelessWidget {
  const Binstagram({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Binstagram',
      // home: HomePage(username: 'johevin'),
      home: const LoginPage(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}