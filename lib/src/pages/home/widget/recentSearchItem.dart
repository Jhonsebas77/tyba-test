import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  final String title;
  final String rate;

  const RecentSearchItem({
    this.title,
    this.rate,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              rate,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ],
        ),
        trailing: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 2,
          ),
          child: CircleAvatar(
            child: Icon(
              Icons.local_dining,
              color: Colors.white,
            ),
            backgroundColor: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
