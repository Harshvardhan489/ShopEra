import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:startup_try_2/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  var width;
  var height;
  final List<String> items = <String>["Product","Product","Product","Product","Product","Product"];

  void initialize(){
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  void launchURL(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not get location";
    }
  }

  void launchCall(int number) async {
    var url = "tel: ${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw "Could not place a call";
    }
  }

  // ListTile _tile(String title, String subtitle,String src,) => ListTile(
  //   title: Text(title,
  //       style: TextStyle(
  //         fontWeight: FontWeight.w500,
  //         fontSize: 20,
  //       )),
  //   subtitle: Text(subtitle),
  //   leading: CircleAvatar(
  //     child: Image.network(src),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Name"),
      ),
      body: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: height * 0.3),
                    padding: EdgeInsets.only(
                      top: height/15,
                    ),
                    width: width,
                    height: height*100,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Text("Modi Kitchenware",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: width/12,
                            ),
                          ),
                          SizedBox(
                            height: height/30,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(10.0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        launchCall(9773423523);
                                      });
                                    },
                                    child: Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade300,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlatButton(
                                    onPressed: (){
                                      launchURL("https://www.google.co.in/maps/place/Mr.Bake+The+Live+Bakery/@20.7667317,72.976789,19.32z/data=!4m5!3m4!1s0x3be0ee68ce3df6ab:0x3ae0f999eb5ab6da!8m2!3d20.7667473!4d72.9761139");
                                    },
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: width,
                            child: Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. ",style: TextStyle(
                              color: Colors.white,
                              fontSize: width/17,
                            ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: width,
                              height: 20,
                              color: Colors.blue.shade200,
                              child: Center(child: Text('${items[index]}_$index')),
                            );
                          }
                      ),
                        ],
                      ),
                    ),
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