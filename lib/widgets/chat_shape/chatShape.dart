import 'package:flutter/material.dart';
class ChatShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return clip();
  }
  clip(){
   return Padding(
     padding:  EdgeInsets.symmetric(horizontal: 10),
     child: Container(
       height: 64,
       decoration: ShapeDecoration(
         color: Colors.white,
         shape: MessageBorder(),

       ),
       alignment: Alignment.centerRight,
       padding: EdgeInsets.only(right: 8),
       child: Container(
         child: Text('ssssssssssssssss'),

       ),
     ),
   );
  }
}
class MessageBorder extends ShapeBorder {
  final bool usePadding;

  MessageBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 10));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height /4)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 20)
      ..relativeLineTo(20, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}