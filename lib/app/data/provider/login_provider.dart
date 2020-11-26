import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:projeto_getx/app/data/model/user_model.dart';

class LoginApiClient {
  FirebaseAuth _auth = FirebaseAuth.instance;

  GetStorage box = GetStorage('login_firebase');

  //Retorna usuario logado
  Stream<UserModel> get authStateChanged => _auth
      .authStateChanges()
      .map((User currentUser) => UserModel.fromSnapShot(currentUser));

  //Criar usuario
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final currentUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      var usuario = currentUser.user;
      //autalizando o nome do usuário
      usuario.updateProfile(
        displayName: name,
      );
      usuario.reload();

      return UserModel.fromSnapShot(usuario);
    } catch (e) {
      print(e.code);
      switch (e.code) {
        case "email-already-in-use":
          Get.snackbar("E-mail existente",
              "Este e-mail já esta sendo usado por outro usuário");
          break;
        case "invalid-email":
          Get.snackbar("E-mail inválido", "Verifque o e-mail");
          break;
        case "operation-not-allowed":
          Get.snackbar("Operação não permitida",
              "E-mail ou senha não estão autorizados");
          break;
        case "weak-password":
          Get.snackbar("Senha fraca",
              "Senha muito fraca, mude para uma senha mais forte");
          break;
        default:
      }
    }
  }

  //Fazer login
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      var usuario = currentUser.user;

      return UserModel.fromSnapShot(usuario);
    } catch (e) {
      print(e.code);
      Get.back();
      switch (e.code) {
        case "invalid-email":
          Get.snackbar("E-mail Inválido", "Verifique se o e-mail está correto");
          break;
        case "user-not-found":
          Get.snackbar(
              'Usuário incorreto !', 'verifique se o e-mail esta correto.');
          break;
        case "user-disabled":
          Get.snackbar("Usuário foi removido",
              "este usuário nao se encontra na nossa base de dados");
          break;
        case "wrong-password":
          Get.snackbar('Senha Incorreta', 'verifque sua senha');
          break;
        default:
      }
    }
  }

  //Fazer logoff
  signOut() {
    box.write("auth", null);
    // ou
    // box.erase();
    return _auth.signOut();
  }
}
