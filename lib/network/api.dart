import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ween_arooh/utils/glopal_app.dart';




class Api{
   String tokenn= 'Bearer ${GlopalApp.token}';


  Future<Map>get(url,[token])async {

    if(token!=null)tokenn='Bearer ${token}';
    print(tokenn);
    print('sssss');
    http.Response response = await http.get(url,headers: {'Content-Type': "application/json; charset=utf-8",
    'Authorization': tokenn
    });



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