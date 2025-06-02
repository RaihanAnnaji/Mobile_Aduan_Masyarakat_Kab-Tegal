class Menu {
  final int id;
  final String title;

  Menu({required this.id, required this.title});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      title: json['title'],
    );
  }
}
