import 'package:dartz/dartz.dart';
import 'package:poke_nasa/core/usecase/errors/failures.dart';
import 'package:poke_nasa/features/domain/entities/space_media.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date);
}
