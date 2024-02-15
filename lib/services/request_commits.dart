import 'dart:convert';
import 'package:history_github/models/item.dart';
import 'package:http/http.dart' as http;

class RequestCommits {
  final String url;
  const RequestCommits({required this.url});
  Future<List<Item>> getData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw http.ClientException("Error in the data");
    }
    return List<Item>.from(
        jsonDecode(response.body).map((x) => Item.fromJson(x)));
  }
}
