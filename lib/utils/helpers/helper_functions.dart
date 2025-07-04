import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EshopHelperFunctions {
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "yellow":
        return Colors.yellow;
      case "black":
        return Colors.black;
      case "white":
        return Colors.white;
      case "orange":
        return Colors.orange;
      case "purple":
        return Colors.purple;
      case "pink":
        return Colors.pink;
      case "grey":
      case "gray":  // Xử lý cả "grey" và "gray"
        return Colors.grey;
      default:
        return null;  // Nếu không có màu phù hợp, trả về transparent
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'))
            ],
          );
        }
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context, 
        MaterialPageRoute(builder: (_) => screen)
    );
  }

  static truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T> (List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i+rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }

    return wrappedList;
  }

  

}