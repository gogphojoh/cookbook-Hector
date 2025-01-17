import 'package:flutter/material.dart';
import 'font_example.dart'; // Importa el archivo con la nueva funcionalidad
import 'drawer.dart';
import 'snack.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/drawer-demo': (context) => const DrawerDemoScreen(),
        '/snack-demo': (context) => const SnackBarPage(),
        '/font-demo': (context) => const FontExample(), // Ruta para la nueva funcionalidad
        '/tab-bar-demo': (context) => const TabBarDemo(), // Ruta para la nueva pantalla TabBarDemo
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = {
      "Design": [
        {"title": "Add a drawer to a screen", "route": "/drawer-demo"},
        {"title": "Display a snackbar", "route": "/snack-demo"},
        {"title": "Add a font to a package", "route": "/font-demo"}, // Nueva opción
        {"title": "TabBar Demo", "route": "/tab-bar-demo"}, // Nueva opción para la pantalla TabBarDemo
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Exercises'),
      ),
      body: ListView.builder(
        itemCount: exercises.keys.length,
        itemBuilder: (context, index) {
          String category = exercises.keys.elementAt(index);
          List<Map<String, String?>> items = exercises[category]!;
          return ExpansionTile(
            title: Text(category),
            children: items.map((item) {
              return ListTile(
                title: Text(item['title']!),
                onTap: () {
                  if (item['route'] != null) {
                    Navigator.pushNamed(context, item['route']!);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Feature not implemented!')),
                    );
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class DrawerDemoScreen extends StatelessWidget {
  const DrawerDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: AppDrawer(
        selectedIndex: 0,
        onItemTapped: (index) {
          // Manejo de la lógica según la opción seleccionada
        },
      ),
      body: const Center(
        child: Text('This is the Drawer Demo Screen'),
      ),
    );
  }
}

// Nueva pantalla de TabBar Demo
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
