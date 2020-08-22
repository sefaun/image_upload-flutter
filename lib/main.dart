import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resim Upload',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Resim Upload'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File resim;
  var tempresim;

  Future resimkaydet() async {
    // ignore: deprecated_member_use
    tempresim = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      resim = tempresim;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: resim == null ? Text("Resim Seç") : resimAlindi(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resimkaydet,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget resimAlindi() {
    return Container(
      child: Column(
        children: [
          Image.file(
            resim,
            height: 300,
            width: 300,
          ),
          RaisedButton(
              elevation: 7,
              textColor: Colors.white,
              color: Colors.deepPurple,
              child: Text("Resimi Yükle"),
              onPressed: () async {
                print(resim);
                print(tempresim);
              })
        ],
      ),
    );
  }
}
