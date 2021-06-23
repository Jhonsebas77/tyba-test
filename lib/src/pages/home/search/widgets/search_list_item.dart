import 'package:flutter/material.dart';
import 'package:tyba_test/src/models/places_model.dart';

class SearchListItem extends StatelessWidget {
  final Function onTap;
  final Place place;
  const SearchListItem({
    this.onTap,
    this.place,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: ListTile(
          dense: true,
          leading: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2,
            ),
            child: FadeInImage(
              image: NetworkImage(
                place.icon,
              ),
              placeholder: AssetImage(
                'assets/img/no-image.jpg',
              ),
            ),
          ),
          title: Text(
            place.name ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            place.formattedAddress ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: onTap,
          trailing: Container(
            width: 50,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  place.rating.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
