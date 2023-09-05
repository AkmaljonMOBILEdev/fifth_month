import 'package:fifth_month/data/models/universal_data.dart';
import 'package:fifth_month/data/network/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/meaning_model/meaning_model.dart';

class VocabularyController extends GetxController{
  final ApiService apiService;
  VocabularyController({required this.apiService});

  var isLoading = false.obs;
  RxList<MeaningModel> meanings = <MeaningModel>[].obs;
  Rx<MeaningModel> theModel = MeaningModel(partOfSpeech: "", definitions: [], synonyms: [], antonyms: []).obs;
  Rx<String> errorText = "".obs;


  getMeaningOfWord(String word)async{
    isLoading.value = true;
    UniversalData data = await  apiService.getDefinition(word);
    debugPrint("GETX 1: ${data.data}");
    isLoading.value = false;

    if(data.error.isEmpty){
      debugPrint("GETX 2: ${data.data}");
      if(data.data is List){
        meanings.value = data.data;
      }else{
        theModel = data.data[0];
      }
      debugPrint("REAL IS: ${meanings}");
    }else{
      debugPrint("GETX ERROR: ${data.data[0]}");
      errorText.value = data.error;
    }
  }

}