import '../../../home/domain/entities/movie_entity.dart';

class PersonEntity {
  final int personId;
  final String personKnownForDepartment;
  final String personName;
  final String personProfilePath;
  final List<MovieEntity> personKnownFor;

  PersonEntity({
    required this.personId,
    required this.personKnownForDepartment,
    required this.personName,
    required this.personProfilePath,
    required this.personKnownFor,
  });
}
