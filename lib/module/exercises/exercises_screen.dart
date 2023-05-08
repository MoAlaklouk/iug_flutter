import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../helper/assets_helper.dart';
import '../../helper/helper.dart';
import '../../helper/sound_helper.dart';

class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({
    super.key,
  });
  Map data = Get.arguments;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 150.h,
                pinned: true,
                backgroundColor: Colors.grey[700],
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: data['urlImage'],
                    fit: BoxFit.cover,
                  ),
                  titlePadding:
                      EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.w),
                  title: Text(
                    data['text'],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              // SliverList(
              //     delegate: SliverChildBuilderDelegate(
              //         // childCount: controller.listOFExercises.length,
              //         childCount: 2,
              //         (context, index) => listItem(index))),
            ],
          ),
          Container(
            height: 50.h,
            width: double.infinity,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueGrey),
            child: TextButton(
                onPressed: () {
                  // Get.offAllNamed(Routes.trackingRoute);
                  SoundHelper.playAudio(AssetsHelper.whistleSound);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'start',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

//   Widget listItem(index) => Column(
//         children: [
//           Container(
//             child: Row(children: [
//               Expanded(
//                   child: Text(
//                 '$index',
//                 textAlign: TextAlign.center,
//               )),
//               Expanded(
//                   child: Image(
//                 image: AssetImage(controller.listOFExercises[index].imgae),
//                 height: 100,
//               )),
//               Expanded(
//                   flex: 4,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         controller.listOFExercises[index].name,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       controller.listOFExercises[index].isTimer
//                           ? Text(
//                               '00:${controller.listOFExercises[index].timer}')
//                           : Text(
//                               'X ${controller.listOFExercises[index].steps}'),
//                     ],
//                   )),
//             ]),
//           ),
//           Divider()
//         ],
//       );
}
