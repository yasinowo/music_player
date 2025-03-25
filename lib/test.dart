import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/images/image3.png')),
      ),
    );
  }
}
