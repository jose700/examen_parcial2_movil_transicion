import 'package:http/http.dart' as http;
import 'dart:convert';
  //realizamos una clase y una función para verificar el estado de los datos si estan dando respuest o no
class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else
      print(response.statusCode);
  }
}
