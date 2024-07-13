import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learn_hive/screen/my_home_page.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  final directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
