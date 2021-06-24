import 'package:flutter/material.dart';
import 'package:tyba_test/src/pages/common/widgets/custom_button.dart';

class NearPlacesEmpty extends StatelessWidget {
  final Function onPress;
  const NearPlacesEmpty({this.onPress, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_off,
                color: Colors.deepPurple,
              ),
              Text(
                'Podemos mostrarte los restaurantes cerca tuyo, por favor habilita la ubicacion del dispositivo',
                textAlign: TextAlign.center,
              ),
              CustomFlatButton(
                buttonAction: onPress,
                title: 'Habilitar Localizacion',
                backgroundColor: Colors.deepPurple[900],
                titleColor: Colors.white,
                borderColor: Colors.transparent,
                height: 40,
                borderRadius: 5,
                borderWidth: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
