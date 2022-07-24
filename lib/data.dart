import 'dart:convert';
import 'package:http/http.dart';

Future<dynamic> fetchData() async {
  var url =
      'https://jsonplaceholder.typicode.com/users?fbclid=IwAR3EIEoMxCukGSrpmqsrpzfskrxZuEHzTkAkF3YkiPEfQbpvNost9zePO68';
  final uri = await get(Uri.parse(url));

  if (uri.statusCode == 200) {
    return json.decode(uri.body);
  } else {
    throw Exception('Error');
  }
}

fetchedData() async {
  var fetchedData = await fetchData();
  for (int i = 0; i < 10; i++) {
    return fetchedData[i]["address"]["street"];
  }
}
