import 'package:dartz/dartz.dart';
import 'package:first_app/features/agriculture/data/datasource/agri_datasource.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../care/data/models/care_model.dart';

class AgriRepo with HandlingExceptionManager {
  Future<Either<Failure, CareResponseModel>> indexAgri() async {
    return wrapHandling(tryCall: () async {
      return Right(await AgriDatasource().indexAgri());
    });
  }
}
