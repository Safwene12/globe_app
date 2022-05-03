import 'package:globe_app/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HttpHelper{
//https://api.openweathermap.org/data/2.5/weather?q=London&appid=
 final String authority ='api.openweathermap.org';
 final String path='data/2.5/weather';
 final String apiKey ='33ec15c9e19f892f282b8f261400b875';

 Future<Weather> getWeather(String location) async{
   Map<String, dynamic> parameters={'q':location,'appid':apiKey};
   Uri uri = Uri.https(authority, path,parameters);
   http.Response result= await http.get(uri);
   Map<String,dynamic> data =json.decode(result.body);
   Weather weather = Weather.fromJSON(data);
   return weather;
 }
}