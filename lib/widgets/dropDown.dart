import 'package:flutter/material.dart';
import 'package:ween_arooh/utils/size_responsive.dart';
import 'package:ween_arooh/utils/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ween_arooh/utils/customDropDown.dart';
class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<String> getCompanies() {
    return ["نجارة","بويات","تكييف","كهرباء", "ماتور مياه",'سباكة'];
  }
}

class DropDownState extends State<DropDown> {
  //
  List<String> _companies = Company.getCompanies();
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
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
            width: SizeConfig.screenWidth * 0.7,

            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: CustomDropdownButton(
              value: _selectedCompany,

              items: _dropdownMenuItems,
              hint: Center(child: Text("اختار الخدمة")),
              onChanged: onChangeDropdownItem,

            ),
          ));
  }
}
