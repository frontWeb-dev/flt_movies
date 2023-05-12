class MovieThumbModel {
  final String title, image;
  final int id;

  MovieThumbModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        image = json["poster_path"];
}
