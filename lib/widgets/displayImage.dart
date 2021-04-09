import 'package:flutter/material.dart';
import 'package:ween_arooh/model/offersModel.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/offersProviders.dart';
class DisplayImage extends StatefulWidget {
  @override
  _DisplayImageState createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {
int _currentIndex=0;
int _index=0;
List<Result> _market=[];
int listLength=0;
String imagePath= "";
Result item;
@override
  void didChangeDependencies() {
  final ScreenArguments args = ModalRoute.of(context).settings.arguments as ScreenArguments;
  item=args.item;
  _market=args.ListData;
  _currentIndex =args.StartIndex;
  listLength= args.ListCount;
  imagePath= _market[_currentIndex].offers[_index].path;
    super.didChangeDependencies();
  }
  @override


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: InkWell(
            onTap: (){
              setState(() {
                print(_currentIndex);
                print(listLength-1);
                if(_currentIndex< listLength-1){
                  print('add image');
                  _currentIndex++;
                  imagePath= _market[_currentIndex].offers[_index].path;
                }

                else Navigator.pop(context);
              });

              print('index');


            },
            child: FadeInImage.assetNetwork(
              placeholder:"",
              fit: BoxFit.fill,
              image: imagePath??"",


              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,)),
      ),
    );
  }
}
