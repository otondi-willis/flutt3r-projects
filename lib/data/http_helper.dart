import 'package:globo_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=c5369408e82fbbbd0c60f42a7b51b386
  final String authority = 'api.openweathermap.org';
  final String path = '/data/2.5/weather';
  final String apiKey = 'c5369408e82fbbbd0c60f42a7b51b386';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

     return weather;
  }
}
