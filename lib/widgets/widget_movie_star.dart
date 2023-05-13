import 'package:flutter/material.dart';

class DrawStar extends StatelessWidget {
  final double vote;
  const DrawStar({super.key, required this.vote});

  @override
  Widget build(BuildContext context) {
    var score = vote.round() / 2;
    var stringScore = score.toString().substring(1);
    var empty = 5 - score.round();

    return Row(
      children: [
        for (int j = 1; j < score; j++)
          Icon(
            Icons.star,
            color: Colors.amber[500],
            size: 30,
          ),
        if (stringScore != "")
          Icon(Icons.star_half, color: Colors.amber[500], size: 30),
        for (int j = 0; j < empty; j++)
          Icon(
            Icons.star_outline,
            color: Colors.amber[500],
            size: 30,
          ),
      ],
    );
  }
}
