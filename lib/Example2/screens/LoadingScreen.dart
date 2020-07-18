import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Loading Screen"),
          SizedBox(
            height: 16.0,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
