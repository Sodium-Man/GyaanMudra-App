// class Video {
//   final String name;
//   final String path;

//   Video({required this.name, required this.path});
// }


class Video {
  final String name;
  final String path;

  Video({required this.name, required this.path});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      name: json['name'],
      path: json['path'],
    );
  }
}