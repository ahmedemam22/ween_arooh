import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/colors.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ween_arooh/utils/launcher.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
class ContactShape extends StatefulWidget {

  @override
  _ContactShapeState createState() => _ContactShapeState();
}
int _index;
class _ContactShapeState extends State<ContactShape> {
  @override
  Widget build(BuildContext context) {
    final _item=Provider.of<MarketDetailsProvider>(context,listen: false).marketDetails;
   return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
       InkWell(
           onTap: ()async{
             setState(() {
               _index=0;
             });

             await launchEmail(_item.email);
           },child: shape(translator.translate('email'),"email",0)),
       InkWell(
           onTap: ()async{
             setState(() {
               _index=1;
             });

    await makePhoneCall('tel:01112807193');
           },
           child: shape(translator.translate('call'),"call",1)),
       InkWell(
           onTap: ()async{
             setState(() {
               _index=2;
             });
             await launchURL(_item.siteLink,context);
           },
           child: shape(translator.translate('website'),"website",2)),

     ],
   );
  }

 Widget shape(String title,String iconName,int ind){
    return Card(
      child: Container(

          color: ind==_index?darkGrey:lightGray,


        
        width: SizeConfig.screenWidth*s120,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical:SizeConfig.screenWidth*s5),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center ,
            mainAxisAlignment:MainAxisAlignment.center ,
            children: [
              SvgPicture.asset(

                "assets/images/$iconName.svg",
                color: _index==ind?Colors.white:darkGrey,
              ),
              Text(title,style: TextStyle(
                            color: _index==ind?Colors.white:darkGrey,

              ),)
            ],
          ),
        ),
      ),
    );

  }
}
