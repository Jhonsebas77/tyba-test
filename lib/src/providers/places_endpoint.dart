class PlacesEndpoint {
  static String baseEndpointGoogleMaps = 'maps.googleapis.com';
  static String getSearch = 'maps/api/place/textsearch/json';
  static String getNearEndpoint = 'maps/api/place/nearbysearch/json';
  static String getQueryRestaurant(String query) => query + '+' + 'restaurante';
  static String getNearLocationEndpoint({
    String latitude,
    String longitude,
  }) =>
      '$latitude,$longitude';
  static String baseEndpointFirebase =
      'flutter-tools-jsob-default-rtdb.firebaseio.com';
  static String getPlaces = '/places.json';
}
