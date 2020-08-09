import 'package:dezzer_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/album_api.dart';

void main() => runApp(DezzerApp());

class DezzerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
