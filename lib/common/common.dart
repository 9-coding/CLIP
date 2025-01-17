import 'package:get/get.dart';

class Common extends GetxService {
  static final instance = Common();

  static double get getWidth => Get.width;
  static double get getHeight => Get.height;

  static int mainColor = 0xFF278740; //메인 초록색
  static int mainGray = 0xFF888888; //메인 회색
  static int subGray = 0xFFACB3AE; //서브 흰색
  static int coinColor = 0xFFEDAF35; //코인 색깔
}
