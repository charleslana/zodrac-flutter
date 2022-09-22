import 'dart:convert';

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.birthDate,
    required this.level,
  });

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      gender: map['gender'] as String,
      birthDate: DateTime.parse(map['birthDate']),
      level: map['level'] as int,
    );
  }

  static List<CharacterModel> listFromJson(List<dynamic> list) =>
      List<CharacterModel>.from(
          // ignore: unnecessary_lambdas
          list.map((dynamic e) => CharacterModel.fromMap(e)));

  final int id;
  final String name;
  final String image;
  final String gender;
  final DateTime birthDate;
  final int level;

  CharacterModel copyWith({
    int? id,
    String? name,
    String? image,
    String? gender,
    DateTime? birthDate,
    int? level,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      level: level ?? this.level,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'level': level,
    };
  }

  String toJson() => json.encode(toMap());
}
