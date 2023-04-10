import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

void main() => runApp(MyApp());

// The root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leitor de QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Leitor de QR Code'),
    );
  }
}

// The home page widget of the application
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// The state object for the MyHomePage widget
class _MyHomePageState extends State<MyHomePage> {
  // Method to capture a QR code
  void _captureQR() {
    Future<String> futureString = QRCodeReader().scan();
    futureString.then((qrText) {
      _showDialog(qrText);
    });
  }

  // Method to show a dialog with the scanned QR code text
  void _showDialog(final String qrText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Texto do QR Code"),
          content: Text(qrText),
          actions: <Widget>[
            FlatButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // The build method for the MyHomePage widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Ler QR Code'),
              onPressed: () {
                _captureQR();
              },
            )
          ],
        ),
      ),
    );
  }
}
