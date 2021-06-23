import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tyba_test/src/models/places_model.dart';
import 'package:tyba_test/src/providers/places_endpoint.dart';

class PlacesProvider {
  String _apiKey = 'AIzaSyA9TnsNNqSjszAGulESj9zy4_-exjcowGo';

  final _placeStreamController = StreamController<List<Place>>.broadcast();

  void disposeStreams() {
    _placeStreamController.close();
  }

  Function(List<Place>) get placeSink => _placeStreamController.sink.add;

  Stream<List<Place>> get placeStream => _placeStreamController.stream;

  Future<List<Place>> _makeRequest(Uri url, String decodeValue) async {
    final response = await http.get(url);
    final decodeResponse = json.decode(response.body);
    final places = Places.fromJsonList(decodeResponse[decodeValue]);
    return places.items;
  }

  Future<List<Place>> getPlaceRequest(String query) async {
    final url = Uri.https(
      PlacesEndpoint.baseEndpointGoogleMaps,
      PlacesEndpoint.getSearch,
      {
        'key': _apiKey,
        'query': PlacesEndpoint.getQueryRestaurant(query),
        'radius': '10000',
      },
    );
    return _makeRequest(url, 'results');
  }

  Future<List<Place>> getNearPlaces(double latitude, double longitude) async {
    final url = Uri.https(
      PlacesEndpoint.baseEndpointGoogleMaps,
      PlacesEndpoint.getNearEndpoint,
      {
        'key': _apiKey,
        'location': '$latitude,$longitude',
        'rankby': 'distance',
        'type': 'restaurant',
      },
    );
    return _makeRequest(url, 'results');
  }

  Future<void> savePlace(Place place) async {
    final url = Uri.https(
      PlacesEndpoint.baseEndpointFirebase,
      PlacesEndpoint.getPlaces,
    );
    await http.post(
      url,
      body: placeModelToJson(place),
    );
  }

  Future<List<Place>> getRecentPlaces() async {
    final url = Uri.https(
      PlacesEndpoint.baseEndpointFirebase,
      PlacesEndpoint.getPlaces,
    );
    final response = await http.get(url);
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    final List<Place> _places = new List();
    if (decodeResponse == null) {
      placeSink([]);
      return [];
    }
    decodeResponse.forEach((id, _product) {
      final _tempProduct = Place.fromJson(_product);
      _places.add(_tempProduct);
    });
    placeSink(_places);
    return _places;
  }
}
