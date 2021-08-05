import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poke_nasa/core/usecase/errors/failures.dart';
import 'package:poke_nasa/features/domain/entities/space_media.dart';
import 'package:poke_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:poke_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
      description: "Test Description: OK",
      mediaType: 'Tes Media Type: OK',
      title: "Test Title: OK",
      mediaUrl: "Test Media Url: OK");
  final tDate = DateTime(2021, 02, 02);

  test("should get space media entity for a given date from the repository",
      () async {
    when(() => repository.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });

  test("should return a failure when don't succeed", () async {
    when(() => repository.getSpaceMediaFromDate(tDate)).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    final result = await usecase(tDate);
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
}
