class DefinitionModel {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;

  DefinitionModel({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json["definition"] ?? "",
      synonyms: List<String>.from(json["synonyms"] as List? ?? []),
      antonyms: List<String>.from(json["antonyms"] as List? ?? []),
    );
  }

  @override
  String toString() {
    return '''
    definition: $definition
    synonyms: $synonyms
    antonyms: $antonyms
    ''';
  }
}
