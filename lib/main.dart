import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_isell_new/controller/main_controller.dart';
import 'package:flutter_isell_new/firebase_options.dart';
import 'package:get/get.dart';

import 'Bindinges/initialbinding.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'sellx_routes.dart';

void main() async {
  debugPrintGestureArenaDiagnostics = false;
  WidgetsFlutterBinding.ensureInitialized();
  await initializServices();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'sellxandroid',
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      // print("completedAppInitialize");
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
