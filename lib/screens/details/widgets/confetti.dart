import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class Confettis extends StatelessWidget {
  const Confettis({super.key,required this.controller});
final ConfettiController controller;
  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      blastDirectionality: BlastDirectionality.explosive,
      confettiController: controller,
      particleDrag: 0.08,
      emissionFrequency: 0.05,
      numberOfParticles: 45,
      gravity: 0.08,
      shouldLoop: false,
      colors: const[
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue,
      ],
    );
  }
}
