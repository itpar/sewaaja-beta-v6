import 'package:flutter/material.dart';
import 'package:flutter_loginn/presentation/tabs/models/tab_navigation_item.dart';
import 'package:flutter_loginn/main.dart';



class TabsPage extends StatefulWidget {

  TabsPage({Key key, this.username}) : super(key: key);

  final String username;

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //drawer
      drawer: Drawer(
        child: Container(
          color: Colors.blueAccent,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DrawerHeader(
                    decoration:
                    BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/parlogo.png"),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: DrawerHeader(
                    decoration:
                    BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/parlogo.png"),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView(children: [
                  ListTile(
                    title: Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text("Logout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      ); // do something
                    },
                  )
                ]),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
            padding: EdgeInsets.only(left: 110.0),
            child: Image.asset("assets/images/parlogo.png",
                height: 70.0, width: 70.0)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 40.0),
            child: IconButton(
                icon: Text("Log out"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ); // do something
                }),
          ),
        ],
        centerTitle: false,
      ),

      //body
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) => setState(() => _currentIndex = index),
        items: <BottomNavigationBarItem>[
          for (final tabItem in TabNavigationItem.items)
            BottomNavigationBarItem(
              icon: tabItem.icon,
              title: tabItem.title,
            ),
        ],
      ),
    );
  }
}
