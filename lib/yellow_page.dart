import 'package:flutter/material.dart';

class YellowPage extends StatelessWidget {
  const YellowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yellow Sayfa"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Yellow Page",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
