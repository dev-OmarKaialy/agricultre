import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';
import 'package:first_app/features/auth/data/datasource/auth_datasource.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';

class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, AuthResponseModel>> login(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await AuthDatasource().login(body);
      return Right(result);
    });
  }

  Future<Either<Failure, AuthResponseModel>> signUp(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await AuthDatasource().signUp(body);
      return Right(result);
    });
  }

  Future<Either<Failure, AuthResponseModel>> signUpEng(
      Map<String, String> body, Map<String, String> files) async {
    return wrapHandling(tryCall: () async {
      final result = await AuthDatasource().signUpEng(body, files);
      return Right(result);
    });
  }
}
