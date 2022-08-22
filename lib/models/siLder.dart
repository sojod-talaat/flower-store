class Silderitem {
  late String imagesliderUrl;
  late String title;
  String? sliderid;
  Silderitem(
      {this.sliderid, required this.imagesliderUrl, required this.title});

  Silderitem.fromMap(Map<String, dynamic> map) {
    sliderid = map['sliderid'];
    imagesliderUrl = map['imagesliderUrl'];
    title = map['title'];
  }
  toMap() {
    return {'imagesliderUrl': imagesliderUrl, 'title': title};
  }
}
