import 'dart:convert';
import 'package:http/http.dart' as http;




class Api{
  final String tokenn= 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcmFpdG90ZWMub3JnXC93dGdcL2FwaVwvbG9naW4iLCJpYXQiOjE2MTYxNzE5OTcsIm5iZiI6MTYxNjE3MTk5NywianRpIjoicjU4azlUOEF5TzYzYlpUayIsInN1YiI6OCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.jk467nFJ1OPuFO-FBD6Uclv8IPB3UKF5Zl0o8Ag7NAs'
      ;

  Future<Map>get(url,[bool token=false])async {
    http.Response response = await http.get(url,headers: {'Content-Type': "application/json; charset=utf-8",
    'Authorization': tokenn
    });
    print(json.decode(response.body));


    return json.decode(response.body);

  }
  dynamic getWithoutHeader(String url) async {
    http.Response response = await http.get(url);
    return response;
  }
  Future<http.Response> post(url, data) async{
    return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':tokenn

      },

      body:json.encode(data),

    );
  }
  Future<http.Response> postWithoutBody(url) async{
    return await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },


    );
  }


}
Api api=Api();