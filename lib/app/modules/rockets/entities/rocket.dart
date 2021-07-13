class Rocket {
  final String id;
  final String name;
  final String description;
  final String company;
  final String country;
  final bool isActive;
  final List<String> images;
  final String wikipedia;
  final int successRatePercentual;
  final int costPerLaunch;
  final String firstFlight;

  Rocket(
      this.id,
      this.name,
      this.description,
      this.company,
      this.country,
      this.isActive,
      this.images,
      this.wikipedia,
      this.successRatePercentual,
      this.costPerLaunch,
      this.firstFlight);

  factory Rocket.fromMap(Map<String, dynamic> map) {
    if (map == null) {
      return null;
    }

    print(map['name']);
    print(map['success_rate_pct']);

    return Rocket(
      map['id'],
      map['name'],
      map['description'],
      map['company'],
      map['country'],
      map['isActive'] == null ? false : map['isActive'],
      map['flickr_images'] == null
          ? List<String>.empty()
          : List.castFrom(map['flickr_images']),
      map['wikipedia'],
      map['success_rate_pct'],
      map['cost_per_launch'],
      map['first_flight'],
    );
  }
}
