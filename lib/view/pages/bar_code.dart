import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../controller/network_controller/network_state.dart';
import '../../controller/provider.dart';

class BarCodeExeple extends ConsumerStatefulWidget {
  const BarCodeExeple({super.key});

  @override
  ConsumerState<BarCodeExeple> createState() => _BarCodeExepleState();
}

class _BarCodeExepleState extends ConsumerState<BarCodeExeple> {

  String _scanBarcode = 'Unknown';
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  String result = '';
  @override
  Widget build(BuildContext context) {
    final event = ref.read(networkProvider.notifier);
    NetworkState watch = ref.watch(networkProvider);
    return Scaffold(
        appBar: AppBar(title: const Text('Barcode scan')),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () => scanBarcodeNormal().then((value){
                  event.searchBook(_scanBarcode);
                  print(watch.listOfProduct.first.productName);
                }),
                child: Text('Start barcode scan')),
            30.verticalSpace,
            Expanded(
              child: ListView.builder(
                  itemCount: watch.listOfProduct.length,
                  itemBuilder: (context,index){
                return Text(watch.listOfProduct[index].productName ?? "");
              }),
            )
          ],
        ));
  }
}
