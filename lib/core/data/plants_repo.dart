import 'package:dartz/dartz.dart';
import 'package:first_app/core/data/plants_datasource.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';

import '../error/failures.dart';

class PlantsRepo with HandlingExceptionManager {
  Future<Either<Failure, void>> getAdverts() async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getAdverts());
    });
  }

  Future<Either<Failure, void>> getAdverts1() async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getAdverts1());
    });
  }

  Future<Either<Failure, void>> getAdverts2(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getAdverts2(id));
    });
  }
}
