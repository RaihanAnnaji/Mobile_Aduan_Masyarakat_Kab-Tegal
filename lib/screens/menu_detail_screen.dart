import 'package:flutter/material.dart';

class MenuDetailScreen extends StatelessWidget {
  final String title;

  const MenuDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Ini halaman detail untuk menu:\n$title',
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
