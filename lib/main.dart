import 'package:flutter/material.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:mobile_game/box-game.dart';
import 'package:flutter/gestures.dart';
import 'package:mobile_game/home-screen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);


  // runApp(MaterialApp(
  //     home: HomeScreen(),
  //     routes: {
  //       //'/homeTab': (context) => FirstScreen(),
  //       // '/loading': (context) => LoadingScreen(),
  //       // '/login': (context) => LoginScreen.LoginScreen(),
  //       // '/register': (context) => RegisterScreen(),
  //     },
  //     theme: ThemeData(
  //       // // Define the default brightness and colors.
  //       // brightness: Brightness.dark,
  //       //
  //       // primaryColor: Color(0xffFE7615),
  //       // accentColor: Color(0xffff0e19),
  //       // scaffoldBackgroundColor: Color(0xff2D3238),
  //       //
  //       //
  //       // // Define the default font family.
  //       // fontFamily: 'UniSansHeavy',
  //       // primaryTextTheme: TextTheme(
  //       //     headline1: TextStyle(color: Colors.white)
  //       // ),
  //       //
  //       // // Define the default TextTheme. Use this to specify the default
  //       // // text styling for headlines, titles, bodies of text, and more.
  //       // textTheme: TextTheme(
  //       //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  //       //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  //       //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Armata-Regular'),
  //       // ),
  //     )
  // ));


  BoxGame game = BoxGame();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);
}
