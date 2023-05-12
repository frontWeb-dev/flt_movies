import 'package:flutter/material.dart';

class MovieLarge extends StatelessWidget {
  final String thumb;
  final int id;
  const MovieLarge({super.key, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ]),
            child: Image(
              image: NetworkImage("https://image.tmdb.org/t/p/w500$thumb"),
              width: 300,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
