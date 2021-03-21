import 'package:url_launcher/url_launcher.dart';
import 'package:ween_arooh/utils/dialogs.dart';
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
 // if(context!=null)  Dialogs().awsomeDialog(context: context,)
    throw 'Could not launch $url';
  }
}
