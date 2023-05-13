class MovieDetailModeal {
  final String poster, overview;
  final int id, runtime;
  final double vote;
  final List<dynamic> genres;

  MovieDetailModeal.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        vote = json["vote_average"],
        runtime = json["runtime"],
        overview = json["overview"],
        poster = json["poster_path"],
        genres = json["genres"];
}
