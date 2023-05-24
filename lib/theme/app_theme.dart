import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 0, 217, 255);

const List<Color> _colorThemes = [
  _customColor,
  Colors.cyan,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0,
  }) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Solo hay ${_colorThemes.length} temas disponibles');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
