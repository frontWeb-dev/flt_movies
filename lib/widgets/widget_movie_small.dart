import 'package:flutter/material.dart';

class MovieSmall extends StatelessWidget {
  final String thumb, title;
  final int id;

  const MovieSmall(
      {super.key, required this.thumb, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              softWrap: true,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
