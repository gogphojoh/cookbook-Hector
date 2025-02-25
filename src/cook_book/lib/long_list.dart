import 'package:flutter/material.dart';

void main() {
  runApp(
    LongList(
      items: List<String>.generate(10000, (i) => 'Item $i'),
    ),
  );
}

class LongList extends StatelessWidget {
  final List<String> items;

  const LongList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          prototypeItem: ListTile(
            title: Text(items.first),
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}