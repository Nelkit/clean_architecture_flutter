import 'package:clean_architecture_project/core/api/api_response.dart';
import 'package:clean_architecture_project/models/models.dart';
import 'package:clean_architecture_project/views/home/home_repository.dart';
import '../../core/api/api_helper.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  HomeViewModel(){
    print("Movies provider initialized");

    getMovies();
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Future<void> getMovies() async {
    try {
      NowPlayingResponse response = await HomeRepository().getMovies();
      _apiResponse = ApiResponse.completed(response.results);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}