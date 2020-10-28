import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flame/game.dart';
import 'MazeWall.dart';

class BoxGame extends Game {
  bool hasWon = false;
  Size screenSize;
  String mazeString = 'asdasdasdasd';
  List<MazeWall> _boxes;





  void initialize() async {
    _boxes =  List.generate(196, (n) => MazeWall(this, Rect.fromLTWH((((n + 1) / 14).ceil() * 26).toDouble(), (26 * (n % 14)).toDouble(), 25, 25)));
  }

  BoxGame() {
    initialize();
  }


  void render(Canvas canvas) {

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
        screenCenterX - 75,
        screenCenterY - 75,
        150,
        150
    );
    Paint boxPaint = Paint();

    boxPaint.color = Color(0xffffffff);
    _boxes.forEach((r) {
      r.render(canvas);
      //canvas.drawRect(r, boxPaint);
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
    print("Tapped!");
    _boxes.asMap().forEach((index, MazeWall r) {
      if(r.theRect.contains(d.globalPosition)) {
        print(index);
        //print("selected: " + r.theRect.left.toString());
        r.toggleSelected();
        print(r.selected);
      }
    });
  }

}