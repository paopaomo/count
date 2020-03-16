import 'package:flutter/material.dart';

class PassValueRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('pass the value through the route')
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () async {
                Navigator.of(context).pushNamed('tip_route', arguments: '我是提示xxx')
                .then(print);
              },
              child: Text('打开提示页')
          ),
        )
    );
  }
}