import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/helper/helper.dart';
import 'package:iug_app/module/exercises/exercises_screen.dart';
import 'package:iug_app/module/main/main_controller.dart';
import 'package:iug_app/module/register/login_screen.dart';
import 'package:iug_app/widget/custom_widget.dart';
import 'package:iug_app/widget/flotingACButton.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../app/app.dart';
import '../../helper/assets_helper.dart';
import '../../utils/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: flot(),
        body: ChangeNotifierProvider(
          create: (context) => MainController(),
          builder: (context, child) {
            var controller = Provider.of<MainController>(context);

            return Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              AssetsHelper.background,
                            ),
                            opacity: 0.8,
                            fit: BoxFit.cover))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            'workOut',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () async {
                                await Application.sharedPreferences
                                    .setBool('login', false);
                                Helper.naviagtTofinish(context, LoginScreen());
                              },
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: List.generate(
                              controller.image.length,
                              (index) => listViewItem(
                                  context: context, index: index))),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget listViewItem({required context, required index}) {
    Utils.exerciseIndex = 0;
    var controller = Provider.of<MainController>(context);
    return InkWell(
      onTap: () {
        Map data = {
          'urlImage': controller.image[index],
          'text': controller.text[index]
        };
        Helper.naviagtTo(
            context,
            ExercisesScreen(
              data: data,
            ));
      },
      child: CachedNetworkImage(
        imageUrl: controller.image[index],
        // imageUrl: '',
        imageBuilder: (context, imageProvider) => Container(
          height: 140.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(
                12.r,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              controller.text[index],
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        placeholder: (context, url) => SizedBox(
          height: 140.h,
          width: double.infinity,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            enabled: true,
            child: Container(
              height: 140.h,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(
                    12.r,
                  )),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: 140.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(
                12.r,
              )),
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}

flot() => FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () {
        showBottomSheet(
            context: Application.navigatorKey.currentContext!,
            builder: (context) => Container(
                  color: Colors.black.withOpacity(.8),
                  height: .6.sh,
                  padding: EdgeInsets.all(16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Exercise name'),
                        SizedBox(
                          height: 15.h,
                        ),
                        MyTextField(hint: 'name')
                      ],
                    ),
                  ),
                ));
      },
    );
