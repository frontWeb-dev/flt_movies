import 'package:flt_movies/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData(
        cardColor: Colors.black,
      ),
      home: HomeScreen(),
    );
  }
}
