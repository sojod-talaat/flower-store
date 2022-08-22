import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/view/pages/home.dart';

import 'package:flowerstore/view/pages/login.dart';
import 'package:flowerstore/view/pages/nextsplash.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper auth = AuthHelper._();
  static FirebaseAuth authInstance = FirebaseAuth.instance;
  Future<UserCredential?> userSignUP(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  Future<UserCredential?> Signin(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // CustomDialog.showDialogFunction(
        //     'No user found for that email.'); // ignore: avoid_print
        // print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }

  checkUser() {
    User? user = authInstance.currentUser;
    if (user == null) {
      AppRouter.NavigateToWidget(LoginScreen());
      //NavigateTo(router: WelcomeScreen());
    } else {
      AppRouter.NavigateToWidget(MyHomePage2());
    }
  }

  // ignore: non_constant_identifier_names
  Singout() async {
    await authInstance.signOut();
    AppRouter.NavigateToWidget(LoginScreen());
  }
}
