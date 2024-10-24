import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bstat_examples/Model/GetApiModel.dart';
import 'package:http/http.dart' as http ;

class GetApiRepo {

  Future<List<GetApiModel>> getApiCall()async{

    try{
      
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments')).timeout(Duration(seconds: 10));
      final body = jsonDecode(response.body) as List;


      if(response.statusCode == 200){

        return body.map((dynamic json){
          final map = json as Map<String , dynamic> ;
          return GetApiModel(
            id: map['id'] as int ,
            body: map['body'] as String ,
            email: map['email'] as String ,
            name: map['name'] as String ,
            postId: map['postId'] as int ,

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

