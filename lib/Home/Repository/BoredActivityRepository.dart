import 'package:bloc_with_api/Home/Model/BoredActivity.dart';
import 'package:dio/dio.dart';

class ActivityRepository {
  getActivities() async {
    String url = "https://www.boredapi.com/api/activity";
    Dio _dio = Dio();
    var resposne = await _dio.get(url);
    print('object');
    var data = resposne.data;
    BoredActivity activity = BoredActivity.fromJson(data);
    print(activity.accessibility);
    return activity;
  }
}
