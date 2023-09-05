import 'dart:convert';

import 'package:fifth_month/data/models/meaning_model/meaning_model.dart';
import 'package:fifth_month/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import '../models/universal_data.dart';
import 'package:http/http.dart' as http;
class ApiService{
   Future<UniversalData> getDefinition(String word)async{
    Uri uri = Uri.https(baseUrl,"/api/v2/entries/en/$word");
    try{
      http.Response response = await http.get(uri);
      if(response.statusCode==200){
        // debugPrint("MMM: ${response.body}");
        return UniversalData(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => MeaningModel.fromJson(e)).toList()??[]
        );
      }
      return UniversalData(error: "Unknown error");
    }catch(e){
      return UniversalData(error: e.toString());
    }
  }
}