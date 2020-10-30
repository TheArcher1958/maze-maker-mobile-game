import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// a = no walls 0
// b = top wall 1
// c = right wall 2
// d = bottom wall 3
// e = left wall 4
// f = top + right 5
// g = right + bottom 6
// h = bottom + left 7
// i = left + top 8

//ibbbf
//eibbf
//eibbf
//eibbf
//eibbf

class _HomeScreenState extends State<HomeScreen> {
  var fivebyfive = 'ibbbf eibbf eibbf eibbf eibbf';


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Vocal Bird'),
      ),
      body: Container(),
    );
  }
}
