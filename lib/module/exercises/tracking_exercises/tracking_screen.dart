import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/app/app.dart';
import 'package:iug_app/helper/helper.dart';
import 'package:iug_app/module/exercises/break/break_screen.dart';
import 'package:iug_app/module/exercises/finishExercises/finishExercises_screen.dart';
import 'package:iug_app/module/main/main_screen.dart';
import 'package:provider/provider.dart';

import '../../../helper/assets_helper.dart';
import '../../../helper/sound_helper.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_dialog.dart';
import '../../../widget/custom_widget.dart';
import '../exercises_controller.dart';

class TrackingScreen extends StatefulWidget {
  TrackingScreen({
    super.key,
  });
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  void initState() {
    SoundHelper.playAudio(AssetsHelper.whistleSound);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
                        lazy:true,

      create: (context) => ExercisesController(),
      builder: (context, child) {
        var controller = Provider.of<ExercisesController>(context);
        return Scaffold(
          bottomSheet: Row(
            children: [
              Expanded(
                child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.skip_previous),
                        Text('previous'),
                      ],
                    ),
                    onPressed: () async {
                      if (Utils.exerciseIndex != 0) {
                        SoundHelper.playAudio(AssetsHelper.ringSound);
                        Helper.naviagtTo(context, BreakScreen());

                        controller.preExercises();
                      }
                    }),
              ),
              Expanded(
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.skip_next),
                      Text('skip'),
                    ],
                  ),
                  onPressed: Utils.exerciseIndex ==
                          controller.listOFExercises!.length - 1
                      ? () {
                          Helper.naviagtTofinish(
                              context, FinishExercisesScreen());
                        }
                      : () async {
                          SoundHelper.playAudio(AssetsHelper.ringSound);
                          Helper.naviagtTo(context, BreakScreen());
                          controller.nextExercises();

                          print(Utils.exerciseIndex);
                        },
                ),
              ),
            ],
          ),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 0.4.sh,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      AssetsHelper.man,
                    ),
                  )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  controller.listOFExercises![Utils.exerciseIndex].name!,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                controller.listOFExercises![Utils.exerciseIndex].isTimer!
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Helper.timerHelper(
                              controller: controller.countDownController,
                              duration: controller
                                  .listOFExercises![Utils.exerciseIndex].timer!,
                              onComplete: () async {
                                if (controller.listOFExercises!.length !=
                                    Utils.exerciseIndex) {
                                  controller.countDownController!.pause();
                                  SoundHelper.playAudio(AssetsHelper.ringSound);

                                  await Helper.naviagtTofinish(
                                      context, BreakScreen());
                                  controller.nextExercises();
                                } else {
                                  await Helper.naviagtTofinish(
                                      context, FinishExercisesScreen());
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50.h,
                            width: 0.7.sw,
                            alignment: AlignmentDirectional.center,
                            margin: EdgeInsetsDirectional.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.blueGrey),
                            child: TextButton(
                                onPressed: () {
                                  if (controller.countIsStart) {
                                    controller.countDownController!.pause();
                                    controller.changecountIsStart(false);
                                  } else {
                                    controller.countDownController!.resume();
                                    controller.changecountIsStart(true);
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.countIsStart
                                          ? 'pause'
                                          : 'start',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    Icon(
                                      controller.countIsStart
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                        ],
                      )
                    : Container(
                        height: .3.sh,
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'X ${controller.listOFExercises![Utils.exerciseIndex].steps}',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w600),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
