import 'package:flutter/material.dart';
import 'material_form.dart';
import 'cupertino_form.dart';

void main() => runApp(const MyApp());

const String _title = 'Form Validation';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const SelectTypeOfForm(),
      routes: <String, Widget Function(BuildContext)>{
        '/material-form': (BuildContext context) => const MaterialForm(),
        '/cupertino-form': (BuildContext context) => const CupertinoForm()
      },
    );
  }
}

class SelectTypeOfForm extends StatelessWidget {
  const SelectTypeOfForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Material Form"),
              onPressed: () {
                Navigator.of(context).pushNamed('/material-form');
              },
            ),
            ElevatedButton(
              child: const Text("Cupertino Form"),
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
