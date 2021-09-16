// import 'package:Flutter_UI_Components_Library/material/materialConstants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ContextMenu()));
  print(list1);
}

final list1 = List.generate(4, (index) => 'Item ${index + 1}');

const List<String> choices = <String>[
  "Item 1",
  "Item 2",
  "Item 3",
];

class ContextMenu extends StatefulWidget {
  @override
  _ContextMenuState createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  String _selectedChoice;
  String _lastSelectedChoice;

  void _select(String choice) {
    setState(() {
      _selectedChoice = choice;
    });
    showSnackBar(choice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Context Menu'),
        elevation: 0,
        centerTitle: false,
        // backgroundColor: kPrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (item) {
              setState(() {
                _selectedChoice = item;
                showSnackBar(_selectedChoice);
              });
            },
            padding: EdgeInsets.zero,
            // initialValue: choices[_selection],
            itemBuilder: (BuildContext context) => choices
                .map((String choice) => PopupMenuItem<String>(
                      value: choice,
                      child: ListTile(
                          leading: Icon(Icons.label), title: Text(choice)),
                    ))
                .toList(),
          )
        ],
      ),
      body: BodyWidget(selection: _selectedChoice),
    );
  }

  void showSnackBar(String choice) {
    final snackBarContent = SnackBar(
      content: Text(
        'Selected: $choice', /*style: kBodyTextStyle*/
      ),
      action: SnackBarAction(
        label: 'Undo',
        // textColor: kSecondaryColor,
        onPressed: () {
          // Some code to undo the change.
          setState(() {
            _selectedChoice = _lastSelectedChoice;
          });
        },
      ),
    );
    _scaffoldkey.currentState.showSnackBar(snackBarContent);
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key key,
    @required String selection,
  })  : _selection = selection,
        super(key: key);

  final String _selection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _selection != null
            ? Center(
                child: Text(
                  "Selected: $_selection", /*style: kBodyTextStyle,*/
                ),
              )
            : Center(
                child: Text(
                  "Welcome to Flutter UI Components Library", /*style: kBodyTextStyle,*/
                ),
              ),
      ],
    );
  }
}
