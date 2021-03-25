import 'package:url_launcher/url_launcher.dart';
import 'package:ween_arooh/utils/dialogs.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
Future<void> makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
launchEmail(email) async {
  if (await canLaunch("mailto:$email")) {
    await launch("mailto:$email");
  } else {
    throw 'Could not launch';
  }
}
launchURL(String url,[context]) async {

  if (await canLaunch(url)) {
    await launch(url);
  } else {
 if(context!=null)  Dialogs().awsomeDialog(context: context,desc: translator.translate('general_error'),title: translator.translate('sorry') );
    throw 'Could not launch $url';
  }
}
