import '../../features/home/data/models/movie_model.dart';
import '../../features/home/domain/entities/movie_entity.dart';
import '../../features/movie_details/data/models/cast_member_model.dart';
import '../../features/movie_details/domain/entities/cast_member_entity.dart';
import '../../features/search/data/models/person_model.dart';
import '../../features/search/domain/entities/person_entity.dart';

List<MovieEntity> excludeMoviesWithCorruptedImages(List<MovieEntity> movies) {
  List<MovieEntity> validMovies = movies
      .where((movie) =>
          movie.moviePosterPath != 'UnknownImage' &&
          movie.movieBackdropPath != 'UnknownImage')
      .toList();
  return validMovies;
}

List<PersonEntity> excludePersonsWithCorruptedImages(
    List<PersonEntity> persons) {
  List<PersonEntity> validMovies = persons
      .where((person) => person.personProfilePath != 'UnknownImage')
      .toList();
  return validMovies;
}

List<CastMemberEntity> excludeCastMembersWithCorruptedImages(
    List<CastMemberEntity> castMembers) {
  List<CastMemberEntity> validMembers = castMembers
      .where((member) => member.memberProfilePath != 'UnknownImage')
      .toList();
  return validMembers;
}

List<MovieEntity> getMoviesList(Map<String, dynamic> data) {
  List<MovieEntity> movies = [];
  for (var movie in data['results']) {
    movies.add(MovieModel.fromJson(movie));
  }
  return movies;
}

List<PersonEntity> getPersonsList(Map<String, dynamic> data) {
  List<PersonEntity> persons = [];
  for (var movie in data['results']) {
    persons.add(PersonModel.fromJson(movie));
  }
  return persons;
}

List<CastMemberEntity> getMembersList(Map<String, dynamic> data) {
  List<CastMemberEntity> castMembers = [];
  for (var member in data['cast']) {
    castMembers.add(CastMemberModel.fromJson(member));
  }
  return castMembers;
}

String getGenre(int code) {
  switch (code) {
    case 28:
      return 'Action';
    case 12:
      return 'Adventure';
    case 16:
      return 'Animation';
    case 35:
      return 'Comedy';
    case 80:
      return 'Crime';
    case 99:
      return 'Documentary';
    case 18:
      return 'Drama';
    case 10751:
      return 'Family';
    case 14:
      return 'Fantasy';
    case 36:
      return 'History';
    case 27:
      return 'Horror';
    case 10402:
      return 'Music';
    case 9648:
      return 'Mystery';
    case 10749:
      return 'Romance';
    case 878:
      return 'Science Fiction';
    case 10770:
      return 'TV Movie';
    case 53:
      return 'Thriller';
    case 10752:
      return 'War';
    case 37:
      return 'Western';
    default:
      return 'Drama';
  }
}
