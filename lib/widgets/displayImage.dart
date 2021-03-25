import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
int _currentIndex=0;
@override
  void didChangeDependencies() {
  _currentIndex=ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _market=Provider.of<OffersProvider>(context,listen: false).offersItems;
    return Scaffold(
      body: Container(
        child: InkWell(
            onTap: (){
              setState(() {
                if(_currentIndex<_market.length-1){
                  print('ssssssss');
                  print(_market.length);
                _currentIndex=_currentIndex+1;
                  print(_currentIndex);

                }

                else Navigator.pop(context);
              });

              print('index');


            },
            child: FadeInImage.assetNetwork(
              placeholder:"assets/images/offers.jpg",
              fit: BoxFit.fill,
              image: _market[_currentIndex].path??"",


              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,)),
      ),
    );
  }
}
