class Berita {
  final int id;
  final String title;
  final String image;

  Berita({required this.id, required this.title, required this.image});

  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }
}
