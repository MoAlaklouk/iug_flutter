import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/module/exercises/tracking_exercises/tracking_screen.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:provider/provider.dart';

import '../../../helper/assets_helper.dart';
import '../../../helper/helper.dart';
import '../../../widget/custom_dialog.dart';
import '../../../widget/custom_widget.dart';
import '../exercises_controller.dart';

class BreakScreen extends StatelessWidget {
  BreakScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
            leading: IconButton(
                onPressed: () {
                  DialogHelper.showDialogs(
                      context: context,
                      description: 'Do you want to go back to Home Screen?',
                      confirm: () {
                        Helper.naviagtTofinish(context, MainScreen());
                      });
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ))),
        backgroundColor: Colors.blue[100],
        body: ChangeNotifierProvider(
          lazy: true,
          create: (context) => ExercisesController(),
          builder: (context, child) {
            var controller = Provider.of<ExercisesController>(context);
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'rest',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Helper.timerHelper(
                          controller: controller.countDownController2,
                          duration: controller.timeDuration,
                          onComplete: () {
                            Helper.naviagtTofinish(context, TrackingScreen());
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 35.h,
                            width: 60.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: TextButton(
                                onPressed: () {
                                  Helper.naviagtTofinish(
                                      context, TrackingScreen());
                                },
                                child: Text(
                                  'skip',
                                  style: TextStyle(color: Colors.blue),
                                )),
                          ),
                          Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(16)),
                            child: TextButton(
                                onPressed: () {
                                  controller.countDownController2!
                                      .restart(duration: 20);
                                },
                                child: Text(
                                  'reset 20s',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(15),
                            topStart: Radius.circular(15))),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsetsDirectional.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Text(
                              'next',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Expanded(
                              child: Image(
                            image: AssetImage(AssetsHelper.man),
                          )),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
