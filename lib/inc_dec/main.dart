import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'myapp',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'),
            ElevatedButton(child: (Text('inc')), onPressed: _increment),
            ElevatedButton(child: (Text('dec')), onPressed: _decrement)
          ],
        ),
      ),
    );
  }

  var _counter = 0;

  void _increment() {
    _counter++;
    setState(() {});
  }

  void _decrement() {
    _counter--;
    setState(() {});
  }
}
