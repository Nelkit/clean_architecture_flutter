import 'package:flutter/material.dart';
import 'views/views.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_ ) => const HomeView(),
        'detail': (_ ) => const DetailView(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.indigo
          )
      ),
    );
  }
}
