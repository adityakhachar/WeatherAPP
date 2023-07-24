class Geocoding {
  String? cityName;
  double? lattitide;
  double? longtitude;
  String? state;
  String? country;

  Geocoding(
      {this.cityName,
      this.lattitide,
      this.longtitude,
      this.state,
      this.country});

  Geocoding.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    lattitide = json["lat"];
    longtitude = json["lon"];
    state = json["state"];
    country = json["country"];
  }
}
