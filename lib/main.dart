import 'package:flutter/material.dart';
import 'package:responsi/ui/ikan_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default widget is a CircularProgressIndicator while checking the login status.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi Ikan',
      debugShowCheckedModeBanner: false,
      home: IkanPage(), // The displayed page is determined by the login status.
    );
  }
}

