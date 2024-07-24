import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../datasource/illusion_datasource.dart';
import '../models/illusion_model.dart';

class IllusionRepo with HandlingExceptionManager {
  Future<Either<Failure, IllusionResponseModel>> indexIllusions() async {
    return Right(await IllusionDatasource().getIllusions());
  }
}
