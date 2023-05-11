import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iug_app/app/app.dart';
import 'package:iug_app/module/main/main_screen.dart';

import '../../helper/helper.dart';

class AuthConteroller extends ChangeNotifier {
  TextEditingController regpasswordTextEditingController =
      TextEditingController();
  TextEditingController regEmailTextEditingController = TextEditingController();
  TextEditingController regConPasswordTextEditingController =
      TextEditingController();
  TextEditingController logPasswordTextEditingController =
      TextEditingController();
  TextEditingController logEmailTextEditingController = TextEditingController();

  Future registNewAccount(
      {String emailAddress = '', String password = '', context}) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(Helper.snackBar('Rigester success', Colors.green));
      await Application.sharedPreferences.setBool('login', true);
      Helper.naviagtTofinish(context, MainScreen());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Helper.snackBar(
        '${e.message}',
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Helper.snackBar(
        '${e.toString()}',
      ));
    }
  }

  login({String emailAddress = '', String password = '', context}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(Helper.snackBar('login success', Colors.green));
      await Application.sharedPreferences.setBool('login', true);
      Helper.naviagtTofinish(context, MainScreen());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(Helper.snackBar(
        '${e.message}',
      ));
    }
  }
}
