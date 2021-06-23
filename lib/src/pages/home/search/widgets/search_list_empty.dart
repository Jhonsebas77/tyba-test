import 'package:flutter/material.dart';

class SearchListItemEmpty extends StatelessWidget {
  final String query;
  const SearchListItemEmpty({
    this.query = '',
    Key key,
  }) : super(key: key);
  isEmpty(String query) => query.isEmpty;

  IconData getIcon(String query) =>
      isEmpty(query) ? Icons.search : Icons.not_listed_location;

  @override
  Widget build(BuildContext context) {
    String _title = isEmpty(query)
        ? 'Encuentra los mejores restaurantes de la ciudad! '
        : 'Lo sentimos, no hay resultados.';
    String _subTitle = isEmpty(query)
        ? 'Escribe para comenzar la busqueda! '
        : 'Por favor intenta otra palabra.';
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
          leading: Icon(
            getIcon(query),
            color: Colors.deepPurple,
          ),
          title: Text(
            _title,
          ),
          subtitle: Text(
            _subTitle,
          ),
        ),
      ),
    );
  }
}
