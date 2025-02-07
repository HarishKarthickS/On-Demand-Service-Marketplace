import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(OnDemandServiceApp());
}

class OnDemandServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'On-Demand Service Marketplace',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
