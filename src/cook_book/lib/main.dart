import 'package:flutter/material.dart';

//Animation exercises (done)
import 'transition.dart';
import 'logo.dart';
import 'container.dart';
import 'fade_widget.dart';

// Design exercises (done)
import 'drawer_exercise.dart';
import 'show_snackbar.dart';
import 'export_fonts.dart';
import 'orientation.dart';
import 'custom_font.dart';
import 'text_background.dart';
import 'tabs.dart';

//Effects exercises (pending)
import 'download_button.dart';
import 'nested.dart';
import 'scrolling.dart';
import 'shimmer.dart';
import 'staggered.dart';
import 'typing_indicator.dart';
import 'fab.dart';
import 'bubbles.dart';
import 'ui.dart';

// Images exercises (done)
import 'display_image.dart';
import 'fade_image.dart';

// Forms exercises (done)
import 'validation_form.dart';
import 'text_field.dart';
import 'focus.dart';
import 'handle.dart';
import 'retrieve.dart';

// Lists exercises (done)
import 'gridlist.dart';
import 'horizontal.dart';
import 'mixed_list.dart';
import 'floating_bar.dart';
import 'use_list.dart';
import 'long_list.dart';
import 'spaced_list.dart';

// Navigation exercises (done)
import 'animate_widget.dart';
import 'navigate.dart';
import 'named_routes.dart';
import 'arguments.dart';
import 'data_screen.dart';
import 'sent_screen.dart';

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
      // Register named routes
      routes: {
        '/namedRoutes': (context) => const NamedRoutesDemo(),
      },
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Animation',
      'Design',
      'Effects',
      'Images',
      'Lists',
      'Forms',
      'Navigation',
    ];

    final exercises = {
      'Animation': [
        'Animate a page route transition',
        'Animate a widget using a physics simulation',
        'Animate the properties of a container',
        'Fade a widget in and out',
      ],
      'Design': [
        'Add a drawer to a screen',
        'Display a snackbar',
        'Export fonts from a package',
        'Update the UI based on orientation',
        'Use a custom font',
        'Use themes to share colors and font styles',
        'Work with tabs',
      ],
      'Effects':[
        'Create a download button',
        'Create a nested navigation flow',
        'Create a scrolling parallax effect',
        'Create a shimmer loading effect',
        'Create a staggered menu animation',
        'Create a typing indicator',
        'Create an expandable FAB',
        'Create gradient chat bubbles',
        'Drag a UI element',
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
                        if (category == 'Navigation' &&
                            exercise == 'Navigate with named routes') {
                          // Navigate to named routes demo
                          Navigator.pushNamed(context, '/namedRoutes');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseScreen(
                                title: exercise,
                                content: getExerciseWidget(category, exercise),
                              ),
                            ),
                          );
                        }
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
    case 'Animation-Animate a page route transition':
      return const Page1();
    case 'Animation-Animate a widget using a physics simulation':
      return const PhysicsCardDragDemo();
    case 'Animation-Animate the properties of a container':
      return const AnimatedContainerApp();
    case 'Animation-Fade a widget in and out':
      return const FadeWi();
    case 'Design-Add a drawer to a screen':
      return const DrawerExercise();
    case 'Design-Display a snackbar':
      return const ShowASnackbar();
    case 'Design-Export fonts from a package':
      return const ExportFonts();
    case 'Design-Update the UI based on orientation':
      return const Orient();
    case 'Design-Use a custom font':
      return const CustomFont();
    case 'Design-Use themes to share colors and font styles':
      return const TextBack();
    case 'Design-Work with tabs':
      return const TabBarDemo();
    case 'Effects-Create a download button':
      return const ExampleCupertinoDownloadButton();
    case 'Effects-Create a nested navigation flow':
      return SetupFlow(setupPageRoute: routeDeviceSetupStartPage);
    case 'Effects-Create a scrolling parallax effect':
      return Scrolling();
    case 'Effects-Create a shimmer loading effect':
      return ExampleUiLoadingAnimation();
    case 'Effects-Create a staggered menu animation':
      return ExampleStaggeredAnimations();
    case 'Effects-Create a typing indicator':
      return ExampleIsTyping();
    case 'Effects-Create an expandable FAB':
      return ExampleExpandableFab();
    case 'Effects-Create gradient chat bubbles':
      return ExampleGradientBubbles();
    case 'Effects-Drag a UI element':
      return ExampleDragAndDrop();
    case 'Images-Display images from the internet':
      return const ImageFromInternet();
    case 'Images-Fade in images with a placeholder':
      return const FadeImage();
    case 'Forms-Build a form with validation':
      return const MyCustomForm();
    case 'Forms-Create and style a text field':
      return const TextF();
    case 'Forms-Focus and text fields':
      return const FocusDemo();
    case 'Forms-Handle changes to a text field':
      return const HandleC();
    case 'Forms-Retrieve the value of a text field':
      return const Retrieve();
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
    case 'Navigation-Animate a widget across screens':
      return const HeroApp();
    case 'Navigation-Navigate to a new screen and back':
      return const FirstRoute();
    case 'Navigation-Pass arguments to a named route':
     return const ArgumentsNav();
    case 'Navigation-Return data from a screen':
      return const HomeScreen2();
    case 'Navigation-Send data to a new screen':
      return TodosScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      );
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

class NamedRoutesDemo extends StatelessWidget {
  const NamedRoutesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}
