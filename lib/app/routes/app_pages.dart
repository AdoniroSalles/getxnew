import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'package:projeto_getx/app/bindings/home_binding.dart';
import 'package:projeto_getx/app/bindings/login_binding.dart';

import 'package:projeto_getx/app/ui/android/home_page.dart';
import 'package:projeto_getx/app/ui/android/inital_pages.dart';
import 'package:projeto_getx/app/ui/android/login_page.dart';
import 'package:projeto_getx/app/ui/android/register_page.dart';

part 'app_routes.dart';


class AppPages {

  static final  routes = [

    GetPage( name: Routes.INITIAL, page: () => InitalPage() ),
    GetPage( name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage( name: Routes.HOME, page: () => HomePage(), binding: HomeBinding() ),
    GetPage( name: Routes.CADASTRO, page: () => RegisterPage()),

  ];
}