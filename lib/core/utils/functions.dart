import '../../features/home/domain/entities/movie_entity.dart';
import '../../features/movie_details/domain/entities/cast_member_entity.dart';

List<MovieEntity> excludeMoviesWithCorruptedImages(List<MovieEntity> movies) {
  List<MovieEntity> validMovies = movies
      .where((movie) =>
          movie.moviePosterPath != 'UnknownImage' &&
          movie.movieBackdropPath != 'UnknownImage')
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
