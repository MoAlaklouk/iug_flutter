import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/helper/helper.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:iug_app/module/register/register_controller.dart';
import 'package:provider/provider.dart';
import '../../helper/assets_helper.dart';
import '../../widget/custom_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final gkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(actions: []),
        body: ChangeNotifierProvider(
          lazy: true,
          create: (context) => AuthConteroller(),
          builder: (context, child) {
            var controller = Provider.of<AuthConteroller>(context);
            return SingleChildScrollView(
              child: Form(
                key: gkey,
                child: Stack(
                  children: [
                    Container(
                      height: 1.sh,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AssetsHelper.background,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 200.h,
                            alignment: Alignment.center,
                            child: const Text(
                              'Sport App',
                              style:
                                  TextStyle(fontSize: 50, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextField(
                            hint: 'email',
                            myController:
                                controller.regEmailTextEditingController,
                            iconData: Icons.email,
                            textValidType: TEXT_VALID_TYPE.EMAIL,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextField(
                            hint: 'password',
                            myController:
                                controller.regpasswordTextEditingController,
                            iconData: Icons.lock,
                            isPassword: true,
                            textValidType: TEXT_VALID_TYPE.PASSWORD,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextField(
                            hint: 'confirm password',
                            myController:
                                controller.regConPasswordTextEditingController,
                            iconData: Icons.lock,
                            isPassword: true,
                            textValidType: TEXT_VALID_TYPE.PASSWORD,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (gkey.currentState!.validate()) {
                                if (controller.regpasswordTextEditingController
                                        .text ==
                                    controller
                                        .regConPasswordTextEditingController
                                        .text) {
                                  controller.registNewAccount(
                                      emailAddress: (controller
                                          .regEmailTextEditingController.text),
                                      password: (controller
                                          .regpasswordTextEditingController
                                          .text),
                                      context: context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      Helper.snackBar(
                                          'the password not match'));
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text('Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
