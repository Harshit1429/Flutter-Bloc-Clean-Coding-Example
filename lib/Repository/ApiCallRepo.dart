import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bstat_examples/Model/ApiCallModel.dart';
import 'package:http/http.dart' as http;
 
class APiCallRepo {
  Future<List<ApiCallModel>> apiList()async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      final body = jsonDecode(response.body) as List;

      if (response.statusCode == 200) {
        return body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return ApiCallModel(
              albumId: map['albumId'] as int,
              id: map['id'] as int,
              title: map['title'] as String,
              thumbnailUrl: map['thumbnailUrl'] as String,
              url: map['url'] as String
          );
        }).toList();
      }
    }
    on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    }
    on TimeoutException {
      throw Exception('');
    }

    throw Exception('error fetching data');
  }
}