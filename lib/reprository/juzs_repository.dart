import 'package:flutter/cupertino.dart';

class simplePorvider extends ChangeNotifier{
  int i=0;

  void changeIndex(){
    i++;
    notifyListeners();
  }

}