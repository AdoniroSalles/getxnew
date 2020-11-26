import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:projeto_getx/app/routes/app_pages.dart';
import 'package:projeto_getx/app/ui/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //incialize firebase
  final firebaseInitialize = await Firebase.initializeApp();
  if (firebaseInitialize == null) {
    print('error');
  } else {
    await GetStorage.init('login_firebase');
    GetStorage box = GetStorage();
    runApp(GetMaterialApp(
      title: 'Loging Firebase',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      darkTheme: appThemeDataDark,
      themeMode: ThemeMode.system,
    ));
  }
}
