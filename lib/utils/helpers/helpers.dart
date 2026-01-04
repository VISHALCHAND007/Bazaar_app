import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  Helpers._();

  static void showAlert({required String title, required String msg}) {
    showDialog(
      context: Get.context!,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  static String truncateText(String text, int maxLength) {
    if(text.length <= maxLength) {
      return text;
    } else {
      return "${text.substring(0, maxLength-1)}...";
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for(var i= 0; i<widgets.length; i++) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length: i+ rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
