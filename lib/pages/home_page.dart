import 'package:flutter/material.dart';
import 'package:music_player/components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SafeArea(child: Text('data')),
    );
  }
}
