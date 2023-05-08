import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../helper/assets_helper.dart';
import '../../../helper/sound_helper.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_dialog.dart';
import '../../../widget/custom_widget.dart';

class TrackingScreen extends StatefulWidget {
  TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  void initState() {
    // SoundHelper.flutterTts(
    //     textToSpeak:
    //         '${Get.find<ExercisesController>().listOFExercises[Utils.exerciseIndex].name}');
    // SoundHelper.playAudio(AssetsHelper.whistleSound);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    SoundHelper.flutterTts(textToSpeak: 'rest');

                    // await Get.offNamed(Routes.brakRoute);
                    // controller.preExercises();
                  }
                  print(Utils.exerciseIndex);
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
              onPressed: () {},
              // Utils.exerciseIndex == controller.listOFExercises.length - 1
              //     ? () {
              //         Get.offNamed(Routes.finishExercisesRoute);
              //       }
              //     : () async {
              //         SoundHelper.playAudio(AssetsHelper.ringSound);
              //         SoundHelper.flutterTts(
              //             textToSpeak: '${L10n.getString().breakTime}');

              //         await Get.offNamed(Routes.brakRoute);
              //         controller.nextExercises();
              //         print(Utils.exerciseIndex);
              //       },
            ),
          ),
        ],
      ),
      appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                DialogHelper.showDialog(
                  description: 'Do you want to go back to Home Screen?',
                  confirm: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                      onPressed: () {
                        // Get.offAllNamed(Routes.mainRoute);
                      },
                      child: Text(
                        'Yas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  cancle: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16)),
                    child: TextButton(
                        onPressed: () {
                          Get.close(1);
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                );
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
              // controller.listOFExercises[Utils.exerciseIndex].name,
              '',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            // controller.listOFExercises[Utils.exerciseIndex].isTimer
            // ? Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Helper.timerHelper(
            //           controller: controller.countDownController,
            //           duration: controller
            //               .listOFExercises[Utils.exerciseIndex].timer,
            //           onComplete: () async {
            //             if (controller.listOFExercises.length !=
            //                 Utils.exerciseIndex) {
            //               controller.countDownController!.pause();
            //               SoundHelper.playAudio(AssetsHelper.ringSound);
            //               SoundHelper.flutterTts(
            //                   textToSpeak: L10n.getString().breakTime);

            //               await Get.offNamed(Routes.brakRoute);
            //               controller.nextExercises();
            //             } else {
            //               Get.offNamed(Routes.finishExercisesRoute);
            //             }

            //           }),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Container(
            //         height: 50.h,
            //         width: 0.7.sw,
            //         alignment: AlignmentDirectional.center,
            //         margin: EdgeInsetsDirectional.all(15),
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16),
            //             color: Colors.blueGrey),
            //         child: TextButton(
            //             onPressed: () {
            //               if (controller.countIsStart) {
            //                 controller.countDownController!.pause();
            //                 controller.changecountIsStart(false);
            //               } else {
            //                 controller.countDownController!.resume();
            //                 controller.changecountIsStart(true);
            //               }
            //             },
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   controller.countIsStart
            //                       ? L10n.getString().pause
            //                       : L10n.getString().start,
            //                   style: TextStyle(
            //                       color: Colors.white, fontSize: 22),
            //                 ),
            //                 Icon(
            //                   controller.countIsStart
            //                       ? Icons.pause
            //                       : Icons.play_arrow,
            //                   color: Colors.white,
            //                 )
            //               ],
            //             )),
            //       ),
            //     ],
            //   )
            // :
            Container(
              height: .3.sh,
              alignment: AlignmentDirectional.center,
              child: Text(
                // 'X ${controller.listOFExercises[Utils.exerciseIndex].steps}',
                'X',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
