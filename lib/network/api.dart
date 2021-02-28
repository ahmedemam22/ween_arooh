import 'dart:convert';
import 'package:http/http.dart' as http;




class Api{

  Future<Map>get(url,[bool token=false])async {
    http.Response response = await http.get(url,headers: {'Content-Type': "application/json; charset=utf-8",
    if(token)'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcmFpdG90ZWMub3JnXC93dGdcL2FwaVwvdmVyaWZ5IiwiaWF0IjoxNjEzOTA3MDc4LCJleHAiOjE2MTM5MTA2NzgsIm5iZiI6MTYxMzkwNzA3OCwianRpIjoiS3VFVFQxM096ZW9SaTF6dyIsInN1YiI6NSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.wSrwYZZbRYVfayqXlwR_z2-jY8oEDQ982_9WQOPm4WA'
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