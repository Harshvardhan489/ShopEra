import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';

import '../../../constants.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Reviews',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            product.review,
            style: TextStyle(
              color: Colors.white,
              height: 1.5,
              // fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
