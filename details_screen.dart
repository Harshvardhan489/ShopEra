import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/constants.dart';
import 'package:startup_try_2/models/Product.dart';
import '../details/components/rateproduct.dart';
import 'package:startup_try_2/cart.dart';
import 'package:startup_try_2/proceed_to_buy.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(this.product);
}

class _DetailsScreenState extends State<DetailsScreen> {
  Product product;
  _DetailsScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        elevation: 0,
        leading: FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Container(
            width: 60,
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height:
          //     size.width > size.height ? size.width * 1.03 : size.height * 1.19,
          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  // height: size.height * 2,
                  padding: EdgeInsets.only(
                    top: size.width > size.height
                        ? size.width / 3.5
                        : size.height * 0.12,
                    //left: kDefaultPaddin,
                    //right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: "Price\n"),
                                TextSpan(
                                  text: "Rs. ${product.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: kDefaultPaddin / 10),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          Text(
                            '${product.rating}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 16.0,
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(size.width / 20),
                        child: Text(
                          product.description,
                          style: TextStyle(
                            // fontSize: 16.0,
                            height: 1.5,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: kDefaultPaddin / 10),
                      SizedBox(height: kDefaultPaddin / 10),
                      RateProduct(product: product),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // BuyNow(product: product),
                          // Cart(product: product),
                          Container(
                            margin: EdgeInsets.only(left: 0),
                            color: Colors.deepOrange,
                            width: MediaQuery.of(context).size.width / 2,
                            // height: 10,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProceedToBuy(),
                                  ),
                                );
                              },
                              child: Text('Buy Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width / 2,
                            child: FlatButton(
                                onPressed: () {
                                  setState(() {
                                    product.incart = true;
                                  });
                                },
                                child: product.incart == false
                                    ? Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 20.0,
                                        ),
                                      )
                                    : FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Cart()));
                                        },
                                        child: Text(
                                          'View Cart',
                                          style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      )),
                          )
                          // Cart(product: product),
                        ],
                      )
                    ],
                  )),
              // ProductTitleWithImage(product: product)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Product Type",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: kDefaultPaddin),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: size.width > size.height
                              ? size.height / 2
                              : size.width / 2,
                          // height: size.width > size.height
                          //     ? size.width / 3
                          //     : size.height / 3,
                          child: Hero(
                            tag: "${product.id}",
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
