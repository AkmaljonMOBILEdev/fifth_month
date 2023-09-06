import 'meaning_model.dart';

class MainModel{
  final String word;
  final List<MeaningModel> meaningModel;
  MainModel({required this.word, required this.meaningModel});
  
  factory MainModel.fromJson(Map<String, dynamic> json){
    return MainModel(
        word: json["word"] ?? "",
        meaningModel: (json["meanings"] as List<dynamic>?)?.map((e) => MeaningModel.fromJson(e)).toList()??[]);
  }
  
}