import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/widgets/bottomNavigationBar.dart';
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
  int _index=1;
  static final   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
  static final   GlobalKey<ScaffoldState> _scaffoldKeyy = new GlobalKey<ScaffoldState>(); // ADD THIS LINE
List<Widget>_widgets=[AddActivityScreen(),HomeScreen(_scaffoldKey),OffersScreen()];
int _count=0;
@override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
 _index= ModalRoute.of(context).settings.arguments??1;
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
    return WillPopScope(onWillPop: () async => false,

      child: Scaffold(
          drawer: AppDrawer(),
          bottomNavigationBar:BottomnavigationBar(main_Screen: true),
       body: Consumer<HomeProvider>(
    builder: (context, add, child) {
_index=add.index;
      return

        _widgets[add.index];})


      ),
    );
  }
  openDrawer(){
    _scaffoldKey.currentState.openDrawer();
  }

}
