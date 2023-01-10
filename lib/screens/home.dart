import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:examen_parcial2/widgets/genreCard.dart';
import 'package:examen_parcial2/Constants.dart';
/*En esta pantalla se visualizara un mensaje acerca de la materia y mis datos como estudiante, tambien se mostrara en una lista diferentes categorias de los libros*/
class MyMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: const Color(0xffF8F7FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    height: 250.0,
                    width: double.infinity,
                    // color: Colors.amber,
                    child: SvgPicture.asset(
                      "assets/images/Pattern.svg",
                      fit: BoxFit.cover,
                      height: 350,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Examen móvil',
                          style: kHeadingOne,
                        ),
                        Text(
                          'Parcial 2',
                          style: kHeadingOne,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          kDesc,
                          maxLines: 3,
                          style: kBody,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: genre.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GenreCard(category: genre[index],);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
