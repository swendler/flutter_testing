import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final nameController = TextEditingController();
  final zahlController = TextEditingController();
  var ausgabe = '';

  changeText(){
    setState(() {
      return ausgabe = "Hallo ${nameController.text}, du hast ${zahlController.text} eingegeben";
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    nameController.dispose();
    zahlController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.ac_unit),
          title: Text('This is an AppBar'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name eingeben',
              ),
            ),
            TextField(
              controller: zahlController,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                labelText: 'Zahl eingeben',
              ),
            ),
            Text(ausgabe),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.apps),
          onPressed: (){
            changeText();
          },
        ),
      ),
    );
  }
}
