import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scan_and_generate_qr_code/features/generateQRcode/generate_qr_code.dart';
import 'package:scan_and_generate_qr_code/features/scanQRcode/scan_qr_code.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan and Create QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Scan and Generate QR Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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


            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ScanQRCode()));
              },
              style: ElevatedButton.styleFrom(
              primary: Colors.transparent, // Make the button transparent
              onPrimary: Colors.white,
              padding: const EdgeInsets.all(10.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Optional: Add rounded corners
                ),
                padding: const EdgeInsets.all(10.0),
              child: const Text('Scan QR Code', style: TextStyle(fontSize: 20)),
            ),
        ),

            const SizedBox(height: 15),


            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CreateQRCode()));
                },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent, // Make the button transparent
                onPrimary: Colors.white,
                padding: const EdgeInsets.all(10.0),
                ),
              child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10.0), // Optional: Add rounded corners
                  ),
                  padding: const EdgeInsets.all(10.0),
                child: const Text('Generate QR Code', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
