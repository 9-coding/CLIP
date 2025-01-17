import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/backend/UserService/user_service.dart';
import 'package:frontend/pages/mypage/controller/mypagecontroller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class UserService extends GetxService {
  static UserService get instance => Get.find<UserService>();

  String uid = 'null';
  bool isLogin = false;

  Future<UserService> init() async {
    const storage = FlutterSecureStorage();
    uid = await storage.read(key: 'uid') ?? 'null';
    return this;
  }

  Future<int> googleSignIn(String date) async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await account!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user!;

    const storage = FlutterSecureStorage();
    if (await userExistsInDB(user.uid)) {
      await storage.write(key: 'uid', value: user.uid);
      await UserService.instance.init();
      reloadData();
      return 1;
    } else {
      if (await createNewUserDocument(user.uid, date)) {
        await storage.write(key: 'uid', value: user.uid);
        await UserService.instance.init(); // Wait for initialization

        return 2;
      } else {
        return 3;
      }
    }
  }

  void logout() async {
    googleSignOut();
    const storage = FlutterSecureStorage();
    await storage.delete(key: 'uid');
    //await UserService.instance.init();
  }
}

void reloadData() {
  MyPageController.instance.getMyInfo();
}
