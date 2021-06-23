import 'dart:convert';

Place placeModelFromJson(String str) => Place.fromJson(json.decode(str));

String placeModelToJson(Place data) => json.encode(data.toJson());

class Places {
  List<Place> items = new List();
  Places();

  Places.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final place = new Place.fromJson(item);
      items.add(place);
    }
  }
}

class Place {
  String formattedAddress;
  String vicinity;
  Geometry geometry;
  String icon;
  String name;
  String placeId;
  double rating;

  Place({
    this.formattedAddress,
    this.vicinity,
    this.geometry,
    this.icon,
    this.name,
    this.placeId,
    this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        formattedAddress: json["formatted_address"] == null
            ? json["vicinity"]
            : json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        icon: json["icon"],
        name: json["name"],
        placeId: json["place_id"],
        rating: json["rating"] == null ? 0 : json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "icon": icon,
        "name": name,
        "place_id": placeId,
        "rating": rating,
      };
}

class Geometry {
  Geometry({
    this.location,
  });

  Location location;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
      };
}

class Location {
  Location({
    this.lat,
    this.lng,
  });

  double lat;
  double lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
