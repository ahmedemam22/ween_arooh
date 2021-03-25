import 'package:flutter/material.dart';
import 'package:ween_arooh/model/chatModel.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ween_arooh/utils/glopal_app.dart';
class ChatShape extends StatelessWidget {
  ChatModel _chatModel;
  ChatShape(this._chatModel);
  String path;
  @override
  Widget build(BuildContext context) {
   path=_chatModel.type==2?'ic_system':'ic_person';
    print(_chatModel.type);
    print("typpppppppppppppp");
    return clip();
  }
  clip(){
   return Padding(
     padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
     child: Container(
       child: Column(
         crossAxisAlignment:CrossAxisAlignment.start ,
         children: [
           Padding(
             padding:  EdgeInsets.only(right: SizeConfig.screenWidth*s30,bottom: SizeConfig.screenWidth*s10),
             child: Text(_chatModel.type==2?'support':GlopalApp.user.fName),
           ),
           Row(
               children: [

                   Align(
                     alignment: Alignment.topRight,
                     child: SvgPicture.asset(


                       "assets/images/$path.svg",
                     ),
                   ),
                 SizedBox(width: 5,),

                 Container(
                     width: SizeConfig.screenWidth*0.8,
                     constraints:BoxConstraints(
                       minHeight: SizeConfig.screenWidth*s64
                     ) ,
                     
                     decoration: ShapeDecoration(
                       
                       color: lightGray,
                       shape: MessageBorder(),

                     ),
                     alignment: Alignment.centerRight,
                     padding: EdgeInsets.only(right: 8),
                     child: Container(
                       child: Text(_chatModel.message),

                     ),
                   ),

               ],
             ),

         ],
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
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height /8)))
      ..moveTo(rect.bottomCenter.dx - 115, rect.bottomCenter.dy)
      ..relativeLineTo(10, 20)
      ..relativeLineTo(20, -20)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}