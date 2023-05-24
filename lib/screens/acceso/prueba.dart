import 'package:flutter/material.dart';
import 'package:animated_gradient/animated_gradient.dart';

class PruebaGrad extends StatefulWidget {
  const PruebaGrad({super.key});

  @override
  State<PruebaGrad> createState() => _PruebaGradState();
}

class _PruebaGradState extends State<PruebaGrad> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AnimatedGradient(
        colors: [
          Color(0xFF69C5DB),
          Color(0xFFB1D877),
          Color(0xFF69C5DB),
        ],
        child: Center(
          child: Text(
            'Hola Mundo',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
