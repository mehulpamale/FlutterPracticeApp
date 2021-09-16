// import 'package:Flutter_UI_Components_Library/material/materialConstants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MySf()));
  print(list1);
}

final list1 = List.generate(4, (index) => 'Item $index');

class MySf extends StatefulWidget {
  @override
  _MySfState createState() => _MySfState();
}

class _MySfState extends State<MySf> {
  var _item = 'hi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Context Menu'),
          actions: [
            PopupMenuButton(
                onSelected: (choice) => setState(() => _item = choice),
                itemBuilder: (c) => list1
                    .map((e) => PopupMenuItem(value: e, child: Text(e)))
                    .toList())
          ],
        ),
        body: Center(child: Text(_item)));
    ;
  }
}
