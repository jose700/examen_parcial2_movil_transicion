import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:examen_parcial2/Constants.dart';
import 'package:examen_parcial2/screens/bookCatalogue.dart';

class GenreCard extends StatefulWidget {
  const GenreCard({Key key, this.category}) : super(key: key);
  final String category;
  @override
  _GenreCardState createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            height: 60.0,
            // ignore: sort_child_properties_last
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: InkWell(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => Books(category: widget.category,)));
                },
                child: ListTile(
                  dense: true,
                  title: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/images/${widget.category}.svg",
                        height: 30.0,
                      ),
                      const SizedBox(
                        width:
                        10.0, // here put the desired space between the icon and the text
                      ),
                      Text(
                        widget.category.toUpperCase(),
                        style: kGenreCard,
                      ) // here we could use a column widget if we want to add a subtitle
                    ],
                  ),
                  trailing: SvgPicture.asset(
                    "assets/images/Next.svg",
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(211, 209, 238, 0.5),
                  blurRadius: 20.0, // soften the shadow
                  spreadRadius: 0.0, //extend the shadow
                  offset: Offset.fromDirection(
                    2.0, // Move to right 10  horizontally
                    5.0, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0,)
      ],
    );
  }
}