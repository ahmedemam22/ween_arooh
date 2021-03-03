import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/screens/homeScreen.dart';
import 'package:ween_arooh/screens/offersScreen.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index=0;
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
List<Widget>_widgets=[HomeScreen(_scaffoldKey),HomeScreen(_scaffoldKey),OffersScreen(_scaffoldKey)];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      key: _scaffoldKey,
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
      onTap: (index){
        setState(() {
          _index=index;
        });
      },
          currentIndex: _index, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text(translator.translate('main')),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.app_registration),
              title: new Text(translator.translate('register')),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
                title: Text(translator.translate('offers'))
            )
          ],
        ),
     body:_widgets[_index]


    );
  }
  openDrawer(){
    _scaffoldKey.currentState.openDrawer();
  }
}
