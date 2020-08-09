import 'package:flutter/material.dart';
import 'package:dezzer_app/constants.dart';
import 'package:music_player/music_player.dart';
import 'package:provider/provider.dart';
import 'package:dezzer_app/services/album_api.dart';
import 'package:dezzer_app/models/album_model.dart';
import 'package:dezzer_app/screens/details.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  MusicPlayer musicPlayer = MusicPlayer();
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<ApiProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: height * 0.4,
        margin: EdgeInsets.only(right: 10.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FutureBuilder(
                future: data.getAlbums(id: 302128),
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
                future: data.getAlbums(id: 302127),
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
                future: data.getAlbums(id: 302123),
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
