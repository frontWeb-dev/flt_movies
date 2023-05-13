import 'package:flt_movies/models/movie_thumb_model.dart';
import 'package:flt_movies/services/api_service.dart';
import 'package:flt_movies/widgets/widget_movie_thumb.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<MovieThumbModel>> popularMovies =
      ApiService().getPopularMovies();
  final Future<List<MovieThumbModel>> nowPlayingMovies =
      ApiService().getNowPlayingMovies();
  final Future<List<MovieThumbModel>> comingSoonMovies =
      ApiService().getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 50),
          child: Column(
            children: [
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 120),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Popular Movies",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 230,
                              child: popularMovie(snapshot),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Now In Cinemas",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 250,
                              child: nowPlayingMovie(snapshot),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Coming soon",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 250,
                              child: nowPlayingMovie(snapshot),
                            ),
                          ],
                        ),
                      ],
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
        ),
      ),
    );
  }

  ListView popularMovie(AsyncSnapshot<List<MovieThumbModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final movie = snapshot.data![index];
        return MovieThumb(
            thumb: movie.image, id: movie.id, title: movie.title, large: true);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }

  ListView nowPlayingMovie(AsyncSnapshot<List<MovieThumbModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final movie = snapshot.data![index];
        return MovieThumb(
            title: movie.title, thumb: movie.image, id: movie.id, large: false);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20),
    );
  }
}
