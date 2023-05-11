import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_app/module/main/main_screen.dart';

import '../../../helper/assets_helper.dart';
import '../../../helper/helper.dart';
import '../../../helper/sound_helper.dart';

class FinishExercisesScreen extends StatefulWidget {
  const FinishExercisesScreen({super.key});

  @override
  State<FinishExercisesScreen> createState() => _FinishExercisesScreenState();
}

class _FinishExercisesScreenState extends State<FinishExercisesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetsHelper.background),
                  opacity: .2,
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 0.5.sh,
                width: double.infinity,
                child: Text(
                  'congratulations',
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsetsDirectional.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: TextButton(
                    onPressed: () {
                      Helper.naviagtTofinish(context, MainScreen());
                    },
                    child: Text(
                      'Back to Home',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
