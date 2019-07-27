import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = "Form Validation Demo";
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter UserName";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Enter UserName"
            ),
          ),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter Password";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: RaisedButton(
              child: Text("Submit"),
              onPressed: (){
                if(_formKey.currentState.validate()){
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing Data"),));
                }

              },
            ),
          )
        ],
      ),
    );
  }
}
