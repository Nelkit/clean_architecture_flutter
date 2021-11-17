import 'package:clean_architecture_project/core/api/api_helper.dart';
import 'package:clean_architecture_project/models/models.dart';

class HomeRepository {
  final _apiHelper = ApiHelper();

  Future<NowPlayingResponse> getMovies() async {
    final jsonData = await  _apiHelper.getRequest('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    return nowPlayingResponse;
  }

}