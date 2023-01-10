import 'package:flutter/material.dart';
import 'package:examen_parcial2/screens/home.dart';
import 'package:examen_parcial2/Constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookAppBar extends StatelessWidget {
  BookAppBar({Key key,  this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: SvgPicture.asset(
            'assets/images/Back.svg',
            height: 20.0,
            width: 20.0,
          ),
          onTap: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MyMainPage()));
          },),
        const SizedBox(width: 10.0,),
        Text(
          title,
          style: kHeadingTwo,
        )
      ],
    );
  }
}