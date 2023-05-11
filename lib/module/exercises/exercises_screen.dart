
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/module/exercises/tracking_exercises/tracking_screen.dart';
import 'package:iug_app/widget/empty_widget.dart';
import 'package:provider/provider.dart';
import '../../helper/assets_helper.dart';
import '../../helper/helper.dart';
import '../../helper/sound_helper.dart';
import 'exercises_controller.dart';

class ExercisesScreen extends StatelessWidget {
  ExercisesScreen({super.key, required this.data});
  Map data = {};

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: ChangeNotifierProvider(
        lazy: true,
        create: (context) => ExercisesController(),
        builder: (context, child) {
          var controller = Provider.of<ExercisesController>(context);
          return controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : controller.listOFExercises!.isEmpty
                  ? EmptyScreen()
                  : Stack(
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
                                titlePadding: EdgeInsets.symmetric(
                                    horizontal: 48.w, vertical: 16.w),
                                title: Text(
                                  data['text'],
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    childCount:
                                        controller.listOFExercises!.length,
                                    (context, index) =>
                                        listItem(index, controller))),
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
                                Helper.naviagtTo(context, TrackingScreen());
                                SoundHelper.playAudio(
                                    AssetsHelper.whistleSound);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'start',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  )
                                ],
                              )),
                        ),
                      ],
                    );
        },
      ),
    );
  }

  Widget listItem(index, controller) => Column(
        children: [
          Container(
            child: Row(children: [
              Expanded(
                  child: Text(
                '$index',
                textAlign: TextAlign.center,
              )),
              Expanded(
                  child: Image(
                image: AssetImage(controller.listOFExercises[index].imgae),
                height: 100,
              )),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.listOFExercises[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      controller.listOFExercises[index].isTimer
                          ? Text(
                              '00:${controller.listOFExercises[index].timer}')
                          : Text(
                              'X ${controller.listOFExercises[index].steps}'),
                    ],
                  )),
            ]),
          ),
          Divider()
        ],
      );
}
