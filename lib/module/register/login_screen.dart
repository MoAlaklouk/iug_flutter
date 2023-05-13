import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/helper/helper.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:iug_app/module/register/register_controller.dart';
import 'package:iug_app/module/register/register_screen.dart';
import 'package:provider/provider.dart';
import '../../helper/assets_helper.dart';
import '../../widget/custom_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
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
                      padding: EdgeInsets.only(
                          right: 16.0.w, left: 16.0.w, top: .1.sh),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sport App',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),
                          SizedBox(
                            height: 120.h,
                          ),
                          MyTextField(
                            textValidType: TEXT_VALID_TYPE.EMAIL,
                            hint: 'email',
                            iconData: Icons.email,
                            myController:
                                controller.logEmailTextEditingController,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextField(
                            textValidType: TEXT_VALID_TYPE.PASSWORD,
                            myController:
                                controller.logPasswordTextEditingController,
                            hint: 'password',
                            isPassword: true,
                            iconData: Icons.lock,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Helper.naviagtTo(context, RegisterScreen()),
                            child: const Text(
                              'Register now!',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (gkey.currentState!.validate()) {
                                controller.login(
                                    emailAddress: controller
                                        .logEmailTextEditingController.text,
                                    password: controller
                                        .logPasswordTextEditingController.text,
                                    context: context);
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
                              child: Text('Login',
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
