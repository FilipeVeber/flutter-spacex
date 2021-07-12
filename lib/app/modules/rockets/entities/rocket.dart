class Rocket {
  final String id;
  final String name;
  final String description;
  final String company;
  final String country;
  final bool isActive;
  final List<String> images;

  Rocket(this.id, this.name, this.description, this.company, this.country,
      this.isActive, this.images);

  factory Rocket.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    return Rocket(
      map['id'],
      map['name'],
      map['description'],
      map['company'],
      map['country'],
      map['isActive'] == null ? false : map['isActive'],
      map['images'] == null ? List.empty() : map['images'],
    );
  }
}
