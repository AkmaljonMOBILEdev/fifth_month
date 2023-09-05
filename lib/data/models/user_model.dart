class UserModel {
  int? id;
  final String firstname;
  final String lastname;
  final int age;
  final String gender;
  final String jobTitle;

  UserModel({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.gender,
    required this.jobTitle,
  });

  UserModel copyWith({
    int? id,
    String? firstname,
    String? lastname,
    int? age,
    String? gender,
    String? jobTitle,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      jobTitle: jobTitle ?? this.jobTitle,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstname: json["firstname"] ?? "",
      lastname: json["lastname"] ?? "",
      age: json["age"] ?? "",
      gender: json["gender"] ?? "",
      jobTitle: json["job"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstname,
      'lastName': lastname,
      'age': age,
      'gender': gender,
      'job': jobTitle,
    };
  }

  @override
  String toString() {
    return '''
    firstname: $firstname
    lastname:: $lastname
    age: $age,
    gender: $gender
    job: $jobTitle
    ''';
  }
}
