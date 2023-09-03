import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQRCode extends StatefulWidget {
  const CreateQRCode({Key? key}) : super(key: key);

  @override
  _CreateQRCodeState createState() => _CreateQRCodeState();
}

class _CreateQRCodeState extends State<CreateQRCode> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create QR Code'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                color: Colors.white,
                data: controller.text ?? 'Hello',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(child: buildTextField(context)),
                  const SizedBox(width: 12),
                  FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.done, size: 30),
                    onPressed: () => setState(() {}),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
    controller: controller,
    style: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: 'Enter the data',
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}