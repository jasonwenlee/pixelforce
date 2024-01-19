import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pixelforce/models/thumbnail.dart';

Future<List<Thumbnail>?> fetchData(String url) async {
  try {
    // Make the GET request
    final response = await http.get(Uri.parse(url));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> data = json.decode(response.body);
      final List<Thumbnail> thumbnails = data.map((item) {
        return Thumbnail.fromJson(item as Map<String, dynamic>);
      }).toList();

      return thumbnails;
    } else {
      // Handle error, e.g., print an error message
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    // Handle exceptions
    print('Error: $error');
  }
  return null;
}
