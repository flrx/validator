import 'package:flrx_validator/validator.dart';
import 'package:flutter/material.dart';

class MaterialForm extends StatefulWidget {
  MaterialForm({Key key}) : super(key: key);

  @override
  _MaterialFormState createState() => _MaterialFormState();
}

class _MaterialFormState extends State<MaterialForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                validator: Validator<String>()
                    .add(RequiredRule())
                    .add(EmailRule())
                    .build(),
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                validator: Validator<String>()
                    .add(RequiredRule())
                    .add(AllRule<String>(
                      <Rule<String>>[
                        MinLengthRule(8),
                        RegexRule(
                          r'(?=.*[a-z])',
                          validationMessage:
                              ":entity should contain one lowercase character",
                        ),
                      ],
                    ))
                    .build(),
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
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
      validator: Validator<String>().add(RequiredRule()).build(),
      value: "",
      items: const <DropdownMenuItem<String>>[
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
