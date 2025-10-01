import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
    this.icon,
  });
  final String title;
  final String message;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(key: Key("Appbar"), title: Text(title)),
        body: Center(
          child: Column(children: [Text(message), icon ?? SizedBox()]),
        ),
      ),
    );
  }
}
