import 'package:dartz/dartz.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';
import 'package:first_app/features/showPlant/data/datasource/plants_datasource.dart';

import '../../../../core/error/failures.dart';

class PlantsRepo with HandlingExceptionManager {
  Future<Either<Failure, void>> getAdverts() async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getPlants());
    });
  }

  Future<Either<Failure, void>> getAdverts1() async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getTypeOfClassify());
    });
  }

  Future<Either<Failure, void>> getAdverts2(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await PlantsDatasource().getTypeOfClassifyById(id));
    });
  }
}
