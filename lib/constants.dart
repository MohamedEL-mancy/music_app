import 'package:flutter/material.dart';
import 'styles.dart';

Widget listOfAlbums({
  String img,
  String name,
  int fans,
  BuildContext context,
  Function navigate,
}) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.only(top: 10.0),
    // child: ListView.builder(
    //   itemCount: 3,
    //   scrollDirection: Axis.horizontal,
    //   itemBuilder: (context, index) {
    child: Column(
      children: <Widget>[
        GestureDetector(
          onTap: navigate,
          child: Container(
            margin: EdgeInsets.only(left: 10.0),
            height: height * 0.2,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(img),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: CircleAvatar(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.white10,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: width * 0.2,
          child: Text(name, style: textStyle),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.white60,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(fans.toString(), style: textStyle),
          ],
        ),
      ],
    ),
    //   },
    // ),
  );
}
