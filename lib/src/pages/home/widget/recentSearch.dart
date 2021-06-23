import 'package:flutter/material.dart';
import 'package:tyba_test/src/models/places_model.dart';
import 'package:tyba_test/src/pages/home/widget/recentSearchItem.dart';

class RecentSearchList extends StatelessWidget {
  final List<Place> places;
  final Function nextPage;
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.7,
  );

  RecentSearchList({
    @required this.places,
    @required this.nextPage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(
      () {
        if (_pageController.position.pixels >=
            _pageController.position.maxScrollExtent - 200) {
          nextPage();
        }
      },
    );

    return PageView.builder(
      pageSnapping: false,
      controller: _pageController,
      itemCount: places.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: RecentSearchItem(
            title: places[index].name,
            rate: places[index].rating.toString(),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              'detail',
              arguments: places[index],
            );
          },
        );
      },
    );
  }
}
