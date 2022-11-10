import 'dart:convert';
import 'package:movie/api/model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  final String apiUrl =
      "https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json";

  Future<List<Ramen>> fecthDataUsers() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body)["data"];
    // print(listJson);
    // print(listJson.map((e) => Ramen.fromJson(e)).toList().toString());

    return listJson.map((e) => Ramen.fromJson(e)).toList();
  }
}
