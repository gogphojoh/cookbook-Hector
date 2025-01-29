import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<CategoriaInventario>> fetchCategoriasInventario() async {
  final response = await http
      .get(Uri.parse('http://localhost:5168/api/CategoriasInventario'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData
        .map((data) =>
            CategoriaInventario.fromJson(data as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Failed to load categorias inventario');
  }
}

class CategoriaInventario {
  final int id;
  final String nombre;
  final String? descripcion;
  final DateTime createdAt;

  const CategoriaInventario({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.createdAt,
  });

  factory CategoriaInventario.fromJson(Map<String, dynamic> json) {
    return CategoriaInventario(
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      descripcion: json['descripcion'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CategoriaInventario>? categorias;
  bool isLoading = false;
  String? errorMessage;

  Future<void> _fetchCategorias() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final result = await fetchCategoriasInventario();
      setState(() {
        categorias = result;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Categorias Inventario'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: isLoading ? null : _fetchCategorias,
                child: const Text('Fetch Categorias'),
              ),
              const SizedBox(height: 20),
              if (isLoading) const CircularProgressIndicator(),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              if (categorias != null)
                Expanded(
                  child: ListView.builder(
                    itemCount: categorias!.length,
                    itemBuilder: (context, index) {
                      final categoria = categorias![index];
                      return Card(
                        child: ListTile(
                          title: Text(categoria.nombre),
                          subtitle: Text(
                              'Description: ${categoria.descripcion ?? 'None'}\nCreated At: ${categoria.createdAt}'),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  
}

class FetchDataScreen extends StatelessWidget {
  const FetchDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: FutureBuilder<List<CategoriaInventario>>(
        future: fetchCategoriasInventario(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            final categorias = snapshot.data!;
            return ListView.builder(
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return ListTile(
                  title: Text(categoria.nombre),
                  subtitle: Text(categoria.descripcion ?? 'No description'),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
