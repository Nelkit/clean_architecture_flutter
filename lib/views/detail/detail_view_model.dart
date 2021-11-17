import 'package:clean_architecture_project/models/models.dart';
import '../../core/api/api_helper.dart';
import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier{
  int likes = 0;

  DetailViewModel(){
    print("DetailViewModel inicializado");
  }

  void onLiked() {
    likes++;
    notifyListeners();
  }
}