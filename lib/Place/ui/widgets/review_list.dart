import 'package:flutter/material.dart';
import 'package:app_calimax_convencion/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/calimax.jpg", "Noticias Calimax 1", " ", "calimax, empresa binacional del año"'\n'"Baja California"),
        Review("assets/img/calimax2.jpg", "Noticia Calimax 2", " ", "Por cada 300 pesos al cliente se le "'\n'"entrega un boleto "'\n'"para participar. El carrito "'\n'"loco es la promoción más esperada "'\n'"por muchos bajacalifornianos, donde"'\n'" en dos minutos puedes llevarte productos"),
        Review("assets/img/calimax81.jpg", "Noticia Calimax 3", " ", "Inaugura Calimax tienda Aprecio Natura"'\n'""),
        Review("assets/img/calimax33.jpg", "Noticias Calimax 4", " ", "Descuentos y promociones especiales"'\n'""),

      ],
    );
  }

}