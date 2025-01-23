import 'package:flutter/material.dart';

//Design exercises (pending)
import 'drawer_exercise.dart';
import 'show_snackbar.dart';

//Images exercises (done)
import 'display_image.dart';
import 'fade_image.dart';

//forms exercises (pending)
import 'validation_form.dart';

//Lists exercises (done)
import 'gridlist.dart';
import 'horizontal.dart';
import 'mixed_list.dart';
import 'floating_bar.dart';
import 'use_list.dart';
import 'long_list.dart';
import 'spaced_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Design',
      'Images',
      'Lists',
      'Forms',
      'Navigation',
    ];

    final exercises = {
      'Design': [
        'Add a drawer to a screen',
        'Display a snackbar',
        'Export fonts from a package',
        'Update the UI based on orientation',
        'Use a custom font',
        'Use themes to share colors and font styles',
        'Work with tabs',
      ],
      'Images': [
        'Display images from the internet',
        'Fade in images with a placeholder',
      ],
      'Lists': [
        'Create a grid list',
        'Create a horizontal list',
        'Create lists with different types of items',
        'Place a floating app bar above a list',
        'Use lists',
        'Work with long lists',
        'Create a list with spaced items',
      ],
      'Forms': [
        'Build a form with validation',
        'Create and style a text field',
        'Focus and text fields',
        'Handle changes to a text field',
        'Retrieve the value of a text field',
      ],
      'Navigation': [
        'Animate a widget across screens',
        'Navigate to a new screen and back',
        'Navigate with named routes',
        'Pass arguments to a named route',
        'Set up app links for Android',
        'Set up universal links for iOS',
        'Return data from a screen',
        'Send data to a new screen',
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final exercisesInCategory = exercises[category];

          return exercisesInCategory != null
              ? ExpansionTile(
                  title: Text(category),
                  children: exercisesInCategory.map((exercise) {
                    return ListTile(
                      title: Text(exercise),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseScreen(
                              title: exercise,
                              content: getExerciseWidget(category, exercise),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                )
              : const SizedBox(); // Handle null categories gracefully
        },
      ),
    );
  }
}

// Function to return widgets for each exercise
Widget getExerciseWidget(String category, String exercise) {
  final key = '$category-$exercise'; // Combine category and exercise as a unique key

  switch (key) {
    case 'Design-Add a drawer to a screen':
      return const DrawerExercise();
    case 'Design-Display a snackbar':
      return const ShowASnackbar();
    case 'Images-Display images from the internet':
      return const ImageFromInternet();
    case 'Images-Fade in images with a placeholder':
      return const FadeImage();
    case 'Forms-Build a form with validation':
      return const MyCustomForm();
    case 'Lists-Create a grid list':
      return const GridList();
    case 'Lists-Create a horizontal list':
      return const HoriList();
    case 'Lists-Create lists with different types of items':
      return MixedList(
        items: List<ListItem>.generate(
          10, // Adjust the number as needed
          (i) => i % 2 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i'),
        ),
      );
    case 'Lists-Place a floating app bar above a list':
      return const Floating();
    case 'Lists-Use lists':
      return const UseList();
    case 'Lists-Work with long lists':
      return LongList(
        items: List<String>.generate(
          10000, // Number of items
          (i) => 'Item $i', // Content of each item
        ),
      );
    case 'Lists-Create a list with spaced items':
      return const SpacedItemsList();
    default:
      return Center(
        child: Text(
          'Content for $exercise is not yet implemented.',
          style: const TextStyle(fontSize: 18),
        ),
      );
  }
}

class ExerciseScreen extends StatelessWidget {
  final String title;
  final Widget content;

  const ExerciseScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
