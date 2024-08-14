// for json decode
import 'dart:convert';
// for http connection
import 'package:http/http.dart' as http;




void main() async {
  // Observe async and await
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print('Connection failed');
    return;
  }
  final jsonResult = json.decode(response.body) as Map;
  print("Title: ${jsonResult['title']}");
  print("Body: ${jsonResult['body']}");
}
