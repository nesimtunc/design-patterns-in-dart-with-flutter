import 'package:design_patterns_in_dart_with_flutter/screens/image_edit_screen.dart';
import 'package:design_patterns_in_dart_with_flutter/screens/settings_screen.dart';
import 'package:design_patterns_in_dart_with_flutter/screens/travel_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Design Patterns in Dart with Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(
      fontSize: 20,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sampleScreen(context, 'Creational / Singleton', (_) {
              return const SettingsScreen();
            }),
            _sampleScreen(context, 'Creational / Builder', (_) {
              return const ImageEditScreen();
            }),
            _sampleScreen(context, 'Creational / Factory', (_) {
              return const TravelScreen();
            }),
          ],
        ),
      ),
    );
  }

  ElevatedButton _sampleScreen(
    BuildContext context,
    String buttonText,
    WidgetBuilder whereTo,
  ) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: whereTo),
        );
      },
      child: Text(buttonText),
    );
  }
}
