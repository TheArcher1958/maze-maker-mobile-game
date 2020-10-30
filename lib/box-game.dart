import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'package:mobile_game/MazePieceSelector.dart';
import 'MazeWall.dart';

class BoxGame extends Game {
  bool hasWon = false;
  Size screenSize;
  String mazeString = 'asdasdasdasd';
  List<MazeWall> _boxes;
  List<MazePieceSelector> _placementPieces;
  List<Color> _placementPieceColors = [Color(0xff4287f5), Color(0xfff54e42)];



  void initialize() async {
    final initDimetion = await Flame.util.initialDimensions();
    resize(initDimetion);
    double screenCenterX = this.screenSize.width / 2;
    double screenCenterY = this.screenSize.height / 2;
    print(screenCenterY.toString() + " " + screenCenterX.toString());
    print(screenCenterY - ((26 * 14) / 2));
    _boxes =  List.generate(196, (n) => MazeWall(this, Rect.fromLTWH((((n + 1) / 14).ceil() * 26 + (screenCenterX - ((26 * 14) / 2) - 26)).toDouble(), ((screenCenterY - ((26 * 14) / 2)) + 26 * (n % 14)).toDouble(), 25, 25)));
    _placementPieces =  List.generate(2, (n) => MazePieceSelector(this, Rect.fromLTWH((((n + 1) / 2).ceil() * 45).toDouble(), (20 + 45 * (n % 14)).toDouble(), 40, 40), _placementPieceColors[n]));
  }

  BoxGame() {
    initialize();
  }


  void render(Canvas canvas) {
    //print(screenSize);
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff00ff00);
    canvas.drawRect(bgRect, bgPaint);
    // TODO: Try using widgets instead of Rects for the borders. Otherwise, use sprites for each box.
    // TODO: I can also add a solid border around the maze and require a start and ending box to be placed.
    // _boxes = List.generate(196, (n) => Rect.fromLTWH((((n + 1) / 14).ceil() * 26).toDouble(), (26 * (n % 14)).toDouble(), 25, 25));



    //_boxes = List.generate(196, (n) => MazeWall(this, Rect.fromLTWH((((n + 1) / 14).ceil() * 26).toDouble(), (26 * (n % 14)).toDouble(), 25, 25)));
    // _boxes = List.generate(196, (n) {
    //   return MazeWall(this, Rect.fromLTWH(
    //       (((n + 1) / 14).ceil() * 26).toDouble(), (26 * (n % 14)).toDouble(),
    //       25, 25))
    // });


    //print(_boxes);

    // for(var i = 0; i < _boxes.length; i++) {
    //   print(_boxes[i].left);
    //   // Rect boxRect = Rect.fromLTWH(
    //   //     screenCenterX - 75,
    //   //     screenCenterY - 75,
    //   //     150,
    //   //     150
    //   // );
    // }

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
        183,
        screenCenterY - 75,
        (26 * 14).toDouble(),
        150
    );
    Paint boxPaint = Paint();

    boxPaint.color = Color(0xf00ffcfc);
    _boxes.forEach((r) {
      r.render(canvas);
    });
    _placementPieces.forEach((r) {
      r.render(canvas);
    });
    //print("selected: " + _boxes[0].selected.toString());
    //canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }
  void onTapDown(TapDownDetails d) {
    _boxes.forEach((MazeWall r) {
      if(r.theRect.contains(d.globalPosition)) {
        r.toggleSelected();
      }
    });
  }

}