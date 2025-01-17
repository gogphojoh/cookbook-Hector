import 'package:flutter/material.dart';

class FontExample extends StatelessWidget {
  const FontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Fonts Example'),
      ),
      body: const Center(
        child: Text(
          'Using the Raleway font from the awesome_package',
          style: TextStyle(
            fontFamily: 'Raleway', // Fuente declarada en pubspec.yaml
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
