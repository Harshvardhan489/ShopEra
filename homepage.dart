import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:startup_try_2/drawerScreen.dart';
import 'package:startup_try_2/screens/home/home_screen.dart';
import 'package:startup_try_2/shoppage.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _auth = FirebaseAuth.instance;
   FirebaseUser loggedInUser;

  void initState(){
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
    final user = await _auth.currentUser;
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }}
    catch(e){
      print(e);
    }
  }

  var list = ["Shop1","Shop2","Shop3","Shop4","Shop5","Shop6","Shop7","Shop8","Shop9","Shop10"];
  var star = [4,5,3,4,5,2,1,4,5,3];
  int _currentIndex=0;
  List cardList=[
    Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTspM6SMu_d4y2V_yKF3ZnzzsOh-yWUmrEBNQ&usqp=CAU",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://www.danviews.com/wp-content/uploads/2010/08/special-offer.jpg",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSAxF0G7WneFCtlWlxcohbpweUCIJodidwI7A&usqp=CAU",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQvlzQ0akLnOXRwJaX2UGleVAYLUSd89cyApA&usqp=CAU",
      fit: BoxFit.cover,
    ),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    return
        Scaffold(
          backgroundColor: Colors.blue.shade900,
          drawer: DrawerScreen(),
          appBar: AppBar(
            titleSpacing: 40.0,
            centerTitle: true,
            backgroundColor: Colors.blue.shade900,
            title: Image.asset("assets/images/home/shoperaname_rembg.png",fit: BoxFit.fill,),
            actions: [
              FlatButton(splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                  onPressed: (){showSearch(context: context, delegate: DataSearch());},
                  child: Icon(Icons.search,color: Colors.white,)
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height : width > height ? width/20 : height/20,
                ),
                CarouselSlider(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  aspectRatio: 2.0,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: cardList.map((card){
                    return Builder(
                        builder:(BuildContext context){
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            height: width > height ? width/5 : height*0.30,
                            width: width > height ? height*1.5 : width,
                            child: Card(
                              color: Colors.blueAccent,
                              child: card,
                            ),
                          );
                        }
                    );
                  }).toList(),
                ),
                Container(
                  margin: EdgeInsets.only(top: height/17),
                  padding: EdgeInsets.only(
                    top: height/30,
                    //left: kDefaultPaddin,
                    //right: kDefaultPaddin,
                  ),
                  height: width>height ? (width*list.length)/5.8 : (height*list.length)/5.7,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(3.0),
                        width: width>height ? height : width,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: FlatButton(
                                    onPressed: (){
                                      setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => HomeScreen()),
                                        );
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(2.0),
                                      child: Column(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: Image.asset(
                                              "assets/images/home/mobiles.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text("Mobiles",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/laptop.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Laptops",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/appliances.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Appliances",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/cosmetics.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Cosmetics",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child:Image.asset(
                                            "assets/images/home/kitchen.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Kitchen",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/furniture.jpg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Furniture",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/fashion.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Fashion",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.all(2.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: Image.asset(
                                            "assets/images/home/meds.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text("Meds",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                            itemBuilder : (BuildContext context,int index){
                              return Container(
                                margin: EdgeInsets.only(top: 8.0,left: width > height ? height/30 : width/30,right: width > height ? height/30 : width/30,bottom: 8.0),
                                height: width > height ? width/8 : height/8,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width > height ? height/35 : width/35,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.blue.shade200,
                                      radius: width > height ? width/18 : height/18,
                                    ),
                                    SizedBox(
                                      width: width > height ? height/30 : width/30,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        //SizedBox(height: height/0,),
                                        Text(list[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: width > height ? height/15 : width/15),),
                                        Text("Category: abc",style: TextStyle(color: Colors.white,fontSize: width > height ? height/30 : width/30),),
                                        StarDisplay(value: star[index],),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                        )
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

class DataSearch extends SearchDelegate<String>{

  // String hos;
  //
  // DataSearch({this.hos});

  final description = [
    "Global standards in research and clinical practices and radio-diagnosis.",
    "1st hospital to use Y shaped stent in th region",
    "1st in Karnataka to do bone marrow translpant",
    "Ranked No.3 among the best hospitals in the world",
    "Awarded India's most promising and valuable hospital by Pharma Leaders 2014",
  ];

  final lead = [
    "images/manipal.jpg",
    "images/apollo.jpg",
    "images/sagar.jpg",
    "images/fortis.jpg",
    "images/peopletree.jpg",
  ];

  final star_count = [5,4,4,4,5];

  final eta_time = ["10:00","15:00","30:00","50:00","60:00"];

  final hospitals = ["Manipal Hospital","Apollo Hospital","Sagar Hospital","Fortis Hospital","People Tree Hospital"];

  final recentHospitals = ["Manipal Hospital","Apollo Hospital","Sagar Hospital"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear),onPressed: (){
      query = "";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentHospitals :
    hospitals.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context,index) => ListTile(
        // leading: Image.asset(lead[index],
        //   height: 100,
        //   width: 40,
        // ),
        title: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopPage()),
                  );
                },
                title: RichText(
                  text: TextSpan(
                    text: suggestionList[index].substring(0,query.length),
                    style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                subtitle:
                Text(description[index]),
              ),
              IconTheme(
                data: IconThemeData(
                  color: Colors.amber,
                  size: 25,
                ),
                child: StarDisplay(value: star_count[index]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Text('ETA: ${eta_time[index]}', style: TextStyle(fontWeight: FontWeight.bold,),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Icon(Icons.phone),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Icon(Icons.email),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Icon(Icons.message),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.yellowAccent.shade700,
        );
      }),
    );
  }
}
