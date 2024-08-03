import 'package:dartz/dartz.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';
import 'package:first_app/features/advice/data/datasources/advice_datsource.dart';

import '../../../../core/error/failures.dart';
import '../models/advice_model.dart';

class AdviceRepo with HandlingExceptionManager {
  Future<Either<Failure, AdviceResponseModel>> getAdvices() async {
    return wrapHandling(tryCall: () async {
      return Right(await AdviceDatsource().getAdvices());
    });
  }
}
