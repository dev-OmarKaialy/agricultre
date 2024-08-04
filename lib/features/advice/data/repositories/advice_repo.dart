import 'package:dartz/dartz.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';
import 'package:first_app/features/advice/data/datasources/advice_datsource.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/shared/type_defs.dart';
import '../models/advice_model.dart';

class AdviceRepo with HandlingExceptionManager {
  Future<Either<Failure, AdviceResponseModel>> getAdvices() async {
    return wrapHandling(tryCall: () async {
      return Right(await AdviceDatsource().getAdvices());
    });
  }

  Future<Either<Failure, void>> addAdvice(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      return Right(await AdviceDatsource().addAdvice(body));
    });
  }

  Future<Either<Failure, void>> updateAdvice(BodyMap body, String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await AdviceDatsource().updateAdvice(body, id));
    });
  }
}
