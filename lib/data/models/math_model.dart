class MathModel {
  final int a;
  final int b;
  final num? result;

  MathModel({
    this.a = 0,
    this.b = 0,
    this.result = 0,
  });

  MathModel copyWith({
    int? a,
    int? b,
    num? result,
  }) {
    return MathModel(a: a ?? this.a, b: b ?? this.b, result: result ?? this.result,);
  }

  factory MathModel.fromJson(Map<String, dynamic> json) {
    return MathModel(
      a: json["a"] ?? 0,
      b: json["b"] ?? 0,
      result: json["result"] ?? 0
    );
  }

}
