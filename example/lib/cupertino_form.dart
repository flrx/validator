import 'package:flrx_validator/flrx_validator.dart';
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
