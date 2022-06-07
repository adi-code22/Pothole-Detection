import 'package:buildathon_main/views/mainScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/agromedlogo.png', fit: BoxFit.cover),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(height: 60),
          color: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          backgroundColor: Colors.green[300],
          onPressed: () {
            Navigator.pushNamed(context, '/notification');
          },
        ),
        body: Container(
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage('assets/adnew.png'), fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(37, 25, 37, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Rice',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🌾 Rice",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Tomato',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🍅 Tomato",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Banana',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🍌 Banana",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(11, 25, 11, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Cucumber',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🥒 Cucumber",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    color: Colors.green[300],
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(12, 25, 12, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Pepperbell',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🍏 PepperBell",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(
                            title: 'Potato',
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "🥔 Potato",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
