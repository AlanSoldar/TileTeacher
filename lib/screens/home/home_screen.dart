import 'package:flutter/material.dart';
import 'package:tile_teacher/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(title: 'Tile Teacher'),
    );
  }
}
