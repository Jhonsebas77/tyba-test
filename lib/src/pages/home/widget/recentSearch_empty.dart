import 'package:flutter/material.dart';

class EmptyStateRecentSearch extends StatelessWidget {
  const EmptyStateRecentSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 80,
      ),
      width: 200,
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timer_off,
            ),
            Text(
              'Sin busquedas recientes',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
