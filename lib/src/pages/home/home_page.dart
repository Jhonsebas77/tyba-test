import 'package:flutter/material.dart';
import 'package:location/location.dart' as UserLocation;
import 'package:tyba_test/src/models/places_model.dart';
import 'package:tyba_test/src/pages/home/search/search_delegate.dart';
import 'package:tyba_test/src/pages/home/search/widgets/search_list_empty.dart';
import 'package:tyba_test/src/pages/home/search/widgets/search_list_item.dart';
import 'package:tyba_test/src/pages/home/widget/nearPlacesEmpty.dart';
import 'package:tyba_test/src/pages/home/widget/recentSearch.dart';
import 'package:tyba_test/src/pages/home/widget/recentSearch_empty.dart';
import 'package:tyba_test/src/pages/login/login_page.dart';
import 'package:tyba_test/src/providers/places_provider.dart';
import 'package:tyba_test/src/providers/user_provider.dart';
import 'package:tyba_test/src/utils/utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userProvider = new UserProvider();
  final placesProvider = new PlacesProvider();

  final location = new UserLocation.Location();
  UserLocation.PermissionStatus _permissionGranted;
  UserLocation.LocationData _locationData;

  bool _isServiceEnabled = false;
  bool _permissionStatusGranted = false;
  void initState() {
    super.initState();
    _validateStatus();
  }

  _validateStatus() async {
    _isServiceEnabled = await location.serviceEnabled();
    _permissionStatusGranted =
        _permissionGranted == UserLocation.PermissionStatus.granted;
    setState(() {
      _isServiceEnabled = _isServiceEnabled;
      _permissionStatusGranted = _permissionStatusGranted;
    });
  }

  getUserLocation() async {
    _locationData = await location.getLocation();
    setState(() {
      _locationData = _locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    placesProvider.getRecentPlaces();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: [
          _buildLogoutButton(context),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/img/logo_purple.webp',
                      ),
                      height: 90,
                      width: 90,
                      fit: BoxFit.contain,
                    ),
                    _buildSearchButton(context),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Busquedas recientes',
                  ),
                  leading: Icon(
                    Icons.access_time,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: _buildRecentSearch(),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    'Restaurantes Cercanos',
                  ),
                  leading: Icon(
                    Icons.local_dining,
                    color: Colors.deepPurple,
                  ),
                ),
                _buildNear(context),
                SizedBox(
                  height: 300,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  _buildLogoutButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout),
      onPressed: () => showAlertMessage(
        context: context,
        message: handlerAlertMessage('LOGOUT'),
        title: handlerAlertTitle('LOGOUT'),
        primaryAction: () => _logOut(context),
        primaryActionText: 'Cerrar Sesion',
      ),
    );
  }

  _logOut(BuildContext context) {
    userProvider.logOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ),
      (route) => false,
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return GestureDetector(
      onTap: () => showSearch(
        context: context,
        delegate: DataSearch(),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Buscar Restaurantes',
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecentSearch() {
    return StreamBuilder(
      stream: placesProvider.placeStream,
      builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
        if (snapshot.hasData) {
          final _places = snapshot.data;
          return _places.isEmpty
              ? SizedBox(
                  height: 80,
                  width: 350,
                  child: EmptyStateRecentSearch(),
                )
              : SizedBox(
                  height: 80,
                  width: 350,
                  child: RecentSearchList(
                    places: _places,
                    nextPage: placesProvider.getRecentPlaces,
                  ),
                );
        } else {
          return showLoading();
        }
      },
    );
  }

  _buildNear(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    bool isLocationOk = (_isServiceEnabled && _locationData != null);
    return isLocationOk
        ? SizedBox(
            height: _screenSize.height * 0.45,
            width: 350,
            child: FutureBuilder(
              future: placesProvider.getNearPlaces(
                _locationData.latitude,
                _locationData.longitude,
              ),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Place>> snapshot,
              ) {
                if (snapshot.hasData) {
                  final places = snapshot.data;
                  return places.isEmpty
                      ? SearchListItemEmpty(
                          query: '',
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: ListView(
                            children: places.map(
                              (_place) {
                                return SearchListItem(
                                  place: _place,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      'detail',
                                      arguments: _place,
                                    );
                                  },
                                );
                              },
                            ).toList(),
                          ),
                        );
                } else {
                  return showLoading();
                }
              },
            ),
          )
        : SizedBox(
            height: 200,
            width: 350,
            child: NearPlacesEmpty(
              onPress: () async {
                await getUserLocation();
                setState(() {});
              },
            ),
          );
  }
}
