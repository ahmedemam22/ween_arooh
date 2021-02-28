import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ween_arooh/screens/settingScreen.dart';
import 'package:ween_arooh/screens/aboutUsScreen.dart';
import 'package:ween_arooh/screens/addActivityScreen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'screens/login/login_screen.dart';
import 'screens/mainScreen.dart';
import 'screens/marketsScreen.dart';
import 'screens/login/registration_screen.dart';
import 'screens/offersScreen.dart';
import 'screens/chatScreen.dart';
import 'screens/login/splash_screen.dart';
import 'services/provider/registerProvider.dart';
import 'services/provider/homeProvider.dart';
import 'screens/login/verfication_code_screen.dart';
import 'screens/rateScreen.dart';


Future<void>  main() async{
  WidgetsFlutterBinding.ensureInitialized();
  LIST_OF_LANGS = ['ar', 'en'];
  LANGS_DIR = 'assets/lang/'; // define directory
  await translator.init(); // intialize/ intialize

  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),


        ],
         child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "GESS",

            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          locale: translator.locale,
          supportedLocales: translator.locals(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          initialRoute: "/add_activity",

          routes: {
            '/splash': (context) => SplashScreen(),
            '/login': (context) => LoginScreen(),
            '/verfication': (context) => VerficationCodeScreen(),
            '/register': (context) => RegistrationScreen(),
            '/main': (context) => MainScreen(),
            '/markets': (context) => MarketsScreen(),
           // '/offers': (context) => OffersScreen(),
            '/setting': (context) => SettingScreen(),
            '/about_us': (context) => AboutUsScreen(),
            '/chat': (context) => ChatScreen(),
            '/rate': (context) => RateScreen(),
            '/add_activity': (context) => AddActivityScreen(),

          },
          debugShowCheckedModeBanner: false,


    ),
       );
  }
}



