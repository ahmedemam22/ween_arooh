import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/drawer.dart';
import 'package:ween_arooh/screens/homeScreen.dart';
import 'package:ween_arooh/screens/addActivityScreen.dart';
import 'package:ween_arooh/screens/offersScreen.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
import 'package:ween_arooh/services/provider/addActivityProvider.dart';
import 'package:ween_arooh/services/provider/userProvider.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index=0;
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
List<Widget>_widgets=[HomeScreen(_scaffoldKey),AddActivityScreen(),OffersScreen(_scaffoldKey)];
int _count=0;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
  Provider.of<HomeProvider>(context,listen: false).getSliders();

  if(_count==0){  Provider.of<HomeProvider>(context,listen: true).getMainCategories().then((value) => null);
    Provider.of<AddActivityProvider>(context,listen: true).getUserMarkets().then((value) => null);
    Provider.of<HomeProvider>(context,listen: false).getCities();

    Provider.of<UserProvider>(context,listen: false).aboutUs();
  _count++;
  }
    super.didChangeDependencies();

}
  @override
  Widget build(BuildContext context) {
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
              icon: setIcon('home'),
              title: new Text(translator.translate('main')),
            ),
            BottomNavigationBarItem(
              icon: setIcon('register'),
              title: new Text(translator.translate('register')),
            ),
            BottomNavigationBarItem(
                icon: setIcon('offers'),
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
 Widget setIcon(String iconName){
    return SvgPicture.asset(

      "assets/images/$iconName.svg",

    );
  }
}
