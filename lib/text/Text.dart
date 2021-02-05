import 'package:flutter/cupertino.dart';

class Text1 {
  Text1(String name, int age);
}

class Text2 {
  Text2({String name, int age});

  int sum(int a, int b, [int c = 3]) {
    return a + b + c;
  }

  String getString({name: String}) {
    return name;
  }

  test(Function callback) {
    callback("hello");
  }
}
