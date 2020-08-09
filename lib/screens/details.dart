import 'package:dezzer_app/models/album_model.dart';
import 'package:dezzer_app/services/album_api.dart';
import 'package:dezzer_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final int id;
  final String img;
  Details({this.id, this.img});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  MusicPlayer musicPlayer = MusicPlayer();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var data = Provider.of<ApiProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: data.getSongs(widget.id),
            builder: (context, AsyncSnapshot<List<Album>> snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: height * 0.3,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(widget.img),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                              onTap: () {
                                musicPlayer.play(
                                  MusicItem(
                                    url: snapshot.data[index].mp3,
                                    trackName: "",
                                    artistName: "",
                                    albumName: "",
                                    duration: Duration(
                                        milliseconds:
                                            snapshot.data[index].duration),
                                  ),
                                );
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: 10.0, bottom: 10.0),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  backgroundColor: Colors.white54,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          snapshot.data[index].songName,
                          style: textStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
