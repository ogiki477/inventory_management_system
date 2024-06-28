import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';

class Utils {
  static open_db() async {
    var db = await openDatabase('learn_flutter.db');
    return db;
  }

  static toast(String msg, {bool sucess = true}) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM_LEFT,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      backgroundColor: sucess ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 20.0,
    );
  }
}
