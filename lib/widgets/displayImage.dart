import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
int _currentIndex;

  @override
  Widget build(BuildContext context) {
    final _market=Provider.of<OffersProvider>(context,listen: false).offersItems;
     _currentIndex=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: InkWell(
            onTap: (){
              setState(() {
                if(_currentIndex<_market.length-1)
                _currentIndex++;
                else _currentIndex=0;
              });


            },
            child: Image.network(_market[_currentIndex].panner,width: SizeConfig.screenWidth,height: SizeConfig.screenHeight,fit: BoxFit.fill,)),
      ),
    );
  }
}
