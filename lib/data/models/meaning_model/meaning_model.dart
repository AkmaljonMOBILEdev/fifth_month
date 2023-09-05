import 'package:fifth_month/data/models/meaning_model/sub_models/definition_model.dart';

class MeaningModel {
  final String partOfSpeech;
  final List<DefinitionModel> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json["partOfSpeech"] ?? "",
      definitions: (json["definitions"] as List<dynamic>?)?.map((e) => DefinitionModel.fromJson(e)).toList()??[],
      synonyms: List<String>.from(json["synonyms"] ?? []),
      antonyms: List<String>.from(json["antonyms"] ?? []),
    );
  }
}

