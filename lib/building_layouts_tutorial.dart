import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutsTutorialApp());
}

class LayoutsTutorialApp extends StatelessWidget {
  const LayoutsTutorialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo')
        ),
        body: const Center(
          child: Text('Hello world')
        )
      )
    );
  }
}
