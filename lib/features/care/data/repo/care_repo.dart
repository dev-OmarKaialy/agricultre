import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../datasource/care_datasource.dart';
import '../models/care_model.dart';

class CareRepo with HandlingExceptionManager {
  Future<Either<Failure, CareResponseModel>> indexCares() async {
    return wrapHandling(
        tryCall: () async => Right(await CareDatasource().indexCares()));
  }
}
