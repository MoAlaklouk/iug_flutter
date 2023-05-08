import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/helper/helper.dart';
import 'package:iug_app/module/main/main_screen.dart';
import '../../helper/assets_helper.dart';
import '../../widget/custom_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(actions: []),
        body: SingleChildScrollView(
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
                        style: TextStyle(fontSize: 50, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MyTextField(
                      hint: 'name',
                      iconData: Icons.person,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    MyTextField(
                      hint: 'email',
                      iconData: Icons.email,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Helper.naviagtTofinish(context, MainScreen());
                        // Get.offNamed(Routes.mainRoute);
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
      ),
    );
  }
}
