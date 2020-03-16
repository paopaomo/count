import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/my_home_page.dart';
import 'package:flutter_demo/new_route.dart';
import 'package:flutter_demo/pass_value_route.dart';
import 'package:flutter_demo/tap_box_route.dart';
import 'package:flutter_demo/tip_route.dart';
import 'package:flutter_demo/counter_route.dart';
import 'package:flutter_demo/cupertino_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        'new_route': (context) => NewRoute(),
        'pass_value_route': (context) => PassValueRoute(),
        'tip_route': (context) => TipRoute(text: ModalRoute.of(context)
            .settings.arguments),
        'counter_route': (context) => CounterRoute(),
        'cupertino_demo': (context) => CupertinoRoute(),
        'tap_box': (context) => TapBoxRoute()
      },
    );
  }
}
