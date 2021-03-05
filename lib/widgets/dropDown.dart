import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/customDropDown.dart';
import 'package:provider/provider.dart';
import 'package:ween_arooh/services/provider/homeProvider.dart';
class DropDown extends StatefulWidget {
  final List<String>items;
  final double size;
  DropDown({this.items, this.size}) : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}



class DropDownState extends State<DropDown> {
  //
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(widget.items);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<String>> items = List();
    for (String company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Column(children: [
            Center(child: Text(company)),
            SizedBox(height: SizeConfig.blockSizeVertical*1.3,),
            Divider(height: 1,)
          ],),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem( selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;

    });
    // Provider.of<UrgentProvider>(context,listen: false).changeService_type( selectedCompany);

  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
          padding: EdgeInsets.only(
              bottom: SizeConfig.safeAreaVertical * 0.5,
              top: SizeConfig.safeAreaVertical * 0.5,
              left: SizeConfig.safeAreaVertical * 0.5,
              right: SizeConfig.safeAreaVertical * 0.5
          ),
          child: Container(
            width: widget.size??SizeConfig.screenWidth * 0.7,

            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: CustomDropdownButton(
              value: _selectedCompany,

              items: _dropdownMenuItems,
              hint: Center(child: Text(widget.size!=null?widget.items[0]:translator.translate('choose_activity'))),
              onChanged: onChangeDropdownItem,

            ),
          ));
  }
}