import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pet_adopt/screens/home/screens/home.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('myPets');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'mainScreen',
        routes: {
          'mainScreen': (_) => MainScreen(),
        });
  }
}
