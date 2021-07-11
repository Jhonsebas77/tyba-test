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
  List<Photo> photos;
  String icon;
  String name;
  String placeId;
  double rating;

  Place({
    this.formattedAddress,
    this.vicinity,
    this.geometry,
    this.photos,
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
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(
                json["photos"].map(
                  (x) => Photo.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "icon": icon,
        "name": name,
        "place_id": placeId,
        "rating": rating,
        "photos": photos == null
            ? null
            : List<dynamic>.from(
                photos.map(
                  (x) => x.toJson(),
                ),
              ),
      };

  getRestaurantImage() {
    if (photos.isEmpty)
      return 'https://i.pinimg.com/474x/f3/be/1b/f3be1b55efcf32cca0476638e6e6bcdb.jpg';
    else {
      final _apiKey = 'AIzaSyA9TnsNNqSjszAGulESj9zy4_-exjcowGo';
      final _photoReference = photos[0].photoReference;
      final _maxwidth = 400;
      return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=$_maxwidth&photoreference=$_photoReference&key=$_apiKey';
    }
  }
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

class Photo {
  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}
