import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';
import 'package:projeto_getx/app/data/model/user_model.dart';
import 'package:projeto_getx/app/data/repository/login_repository.dart';
import 'package:projeto_getx/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();

  final TextEditingController emaiTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();

  GetStorage box = GetStorage('login_firebase');

  @override
  void onReady() {
    ;
    isLogged();
    super.onReady();
  }

  //verificar se esta logado no app
  void isLogged() {
    if (box.hasData('auth')) {
      UserModel user = UserModel(
          id: box.read("auth")["id"],
          email: box.read("auth")["email"],
          name: box.read("auth")["name"],
          url_image: box.read("auth")["url_image"]);

      print(user);

      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void register() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    UserModel user = await repository.createUser(emaiTextController.text,
        passwordTextController.text, nameTextController.text);

    if (user != null) {
      box.write("auth", user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void login() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: true);

    UserModel user = await repository.signIn(
        emaiTextController.text, passwordTextController.text);

    if (user != null) {
      box.write("auth", user);
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void logout() {
    repository.singOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
