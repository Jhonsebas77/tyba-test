import 'package:flutter/material.dart';
import 'package:tyba_test/src/models/places_model.dart';
import 'package:tyba_test/src/pages/home/search/search_delegate.dart';
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
                Container(
                  width: 250,
                  child: ListTile(
                    title: Text(
                      'Busquedas recientes',
                    ),
                    leading: Icon(
                      Icons.access_time,
                      color: Colors.deepPurple,
                    ),
                    dense: true,
                  ),
                ),
                SizedBox(
                  height: 90,
                  width: 350,
                  child: _buildRecentSearch(),
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

  Row _buildSearchButton(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          child: IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () => showSearch(
              context: context,
              delegate: DataSearch(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Buscar Restaurantes',
          ),
        )
      ],
    );
  }

  Widget _buildRecentSearch() {
    return StreamBuilder(
      stream: placesProvider.placeStream,
      builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
        if (snapshot.hasData) {
          final _places = snapshot.data;
          return _places.isEmpty
              ? EmptyStateRecentSearch()
              : RecentSearchList(
                  places: _places,
                  nextPage: placesProvider.getRecentPlaces,
                );
        } else {
          return showLoading();
        }
      },
    );
  }
}
