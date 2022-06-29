import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:licencias/screens/favs_screen.dart';
import 'package:licencias/screens/home_screen.dart';
import 'package:licencias/screens/login_screen.dart';
import 'package:licencias/screens/map_screen.dart';
import 'package:licencias/screens/offers_screen.dart';
import 'package:licencias/screens/payment_screen.dart';
import 'package:licencias/screens/search_screen.dart';
import 'package:licencias/screens/signup_screen.dart';
import 'package:licencias/screens/splash_screen.dart';

/// `runApp` is a function that takes a widget and displays it on the screen
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51LG5t8LgMDcZoeQmlc9LIEmRPz1zh7FqrPBzlpplzP4qF9e8N1EsGUnoBWKke0dBmYwJ2RrGl2ftmkI9YVhQDg6l004erWxoGF";
  runApp(const MyApp());
}

/// This class is the root of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Licenciamiento Queretaro',
      theme: ThemeData(
        primaryColor: Color(0xff76a6cf),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xff76a6cf)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginScreen(),
        '/signup': (BuildContext context) => new SignUpScreen(),
        '/splash': (BuildContext context) => new SplashScreen(),
        '/home': (BuildContext context) => new HomeScreen(
              title: "Demo Licenciamiento Queretaro",
            ),
        '/maps': (BuildContext context) => new MapScreen(),
        '/favs': (BuildContext context) => new FavsScreen(),
        '/search': (BuildContext context) => new SearchScreen(),
        '/offers': (BuildContext context) => new OffersScreen(),
        '/payments': (BuildContext context) => new PaymentScreen(),
      },
    );
  }
}
