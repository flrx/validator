# Validator Examples

## Using FormField

### example/lib/material_form.dart

```dart
import 'package:flrx_validator/rules/email_rule.dart';
import 'package:flrx_validator/rules/required_rule.dart';
import 'package:flrx_validator/flrx_validator';
import 'package:flutter/material.dart';

class MaterialForm extends StatefulWidget {
  MaterialForm({Key key}) : super(key: key);

  @override
  _MaterialFormState createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Material Form Validator')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                validator:
                    Validator().add(RequiredRule()).add(EmailRule()),
                decoration: InputDecoration(hintText: 'Email'),
              ),
              buildDropdown(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: onFormSubmitPressed,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown() {
    return DropdownButtonFormField<String>(
      validator: Validator().add(RequiredRule()),
      value: "",
      items: <DropdownMenuItem<String>>[
        DropdownMenuItem<String>(
          child: Text('Please select an Item'),
          value: "",
        ),
        DropdownMenuItem<String>(
          child: Text('Item 1'),
          value: "Item 1",
        )
      ],
    );
  }

  void onFormSubmitPressed() {
    if (_formKey.currentState.validate()) {
      // Process data.
    }
  }
}
```

## Using TextEditingController

### example/lib/cupertino_form.dart

```dart
import 'package:flrx_validator/rules/email_rule.dart';
import 'package:flrx_validator/rules/required_rule.dart';
import 'package:flrx_validator/flrx_validator';
import 'package:flutter/cupertino.dart';

class CupertinoForm extends StatefulWidget {
  @override
  _CupertinoFormState createState() => _CupertinoFormState();
}

class _CupertinoFormState extends State<CupertinoForm> {
  TextEditingController _textEditingController = TextEditingController();
  String emailValidationMessage = "";

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontFamily: '.SF UI Text',
        inherit: false,
        fontSize: 17.0,
        color: CupertinoColors.black,
      ),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            previousPageTitle: "Form Selection",
            middle: Text('Cupertino Form Validation'),
          ),
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 72),
                  CupertinoTextField(
                    controller: _textEditingController,
                    prefixMode: OverlayVisibilityMode.always,
                    placeholder: 'Email',
                    prefix: Icon(
                      CupertinoIcons.mail_solid,
                      color: CupertinoColors.lightBackgroundGray,
                      size: 28.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.0, color: CupertinoColors.inactiveGray)),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
                    clearButtonMode: OverlayVisibilityMode.editing,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 8, 16, 16),
                    child: Text(
                      emailValidationMessage,
                      style: TextStyle(
                        color: CupertinoColors.destructiveRed,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Center(
                    child: CupertinoButton.filled(
                        child: Text('Submit'), onPressed: onFormSubmitPressed),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void onFormSubmitPressed() {
    String value = _textEditingController.text;
    setState(() {
      emailValidationMessage = Validator<String>()
              .add(RequiredRule())
              .add(EmailRule())
              .validate(value) ??
          '';
    });
  }
}
```
