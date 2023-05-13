import 'package:flt_movies/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class MovieThumb extends StatelessWidget {
  final String thumb, title;
  final int id;
  final bool large;

  const MovieThumb(
      {super.key,
      required this.thumb,
      required this.id,
      required this.title,
      required this.large});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetailScreen(id: id, title: title, thumb: thumb),
          ),
        );
      },
      child: SizedBox(
        width: large ? 300 : 150,
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
                width: large ? 300 : 150,
                height: large ? 200 : 150,
                fit: BoxFit.cover,
              ),
            ),
            !large
                ? Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        softWrap: true,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
