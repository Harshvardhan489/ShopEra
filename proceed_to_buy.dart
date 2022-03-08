import 'package:flutter/material.dart';
import 'payment.dart';

class ProceedToBuy extends StatefulWidget {
  @override
  _ProceedToBuyState createState() => _ProceedToBuyState();
}

class _ProceedToBuyState extends State<ProceedToBuy> {
  String name = "Customer Name";
  String getaddress, getname;
  int getphoneno;
  int price = 300, count = 0, getby = 0, detailsreceived = 0;
  int selectedRadioTile, selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var shops = ["Shop1", "Shop 2", "Shop 3", "Shop 4", "Shop 5", "Shop 6"];

    return Scaffold(
      backgroundColor: Colors.blue.shade500,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              // width: MediaQuery.of(context).size.width / 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(width: MediaQuery.of(context).size.width / 12),
                  Text(
                    "Name: ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(width: width / 12),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              color: Colors.blue.shade500,
              height: height / 4,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(width: 5.0),
                  Text(
                    "Shops: ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: shops.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: Colors.blue.shade500,
                            child: Text(
                              "${shops[index]}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Price: Rs.",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  Text(
                    "$price",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              color: Colors.blue.shade500,
              height: height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Quantity: ",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              color: Colors.blue.shade500,
              // height: MediaQuery.of(context).size.height / 15,
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  RadioListTile(
                    value: 1,
                    groupValue: getby == 0 ? 1 : selectedRadioTile,
                    title: Text("Pick up"),
                    subtitle: Text("Go to the shop and pick up your order"),
                    onChanged: (val) {
                      print("Radio Tile pressed $val");
                      setSelectedRadioTile(val);
                      getby = 0;
                    },
                    activeColor: Colors.white,
                    secondary: null,
                    selected: true,
                  ),
                  RadioListTile(
                    value: 2,
                    groupValue: selectedRadioTile,
                    title: Text(
                      "Home Delivery",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Get your order delivered home(Rs.25 Extra)",
                      style: TextStyle(color: Colors.white),
                    ),
                    onChanged: (val) {
                      print("Radio Tile pressed $val");
                      setSelectedRadioTile(val);
                      getby = 1;
                    },
                    activeColor: Colors.white,
                    secondary: null,
                    selected: false,
                  ),
                ],
              ),
            ),
            getby == 0
                ? Container(
                    width: width,
                    color: Colors.blue.shade300,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Payment(order: 0, price: price),
                            ),
                          );
                        });
                      },
                      child: Text(
                        "Proceed to Payment",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: EdgeInsets.all(
                                height > width ? height / 100 : width / 100000),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  // height:
                                  // MediaQuery.of(context).size.height / 39,
                                  child: Text(
                                    "For home delivery enter your details",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  onChanged: (value) {
                                    setState(() {
                                      getname = value;
                                      detailsreceived = 1;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.yellow,
                                      ),
                                      labelText: "Name"),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    setState(() {
                                      // getphoneno = value;
                                      detailsreceived = 2;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.yellow,
                                    ),
                                    labelText: "Phone Number",
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) {
                                    setState(() {
                                      getaddress = value;
                                      detailsreceived = 3;
                                      print("Details:$detailsreceived");
                                    });
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.home,
                                        color: Colors.yellow,
                                      ),
                                      labelText: "Address"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        detailsreceived == 3 && count == 0
                            ? Container(
                                width: width,
                                color: Colors.blue.shade300,
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Payment(order: 1, price: price),
                                        ),
                                      );
                                    });
                                  },
                                  child: Text(
                                    "Proceed to Payment",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
