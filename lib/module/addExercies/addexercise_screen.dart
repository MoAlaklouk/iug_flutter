import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/helper/DB.dart';
import 'package:iug_app/model/TExercises.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:provider/provider.dart';

import '../../helper/assets_helper.dart';
import '../../helper/helper.dart';
import '../../widget/custom_widget.dart';
import '../main/main_controller.dart';

class AddExercisesScreen extends StatelessWidget {
  AddExercisesScreen({super.key});
  final gkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: ChangeNotifierProvider(
          create: (context) => MainController(),
          builder: (context, child) {
            var controller = Provider.of<MainController>(context);
            return Form(
              key: gkey,
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                AssetsHelper.background,
                              ),
                              opacity: 0.8,
                              fit: BoxFit.cover))),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(top: .2.sh),
                    child: Container(
                      padding: EdgeInsets.all(16.w),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Exercise is Timer',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Checkbox(
                                    value: controller.isTimer,
                                    onChanged: (value) {
                                      controller.changeValueIsTimer(value!);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                'Exercise name',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MyTextField(
                                hint: 'name',
                                myController: controller.nameEx,
                                textValidType: TEXT_VALID_TYPE.GENERAL,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Exercise image',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              MyTextField(
                                onTap: () {
                                  controller.pickImage();
                                },
                                textValidType: TEXT_VALID_TYPE.GENERAL,
                                readOnly: true,
                                hint: 'Select image',
                                myController: controller.imageEx,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              controller.isTimer
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Exercise timer',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        MyTextField(
                                          hint: 'timer',
                                          textValidType:
                                              TEXT_VALID_TYPE.GENERAL,
                                          textInputType: TextInputType.number,
                                          myController: controller.timerEx,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Exercise steps',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        MyTextField(
                                          textInputType: TextInputType.number,
                                          textValidType:
                                              TEXT_VALID_TYPE.GENERAL,
                                          hint: 'steps',
                                          myController: controller.stepsEx,
                                        ),
                                      ],
                                    ),
                              GestureDetector(
                                onTap: () {
                                  print(controller.nameEx.text);
                                  print(controller.imageEx.text);
                                  print(controller.stepsEx.text);
                                  print(controller.timerEx.text);
                                  print(controller.isTimer);
                                  if (gkey.currentState!.validate()) {
                                    DbHelper.dbHelper
                                        .insertNewExe(TExercises(
                                            name: controller.nameEx.text,
                                            image: controller.imageEx.text,
                                            isTimer: controller.isTimer ? 0 : 1,
                                            steps: controller.isTimer
                                                ? 0
                                                : int.parse(
                                                    controller.stepsEx.text),
                                            timer: controller.isTimer
                                                ? int.parse(
                                                    controller.timerEx.text)
                                                : 0))
                                        .then((value) {
                                      if (value >= 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(Helper.snackBar(
                                                'Add success', Colors.green));
                                        Helper.naviagtTofinish(
                                            context, MainScreen());
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                                Helper.snackBar('Add failed'));
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50.h,
                                  width: double.infinity,
                                  alignment: AlignmentDirectional.center,
                                  margin: EdgeInsetsDirectional.all(15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Colors.blueGrey),
                                  child: Text(
                                    'Add',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
