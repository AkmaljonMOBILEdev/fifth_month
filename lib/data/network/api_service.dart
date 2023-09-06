import 'dart:convert';
import 'package:fifth_month/data/models/meaning_model/main_model.dart';
import 'package:fifth_month/data/models/meaning_model/meaning_model.dart';
import 'package:fifth_month/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class ApiService{
   Future<List<MainModel>> getDefinition(String word)async{
    Uri uri = Uri.https(baseUrl,"/api/v2/entries/en/$word");
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode==200){
        // debugPrint("MMM: ${response.body}");
        return (jsonDecode(response.body) as List?)
            ?.map((e) => MainModel.fromJson(e)).toList()??[];
      }
      return [];
    }catch(e){
      return [];
    }
  }
}