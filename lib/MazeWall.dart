import 'dart:ui';
import 'box-game.dart';
import 'package:flutter/gestures.dart';

class MazeWall {
  final BoxGame game;
  Rect theRect;
  bool selected = false;
  Paint boxPaint = Paint();

  void toggleSelected() {
    this.selected = !selected;
  }

  MazeWall(this.game, this.theRect);


  void render(Canvas c) {

    boxPaint.color = selected == false ? Color(0xffffffff) : Color(0xff8ba0dc);
    c.drawRect(theRect, boxPaint);
  }

  void update(double t) {

  }
}


