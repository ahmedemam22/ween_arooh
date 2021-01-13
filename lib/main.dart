import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/screens/login/login_screen.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/screens/login/splash_screen.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/screens/login/registration_screen.dart';
import 'file:///C:/Users/raitoa%20pplication/Desktop/projects/ween_arooh/lib/screens/login/verfication_code_screen.dart';




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
       MaterialApp(
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
        initialRoute: "/splash",

        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/verfication': (context) => VerficationCodeScreen(),
          '/register': (context) => RegistrationScreen(),
        },
        debugShowCheckedModeBanner: false,


    );
  }
}



