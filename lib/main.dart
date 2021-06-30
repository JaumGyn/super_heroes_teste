import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_heroes/screens/home/home.dart';
import 'package:super_heroes/provider/super_heroes_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SuperHeroesStore(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        title: 'Super Heroes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: Colors.green.shade200,
            appBarTheme: AppBarTheme(elevation: 0),
            textSelectionTheme:
                TextSelectionThemeData(cursorColor: Colors.orange)),
        home: Home(),
      ),
    );
  }
}
