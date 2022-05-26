class City {
  int id;
  String name;
  String imageUrl;
  bool ispopuler;

  City({
    required this.id,
    required this.imageUrl,
    required this.name,
    this.ispopuler = false,
  });
}
