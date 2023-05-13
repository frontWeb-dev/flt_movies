import 'package:flt_movies/models/movie_detail_model.dart';
import 'package:flt_movies/services/api_service.dart';
import 'package:flt_movies/widgets/widget_movie_star.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String title, thumb;

  const DetailScreen(
      {super.key, required this.id, required this.title, required this.thumb});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModeal> detail;

  @override
  void initState() {
    super.initState();
    detail = ApiService.getDetailInfo(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                image: NetworkImage(
                    "https://image.tmdb.org/t/p/w500${widget.thumb}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(),
            color: Colors.black.withOpacity(0.5),
          ),
          FutureBuilder(
            future: detail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new,
                                color: Colors.white),
                          ),
                          const Text(
                            "Back to list",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10),
                          DrawStar(vote: snapshot.data!.vote),
                          const SizedBox(height: 10),
                          Wrap(
                            children: [
                              Text(
                                "${snapshot.data!.runtime.makeTime()} /",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              for (var genre in snapshot.data!.genres)
                                Text(
                                  "${genre["name"]},",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "StoryLine",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.amber[500],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Buy Tickets",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

extension MyExtension on int {
  String makeTime() {
    final int hour = this ~/ 60;
    final int minutes = this % 60;
    return '${hour.toString().padLeft(1)}h ${minutes.toString().padLeft(2, "0")}min';
  }
}
