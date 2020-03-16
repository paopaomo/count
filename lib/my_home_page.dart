import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, 'new_route');
              },
            ),
            FlatButton(
              child: Text('pass the value through the route'),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, 'pass_value_route');
              },
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text('counter route'),
              textColor: Colors.pink,
              onPressed: () {
                Navigator.pushNamed(context, 'counter_route');
              },
            ),
            FlatButton(
              child: Text('cupertino route'),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, 'cupertino_demo');
              },
            ),
            FlatButton(
              child: Text('tap box route'),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, 'tap_box');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(wordPair.toString())
    );
  }
}