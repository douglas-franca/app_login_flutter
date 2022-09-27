import 'package:app_teste_login/pages/datails_page.dart';
import 'package:app_teste_login/pages/home_page.dart';
import 'package:app_teste_login/pages/login_page.dart';
import 'package:app_teste_login/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}
