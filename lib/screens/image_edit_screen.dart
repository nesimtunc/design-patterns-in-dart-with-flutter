import 'dart:math';

import 'package:design_patterns_in_dart_with_flutter/creational/builder/image_manipulator.dart';
import 'package:flutter/material.dart';

class ImageEditScreen extends StatefulWidget {
  const ImageEditScreen({Key? key}) : super(key: key);

  @override
  State<ImageEditScreen> createState() => _ImageEditScreenState();
}

class _ImageEditScreenState extends State<ImageEditScreen> {
  ImageManipulator imageManipulator = ImageManipulator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Image'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 500,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(
                            'assets/images/annie-spratt-xTaOPMa6wAE-unsplash.jpg'),
                      ),
                    ),
                  ),
                  for (var element in imageManipulator.texts)
                    Positioned(
                      top: element.elementPosition.x,
                      left: element.elementPosition.y,
                      child: Text(
                        element.text,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  for (var element in imageManipulator.emojis)
                    Positioned(
                      top: element.elementPosition.x,
                      left: element.elementPosition.y,
                      child: Text(
                        element.text,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      imageManipulator.addText('Hello World');
                      setState(() {});
                    },
                    child: const Text('Add Text'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String emoji = _randomEmoji();
                      imageManipulator.addEmoji(emoji);
                      setState(() {});
                    },
                    child: const Text('Add Emoji'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Demonstration of Builder pattern
                      imageManipulator = ImageManipulator()
                          .addText('1')
                          .addEmoji('😎')
                          .addText('2')
                          .addEmoji('😂')
                          .addText('3')
                          .addEmoji('👍');

                      setState(() {});
                    },
                    child: const Text('Text & Emoji'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      imageManipulator.clearAll();
                      setState(() {});
                    },
                    child: const Text('Clear All'),
                  )
                ],
              )
            ],
          ),
        ));
  }

  String _randomEmoji() {
    final emojis = ['😂', '😎', '👍'];
    final randomIndex = Random().nextInt(emojis.length);
    return emojis[randomIndex];
  }
}
