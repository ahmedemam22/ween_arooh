import 'dart:convert';
import 'package:http/http.dart' as http;




class Api{
  final String tokenn= 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvcmFpdG90ZWMub3JnXC93dGdcL2FwaVwvbG9naW4iLCJpYXQiOjE2MTYwNzg1MDMsIm5iZiI6MTYxNjA3ODUwMywianRpIjoiN1d2TnpJYzNCTWs5dEo0dCIsInN1YiI6OCwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.-GlMCMf9PNQSR1A2ucwLIdkQD_lnKqb6Azqr8nAuB0I'
      ;

  Future<Map>get(url,[bool token=false])async {
    http.Response response = await http.get(url,headers: {'Content-Type': "application/json; charset=utf-8",
    if(token)'Authorization': tokenn
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