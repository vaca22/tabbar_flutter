import 'package:flutter/material.dart';


//main
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var _bottomBarIndex = 0;
  String title = "Screen 0";
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.addListener(() {
      switch (_tabController.index) {
        case 0:
          {
            setState(() {
              title = "Profile";
            });
            break;
          }
        case 1:
          {
            setState(() {
              title = "Done";
            });
            break;
          }
        case 2:
          {
            setState(() {
              title = "DashBoard";
            });
            break;
          }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 1,
            child: TabBar(
              controller: _tabController,
              tabs: <Widget>[
                getItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  text: Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                getItem(
                  icon: Icon(
                    Icons.done,
                    color: Colors.black,
                  ),
                  text: Text(
                    "Done",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                getItem(
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.black,
                  ),
                  text: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewScreen(
              title: title,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomBarIndex,
        onTap: (index) {
          setState(() {
            _bottomBarIndex = index;
            title = "Screen $index";
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }

  Widget getItem({required Icon icon, required Text text}) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[icon, text],
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}