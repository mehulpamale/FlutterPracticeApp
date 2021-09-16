import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: Row(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp2())),
              child: Text('next activity'),
            )
          ],
        ));
  }
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MyApp'),
        ),
        body: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('prev activity'),
        ));
  }
}
