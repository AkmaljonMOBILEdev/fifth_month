class MathModel {
  final int a;
  final int b;

  MathModel({
    this.a = 0,
    this.b = 0,
  });

  MathModel copyWith(
    int? a,
    int? b,
  ) {
    return MathModel(a: a ?? this.a, b: b ?? this.b);
  }

  factory MathModel.fromJson(Map<String, dynamic> json) {
    return MathModel(
      a: json["a"] ?? 0,
      b: json["b"] ?? 0,
    );
  }

}
