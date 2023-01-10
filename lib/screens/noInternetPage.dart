import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({
    Key key,
  }) : super(key: key);
  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      body: Center(
        child: Image.asset('assets/images/internet.png'),
      ),
    );
  }
}