import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_widget.dart';
import 'infostructure/local_store.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp();

 await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
   DeviceOrientation.portraitUp
  ]).then((value){
    runApp( const ProviderScope(child: AppWidget()));
  });
}