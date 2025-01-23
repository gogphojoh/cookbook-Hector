import 'package:flutter/material.dart';

class DrawerExercise extends StatefulWidget {
  const DrawerExercise({super.key});

  @override
  State<DrawerExercise> createState() => _DrawerExerciseState();
}

class _DrawerExerciseState extends State<DrawerExercise> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      body: Center(
        child: Text('Selected Index: $_selectedIndex'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              title: const Text('Business'),
              onTap: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}

