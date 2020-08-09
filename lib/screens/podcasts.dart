import 'package:dezzer_app/models/album_model.dart';
import 'package:dezzer_app/screens/details.dart';
import 'package:dezzer_app/services/album_api.dart';
import 'package:flutter/material.dart';
import 'package:dezzer_app/constants.dart';
import 'package:provider/provider.dart';

class PodCasts extends StatefulWidget {
  @override
  _PodCastsState createState() => _PodCastsState();
}

class _PodCastsState extends State<PodCasts> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var data = Provider.of<ApiProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height * 0.4,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FutureBuilder(
                future: data.getAlbums(id: 302118),
                builder: (context, AsyncSnapshot<Album> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return listOfAlbums(
                        img: snapshot.data.image,
                        fans: snapshot.data.fans,
                        name: snapshot.data.name,
                        context: context,
                        navigate: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                id: snapshot.data.id,
                                img: snapshot.data.image,
                              ),
                            ),
                          );
                        });
                  }
                }),
            FutureBuilder(
                future: data.getAlbums(id: 302117),
                builder: (context, AsyncSnapshot<Album> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return listOfAlbums(
                        img: snapshot.data.image,
                        fans: snapshot.data.fans,
                        name: snapshot.data.name,
                        context: context,
                        navigate: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                id: snapshot.data.id,
                                img: snapshot.data.image,
                              ),
                            ),
                          );
                        });
                  }
                }),
            FutureBuilder(
                future: data.getAlbums(id: 302116),
                builder: (context, AsyncSnapshot<Album> snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return listOfAlbums(
                        img: snapshot.data.image,
                        fans: snapshot.data.fans,
                        name: snapshot.data.name,
                        context: context,
                        navigate: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(
                                id: snapshot.data.id,
                                img: snapshot.data.image,
                              ),
                            ),
                          );
                        });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
