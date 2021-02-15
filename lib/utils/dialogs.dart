import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ween_arooh/utils/colors.dart';
class Dialogs{
  awsomeDialog({context,type,title,desc}){
    return AwesomeDialog(
      context: context,
      dialogType:type,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      desc: desc,
      btnOkOnPress: () {},
      btnOkColor: backgroundColor,

    )..show();
  }
}