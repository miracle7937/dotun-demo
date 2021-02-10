import 'package:dotun_app/customWidget/Card.dart';
import 'package:dotun_app/customWidget/avatar.dart';
import 'package:dotun_app/customWidget/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.add),
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Icon(
            Icons.message,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getUpdateStories(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Explore",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TimeLineCard(),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Center(
                child: Text(
              "Tap to enter second Page",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          offset: Offset(4, 4),
                          color: Color.fromRGBO(0, 0, 0, 0.3))
                    ]),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.add),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ProfileAvater(
                                image: userImage,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.message,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Tilia Lopez",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          numPlaceHolder(number: "23455", subtitle: "Post"),
                          numPlaceHolder(number: "456", subtitle: "Followers"),
                          numPlaceHolder(number: "333", subtitle: "Following")
                        ],
                      ),
                    ),
                    CustomButton()
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: getUpdateStories(),
                ),
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                      icon: Text(
                    "Post",
                    style: style,
                  )),
                  Tab(
                      icon: Text(
                    "Videos",
                    style: style,
                  )),
                  Tab(
                      icon: Text(
                    "IGTV",
                    style: style,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Center(
                        child: Container(
                      color: blueColor,
                    )),
                    Center(
                        child: Container(
                      color: pinkColor,
                    )),
                    Center(
                        child: Container(
                      color: orangeColor,
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  get style =>
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black);
  numPlaceHolder({String number, String subtitle}) => Column(
        children: [
          Text(
            number,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(subtitle)
        ],
      );
}
