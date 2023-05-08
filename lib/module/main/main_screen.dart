import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../helper/assets_helper.dart';
import '../../utils/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: List.generate(
                          4,
                          (index) =>
                              listViewItem(context: context, index: index))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewItem({required context, required index}) {
    Utils.exerciseIndex = 0;
    return InkWell(
      onTap: () {
        // Map data = {
        //   'urlImage': MainController.image[index],
        //   'text': MainController.text[index]
        // };
        // Get.toNamed(Routes.exercisesRoute, arguments: data);
      },
      child: CachedNetworkImage(
        // imageUrl: MainController.image[index],
        imageUrl: '',
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
              // MainController.text[index],
              '',
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
              height: 150.h,
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
