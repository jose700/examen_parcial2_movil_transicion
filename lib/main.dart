
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'Screens/home.dart';
import 'Screens/noInternetPage.dart';
import 'dart:async';
import 'dart:io';

void main() {
  runApp(MyApp());
}
//exportamos las librerias a utilizar, lo primero que se mostrara es un splash screen con una animación(transición y con un titulo), despues de aquello nos redirige a la pantalla inicial MyMainPage
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen móvil',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    internetConnectivity();
    Timer(
        const Duration(seconds: 3),
        () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyMainPage()))
            });
  }

  internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => NoInternet()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          height: double.infinity,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeTransition(
                opacity: animation,
                child: const Text(
                  'Examen móvil Parcial 2',
                 
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color(0xff5E56E7),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
