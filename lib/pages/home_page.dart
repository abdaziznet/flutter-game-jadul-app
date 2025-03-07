import 'package:flutter/material.dart';
import '../models/data.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _deviceHeight;
  var _deviceWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _featureGameWidget(),
        ],
      ),
    );
  }

  Widget _featureGameWidget() {
    return SizedBox(
        height: _deviceHeight * 0.50,
        width: _deviceWidth,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((_game) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(_game.coverImage.url),
                  onError: (error, stackTrace) {
                    print('Failed to load image: $error');
                  },
                ),
              ),
            );
          }).toList(),
        ));
  }
}
