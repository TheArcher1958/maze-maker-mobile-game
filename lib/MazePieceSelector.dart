import 'dart:ui';
import 'box-game.dart';

class MazePieceSelector {
  final BoxGame game;
  Rect theRect;
  bool selected = false;
  Paint boxPaint = Paint();
  Color paintColor;

  void toggleSelected() {
    this.selected = !selected;
  }

  MazePieceSelector(this.game, this.theRect, this.paintColor);


  void render(Canvas c) {
    boxPaint.color = selected == false ? paintColor : Color(0xFfffa0dc);
    c.drawRect(theRect, boxPaint);
  }

  void update(double t) {

  }
}


