import 'dart:math';

class ImageManipulator {
  List<Element> _texts = [];
  List<Element> get texts => _texts;

  List<Element> _emojis = [];
  List<Element> get emojis => _emojis;

  ImageManipulator addText(String text) {
    Element element = _createElement(text);
    _texts.add(element);
    return this;
  }

  ImageManipulator addEmoji(String emoji) {
    Element element = _createElement(emoji);
    _emojis.add(element);
    return this;
  }

  Element _createElement(String text) {
    ElementPosition elementPosition = _getRandomPosition();
    Element element = Element(text, elementPosition);
    return element;
  }

  ElementPosition _getRandomPosition() {
    double x = Random().nextInt(300) * 1.0;
    double y = Random().nextInt(300) * 1.0;
    return ElementPosition(x, y);
  }

  ImageManipulator clearAll() {
    _texts = [];
    _emojis = [];
    return this;
  }
}

// As we're not allowing user to edit the text or choose emoji
// Better to make the properties immutable

class Element {
  final String text;
  final ElementPosition elementPosition;

  Element(this.text, this.elementPosition);
}

class ElementPosition {
  final double x;
  final double y;

  ElementPosition(this.x, this.y);
}
