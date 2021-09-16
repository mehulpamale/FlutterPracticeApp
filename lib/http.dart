// import 'package:Flutter_UI_Components_Library/material/materialConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MaterialApp(home: MySf()));
// }

class MySf extends StatefulWidget {
  @override
  _MySfState createState() => _MySfState();
}

class _MySfState extends State<MySf> {
  var resp = 'getting data';

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(resp),
          CupertinoButton(
              child: Text('hi'),
              onPressed: () => showCupertinoDialog(
                  context: context,
                  builder: (c) => (CupertinoAlertDialog(
                        title: Text('title'),
                        actions: [
                          CupertinoButton(
                              child: Text(('ok')),
                              onPressed: () => Navigator.pop(context))
                        ],
                      )))),
        ],
      ),
    );
  }

  Future fetch() async {
    // setState(() {});
    http.Response response = await http.get(
        // Uri.parse('https://gitlab.com/MehulPamale/api/-/raw/main/info.txt'));
        Uri.parse('https://reqres.in/api/users?page=2'));
    setState(() {
      resp = response.body;
    });
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red),
    home: Scaffold(
      appBar: AppBar(
        title: Text("JSON"),
        centerTitle: true,
      ),
      // body: HomePage(),
      body: MySf(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  Future<List> getPosts() async {
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.toString());

            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    title: Text(item["title"],
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      item["body"],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
