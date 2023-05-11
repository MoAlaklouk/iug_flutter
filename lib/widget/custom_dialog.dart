import 'package:flutter/material.dart';

class DialogHelper {
  static showDialogs(
          {String title = 'Confirm',
          String description = '',
          Color backgroundColor = Colors.white,
          TextStyle? titleStyle,
          TextStyle? descriptionStyle,
          Function? confirm,
          required context,
          Widget? cancle}) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '$title',
              style: titleStyle,
            ),
            content: Text(
              description,
              style: descriptionStyle,
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('confirm'),
                onPressed: () {
                  confirm!();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('cancle'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
}
