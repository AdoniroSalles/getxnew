import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projeto_getx/app/data/model/user_model.dart';
import 'package:projeto_getx/app/ui/themes/app_theme.dart';

class HomeController extends GetxController {
  
  final UserModel user = Get.arguments;
  //torna a variavel observavel com obs
  RxString txtThemeButton = "Tema: Escuro".obs;
  GetStorage box = GetStorage('login_firebase');

  @override
  void onInit() {
    txtThemeButton.value = Get.isDarkMode ? "Tema: Claro" : "Tema: Escuro";
    super.onInit();
  }

  void changeTheme() {
    if (Get.isDarkMode) {
      box.write('theme', 'light');
      //atribui o valor com value
      txtThemeButton.value = "Tema: Escuro";
      Get.changeTheme(appThemeData);
    } else {
      box.write('theme', 'dark');
      txtThemeButton.value = "Tema: Claro";
      Get.changeTheme(appThemeDataDark);
    }
  }
}
