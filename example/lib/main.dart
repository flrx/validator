import 'package:flutter/material.dart';
import 'material_form.dart';
import 'cupertino_form.dart';

void main() => runApp(MyApp());

const String _title = 'Form Validation';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: SelectTypeOfForm(),
      routes: {
        '/material-form': (context) => MaterialForm(),
        '/cupertino-form': (context) => CupertinoForm()
      },
    );
  }
}

class SelectTypeOfForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              child: Text("Material Form"),
              onPressed: () {
                Navigator.of(context).pushNamed('/material-form');
              },
            ),
            RaisedButton(
              child: Text("Cupertino Form"),
              onPressed: () {
                Navigator.of(context).pushNamed('/cupertino-form');
              },
            )
          ],
        ),
      ),
    );
  }
}
