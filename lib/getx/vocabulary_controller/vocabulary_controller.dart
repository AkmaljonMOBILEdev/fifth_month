import 'package:fifth_month/data/models/meaning_model/main_model.dart';
import 'package:fifth_month/data/models/universal_data.dart';
import 'package:fifth_month/data/network/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/meaning_model/meaning_model.dart';

class VocabularyController extends GetxController{
  final ApiService apiService;
  VocabularyController({required this.apiService});

  var isLoading = false.obs;
  RxList<MainModel> meanings = <MainModel>[].obs;
  // Rx<MeaningModel> theModel = MeaningModel(partOfSpeech: "", definitions: [], synonyms: [], antonyms: []).obs;
  Rx<String> errorText = "".obs;


  getMeaningOfWord(String word)async{
    isLoading.value = true;
    List<MainModel> loadedWord = await apiService.getDefinition(word);
    isLoading.value = false;
    if(loadedWord.isNotEmpty){
      // debugPrint("AAA: $loadedWord");
      meanings.value = loadedWord;
      // debugPrint("AAA: ${meanings.first.partOfSpeech}");

    }else{
      Get.snackbar("Dictionary", "$word is not found!");
    }

  }

}