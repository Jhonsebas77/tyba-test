import 'package:flutter/material.dart';
import 'package:tyba_test/src/models/places_model.dart';
import 'package:tyba_test/src/pages/home/search/widgets/search_list_empty.dart';
import 'package:tyba_test/src/pages/home/search/widgets/search_list_item.dart';
import 'package:tyba_test/src/providers/places_provider.dart';
import 'package:tyba_test/src/utils/utils.dart';

class DataSearch extends SearchDelegate {
  final placeProvider = new PlacesProvider();

  String sellection;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        color: Colors.deepPurple,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(
          context,
          null,
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SearchListItemEmpty(
        query: query.toString(),
      );
    }
    return FutureBuilder(
      future: placeProvider.getPlaceRequest(query),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Place>> snapshot,
      ) {
        if (snapshot.hasData) {
          final places = snapshot.data;
          return places.isEmpty
              ? SearchListItemEmpty(
                  query: query.toString(),
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
                          onTap: () {},
                        );
                      },
                    ).toList(),
                  ),
                );
        } else {
          return showLoading();
        }
      },
    );
  }
}
