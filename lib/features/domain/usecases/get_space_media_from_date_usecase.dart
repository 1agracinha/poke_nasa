import 'package:poke_nasa/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:poke_nasa/core/usecase/usecase.dart';
import 'package:poke_nasa/features/domain/entities/space_media.dart';
import 'package:poke_nasa/features/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
