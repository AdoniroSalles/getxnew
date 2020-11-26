import 'package:meta/meta.dart';
import 'package:projeto_getx/app/data/model/user_model.dart';
import 'package:projeto_getx/app/data/provider/login_provider.dart';

//Rrepositoy, liga o controller ao provider
class LoginRepository {
  final LoginApiClient apiClient = LoginApiClient();

  //cria usuario
  Future<UserModel> createUser(String email, String password, String name) {
    return apiClient.createUserWithEmailAndPassword(email, password, name);
  }

  //faz o login
  Future<UserModel> signIn(String email, String password) {
    return apiClient.signInWithEmailAndPassword(email, password);
  }

  //faz logout
  singOut() {
    apiClient.signOut();
  }
}
