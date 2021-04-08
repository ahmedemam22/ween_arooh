import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'screens/addOffersScreen.dart';
import 'services/provider/AddOffersProvider.dart';
import 'package:ween_arooh/screens/settingScreen.dart';
import 'package:ween_arooh/screens/aboutUsScreen.dart';
import 'package:ween_arooh/screens/addActivityScreen.dart';
import 'services/provider/addActivityProvider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'screens/marketDetailsScreen.dart';
import 'screens/login/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'screens/addOffersScreen.dart';
import 'services/provider/AddOffersProvider.dart';
import 'package:ween_arooh/screens/settingScreen.dart';
import 'package:ween_arooh/screens/aboutUsScreen.dart';
import 'package:ween_arooh/screens/addActivityScreen.dart';
import 'services/provider/addActivityProvider.dart';
import 'package:ween_arooh/services/provider/marketDetailsProvider.dart';
import 'screens/marketDetailsScreen.dart';
import 'screens/login/login_screen.dart';
import 'screens/mainScreen.dart';
import 'screens/marketsScreen.dart';
import 'screens/login/registration_screen.dart';
import 'screens/chatScreen.dart';
import 'screens/login/splash_screen.dart';
import 'services/provider/registerProvider.dart';
import 'services/provider/homeProvider.dart';
import 'services/provider/marketProvider.dart';
import 'services/provider/offersProviders.dart';
import 'services/provider/chatProvider.dart';
import 'services/provider/userProvider.dart';
import 'screens/login/verfication_code_screen.dart';
import 'package:ween_arooh/widgets/displayImage.dart';
import 'screens/rateScreen.dart';


Future<void> main() async {
  // if your flutter > 1.7.8 :  ensure flutter activated
  WidgetsFlutterBinding.ensureInitialized();
  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );
 // intialize

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
          ChangeNotifierProvider(create: (_) => MarketProvider()),
          ChangeNotifierProvider(create: (_) => ChatProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => OffersProvider()),
          ChangeNotifierProvider(create: (_) => MarketDetailsProvider()),
          ChangeNotifierProvider(create: (_) => AddActivityProvider()),
          ChangeNotifierProvider(create: (_) => AddOffersProvider()),


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
          initialRoute: "/splash",

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
            '/market_details': (context) => MarketDetailsScreen(),
            '/display_image': (context) => DisplayImage(),
            '/add_offers': (context) => AddOffersScreen(),

          },
          debugShowCheckedModeBanner: false,


        ),
      );
  }
}
