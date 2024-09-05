import '../../../home/data/models/movie_model.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../../domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<MovieEntity>? knownFor;

  PersonModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  }) : super(
          personId: id!,
          personKnownForDepartment: knownForDepartment ?? 'Unknown',
          personName: name ?? 'Unknown',
          personProfilePath: profilePath ?? 'UnknownImage',
          personKnownFor: knownFor ?? [],
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'known_for': knownFor,
      };
}
