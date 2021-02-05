// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterdemo/main.dart';

import 'file:///F:/flutters/flutterdemo/lib/text/Text.dart';

void main() {

  Text2 text2 = new Text2();

  var res =text2.sum(3, 4);
  print("=====res:$res");

  print(text2.getString(name: "hello world"));


  text2.test((param){
    print("res callback ==$param");
  });

}
