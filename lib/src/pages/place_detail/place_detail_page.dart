import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tyba_test/src/models/places_model.dart';

class PlaceDetailPage extends StatefulWidget {
  PlaceDetailPage({Key key}) : super(key: key);

  @override
  _PlaceDetailPageState createState() => _PlaceDetailPageState();
}

class _PlaceDetailPageState extends State<PlaceDetailPage> {
  GoogleMapController mapController;
  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    final Place place = ModalRoute.of(context).settings.arguments;
    _setMarker(place);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.name,
        ),
      ),
      body: _buildBody(place),
    );
  }

  void _setMarker(Place place) {
    setState(
      () {
        _markers.add(
          Marker(
            markerId: MarkerId(place.placeId),
            position: LatLng(
              place.geometry.location.lat,
              place.geometry.location.lng,
            ),
            infoWindow: InfoWindow(
              title: place.name,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(Place place) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onMapCreated: (controller) {
            mapController = controller;
          },
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              place.geometry.location.lat,
              place.geometry.location.lng,
            ),
            zoom: 15.0,
          ),
        ),
        Positioned(
          left: 40,
          right: 40,
          bottom: 100,
          child: _buildHotelInfoContainer(context, place),
        )
      ],
    );
  }

  Container _buildHotelInfoContainer(BuildContext context, Place place) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: Colors.black54,
        ),
        width: 300,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  place.icon,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    place.formattedAddress,
                    style: _buildPlaceAddressStyle(context),
                  ),
                ),
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        place.rating.toString(),
                        style: _buildSubtitleStyle(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  _buildSubtitleStyle(BuildContext context) {
    return TextStyle(
      color: Colors.white,
    );
  }

  _buildPlaceAddressStyle(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
}
