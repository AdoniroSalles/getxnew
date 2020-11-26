import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_getx/app/controller/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut< HomeController>(() => HomeController());
  }
}