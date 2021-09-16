import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(title: 'MyApp', home: Home()));

class Home extends StatelessWidget {
  void launchAct1(context) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Act1()));

  void pullDrawer(context) => Scaffold.of(context).openDrawer();

  var drawerItems = List.generate(8, (index) => index, growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyApp'),
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (c) {
            return drawerItems.map((e) {
              return PopupMenuItem<String>(
                  value: e.toString(), child: Text(e.toString()));
            }).toList();
          })
        ],
      ),
      drawer: Drawer(
          child: ListView.builder(
              itemCount: drawerItems.length,
              itemBuilder: (c, i) {
                // print(drawerItems);
                return ListTile(title: Text(drawerItems[i].toString()));
              })),
      floatingActionButton: Builder(
        builder: (context) =>
            FloatingActionButton(onPressed: () => pullDrawer(context)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.greenAccent)),
                child: Text('simple flat button'),
                onPressed: () => showDialog(
                    context: context,
                    builder: (c) => AlertDialog(
                          title: Text('simple dialog'),
                        ))),
            ElevatedButton(
                child: Text(
                  'dialog',
                ),
                onPressed: () {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (c) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('button1')),
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('button2')),
                            ],
                            title: Text('hi'),
                          ));
                }),
            ElevatedButton(
                child: Text(
                  'next screen',
                ),
                onPressed: () => launchAct1(context)),
            Builder(
              builder: (context) => ElevatedButton(
                  child: Text(
                    'pull drawer',
                  ),
                  onPressed: () => pullDrawer(context)),
            ),
          ],
        ),
      ),
    );
  }
}

class Act1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activity1')),
      body: Center(
          child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Text('prev activity'),
      )),
    );
  }
}

class METext extends StatefulWidget {
  @override
  _METextState createState() => _METextState();
}

class _METextState extends State<METext> {
  var menuEntry;

  @override
  Widget build(BuildContext context) {
    return Text('$menuEntry');
  }
}
