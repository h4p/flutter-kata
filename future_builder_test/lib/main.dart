import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Scaffold(body: Center(child: MyWidget()))));

Future<String> callAsyncFetch() => Future.delayed(Duration(seconds: 2), () => "hi");

class MyWidget extends StatelessWidget {
  @override
  Widget build(context) {
    return FutureBuilder<String>(
        future: callAsyncFetch(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data);
          } else {
            return CircularProgressIndicator();
          }
        }
    );
  }
}