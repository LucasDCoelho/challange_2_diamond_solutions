import 'package:desafio_2/components/drawer.dart';
import 'package:desafio_2/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Desafio 2"),
          ),
          drawer: DrawerNavBar(),
          body: Container(
            padding: const EdgeInsets.all(8.0),
            child: const HomeScreen(),
            ),
          ),
        );
  }
}
