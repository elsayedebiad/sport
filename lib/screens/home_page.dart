// ignore_for_file: prefer_const_constructors, unused_element, prefer_final_fields, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/screens/home.dart';

import 'football_detils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScoreLive',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int Indexing = 0;
  void _onItemTapped(int index) {
    if (index == 3) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() {
        Indexing = index;
      });
    }
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Row(
          children: [
            Text('SCORE',
                style:
                    TextStyle(color: Color(0xFFE91C63), fontFamily: 'Poppins')),
            Spacer(),
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 41, 45, 49),
              ),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),

                    child: Image.asset("assets/image/icons8-google-48.png"))),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("elsayedebed",style: TextStyle(fontFamily: 'Poppins',fontSize: 18),),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("engelsayedebed@gmail.com",style: TextStyle(fontFamily: 'Poppins',fontSize: 12),),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle the tap
              },
            ),
            ListTile(
              leading: Container(
                width: 230,
                child: ElevatedButton(
                  onPressed: () async {
                    {
                      GoogleSignIn googleSignIn = GoogleSignIn();
                      googleSignIn.disconnect();
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }
                  },
                  child: Text(
                    "Logout",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Competition'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'News'),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () async {
                    GoogleSignIn googlesing = GoogleSignIn();
                    googlesing.disconnect();
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Icon(Icons.logout_outlined)),
              label: 'Logout'),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarBar(screenWidth: screenWidth, screenHeight: screenHeight),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Live Now',
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold)),
                        Spacer(),
                        TextButton(
                          child: Text('See More',
                              style: TextStyle(color: Colors.pink)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    HorizontalScoreList(
                        screenWidth: screenWidth, screenHeight: screenHeight),
                    SizedBox(height: screenHeight * 0.02),
                    Text('Premier League',
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarBar extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  CalendarBar({required this.screenWidth, required this.screenHeight});

  @override
  _CalendarBarState createState() => _CalendarBarState();
}

class _CalendarBarState extends State<CalendarBar> {
  ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - widget.screenWidth * 0.2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + widget.screenWidth * 0.2,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF151515),
      height: widget.screenHeight * 0.1,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: _scrollLeft,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              children: [
                _buildCalendarItem(0, 'Fri', '14 Apr'),
                _buildCalendarItem(1, 'Sat', '15 Apr'),
                _buildCalendarItem(2, 'Today', '16 Apr'),
                _buildCalendarItem(3, 'Mon', '17 Apr'),
                _buildCalendarItem(4, 'Tue', '18 Apr'),
                _buildCalendarItem(5, 'Wed', '19 Apr'),
                _buildCalendarItem(6, 'Thu', '20 Apr'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: _scrollRight,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarItem(int index, String day, String date) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: CalendarItem(
        day: day,
        date: date,
        isSelected: isSelected,
        screenWidth: widget.screenWidth,
      ),
    );
  }
}

class CalendarItem extends StatelessWidget {
  final String day;
  final String date;
  final bool isSelected;
  final double screenWidth;

  CalendarItem(
      {required this.day,
      required this.date,
      this.isSelected = false,
      required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalScoreList extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final List<Map<String, dynamic>> liveScores = [
    {
      'league': 'Premier \n League',
      'homeTeam': 'Nottingham \n Forest',
      'awayTeam': 'Manchester \n United',
      'score': '0 - 2',
      'minute': 78,
    },
    {
      'league': 'La Liga',
      'homeTeam': 'Barcelona',
      'awayTeam': 'Real Madrid',
      'score': '1 - 1',
      'minute': 55,
    },
    {
      'league': 'Serie A',
      'homeTeam': 'Juventus',
      'awayTeam': 'AC Milan',
      'score': '2 - 2',
      'minute': 70,
    },
  ];

  HorizontalScoreList({required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: screenHeight * 0.30,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Premier  League",
                              style: TextStyle(fontFamily: 'elsayed2'),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 25,
                            margin: EdgeInsets.only(right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: Colors.green, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "75",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'elsayed2'),
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
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Football",
                                  style: TextStyle(
                                      fontFamily: 'elsayed', fontSize: 45),
                                )),
                            Container(
                                child: Image.asset(
                              "assets/photos/football.png",
                              width: 120,
                            ),),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryScreen()));

                          },
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'elsayed2'),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE91C63),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: screenHeight * 0.30,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Euro league",
                              style: TextStyle(fontFamily: 'elsayed2'),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 25,
                            margin: EdgeInsets.only(right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: Colors.green, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "75",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'elsayed2'),
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
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Basketball",
                                  style: TextStyle(
                                      fontFamily: 'elsayed', fontSize: 45),
                                )),
                            Container(
                                height: 110,
                                child: Image.asset(
                                  "assets/photos/basket.png",
                                  width: 116,
                                  height: 100,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close',
                                        style: TextStyle(
                                            color: Color(0xffE91C63),
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                                icon: Image.asset(
                                  "assets/photos/conmingsoon.png",
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text('Coming Soon',
                                    style: TextStyle(
                                        color: Color(0xffE91C63),
                                        fontWeight: FontWeight.w400)),
                                contentPadding: const EdgeInsets.all(40.0),
                                content: const Text(
                                  'Basketball information is not available at the moment',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'elsayed2'),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE91C63),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: screenHeight * 0.30,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Tata IPL",
                              style: TextStyle(fontFamily: 'elsayed2'),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 25,
                            margin: EdgeInsets.only(right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: Colors.green, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "75",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'elsayed2'),
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
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Cricket",
                                  style: TextStyle(
                                      fontFamily: 'elsayed', fontSize: 45),
                                )),
                            Container(
                                child: Image.asset(
                              "assets/photos/cricket.png",
                              width: 120,
                            )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close',
                                        style: TextStyle(
                                            color: Color(0xffE91C63),
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                                icon: Image.asset(
                                  "assets/photos/conmingsoon.png",
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text('Coming Soon',
                                    style: TextStyle(
                                        color: Color(0xffE91C63),
                                        fontWeight: FontWeight.w400)),
                                contentPadding: const EdgeInsets.all(40.0),
                                content: const Text(
                                  'Cricket information is not available at the moment',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'elsayed2'),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE91C63),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: screenHeight * 0.30,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: 70,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff222222),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              "Grand Slam",
                              style: TextStyle(fontFamily: 'elsayed2'),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 25,
                            margin: EdgeInsets.only(right: 20, top: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.brightness_1,
                                      color: Colors.green, size: 10),
                                  SizedBox(width: 5),
                                  Text(
                                    "75",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'elsayed2'),
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
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Tennis",
                                  style: TextStyle(
                                      fontFamily: 'elsayed', fontSize: 45),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 5),
                                height: 120,
                                child: Image.asset(
                                  "assets/photos/tennis.png",
                                  width: 120,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 24),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close',
                                        style: TextStyle(
                                            color: Color(0xffE91C63),
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                                icon: Image.asset(
                                  "assets/photos/conmingsoon.png",
                                  width: 50,
                                  height: 50,
                                ),
                                title: Text('Coming Soon',
                                    style: TextStyle(
                                        color: Color(0xffE91C63),
                                        fontWeight: FontWeight.w400)),
                                contentPadding: const EdgeInsets.all(40.0),
                                content: const Text(
                                  'Tennis information is not available at the moment',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'elsayed2'),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE91C63),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
