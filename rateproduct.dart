import 'package:flutter/material.dart';
import 'package:startup_try_2/models/Product.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../constants.dart';

bool rated = false;

class RateProduct extends StatefulWidget {
  const RateProduct({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _RateProductState createState() => _RateProductState(this.product);
}

class _RateProductState extends State<RateProduct> {
  Product product;
  _RateProductState(this.product);

  void to_submit(bool rated) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Container(
        child: Column(
          children: <Widget>[
            product.done == false
                ? Column(
                    children: <Widget>[
                      Text(
                        'Rate the product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SmoothStarRating(
                        isReadOnly: false,
                        size: 30.0,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        color: Colors.yellowAccent,
                        borderColor: Colors.yellowAccent,
                        onRated: (double rating) {
                          rated = true;
                          product.star = rating;
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            product.star == null || product.star == 0
                                ? product.done = false
                                : product.done = true;
                          });
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Your Rating",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        SmoothStarRating(
                          isReadOnly: true,
                          size: 30.0,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star_half,
                          defaultIconData: Icons.star_border,
                          starCount: 5,
                          allowHalfRating: true,
                          rating: product.star,
                          spacing: 2.0,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                          onRated: (double rating) {
                            rated = true;
                            product.star = rating;
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
