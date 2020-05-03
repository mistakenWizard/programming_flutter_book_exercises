import 'package:flutter/material.dart';

import 'FancyButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'An app that can count to'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _displayedString;
  bool _reversed = false;
  List<UniqueKey> _buttonKeys = [UniqueKey(), UniqueKey()];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() => _counter--);
  }

  void _resetCounter() {
    setState(() => _counter = 0);
    _swap();
  }

  void _swap() {
    setState(() {
      _reversed = !_reversed;
    });
  }

  @override
  Widget build(BuildContext context) {
    _displayedString = _counter == 0 ? "None" : _counter.toString();
    final incrementButton = FancyButton(
      key: _buttonKeys.first,
      child: Text(
        "Increment",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _incrementCounter,
    );

    final decrementButton = FancyButton(
      key: _buttonKeys.first,
      child: Text(
        "Decrement",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: _decrementCounter,
    );

    List<Widget> _buttons = <Widget>[incrementButton, decrementButton];

    if (_reversed) {
      _buttons = _buttons.reversed.toList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} $_counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'flutter_logo_080.jfif',
              width: 00.0,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _displayedString,
              style: Theme.of(context).textTheme.headline,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Decrement"),
                  onPressed: _decrementCounter,
                ),
                RaisedButton(
                  color: Colors.green,
                  child: Text(
                    "Increment",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _incrementCounter,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Reset',
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Theme.of(context).primaryColorLight,
        onPressed: _resetCounter,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
