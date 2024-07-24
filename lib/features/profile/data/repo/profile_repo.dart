import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';
import 'package:first_app/features/profile/data/datasource/profile_datasource.dart';
import 'package:first_app/features/profile/data/model/profile_model.dart';

import '../../../../core/shared/type_defs.dart';
import '../../../auth/data/models/auth_model.dart';

class ProfileRepo with HandlingExceptionManager {
  Future<Either<Failure, AuthResponseModel>> updatePassword(
      BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await ProfileDatasource().updatePassword(body);
      return Right(result);
    });
  }

  Future<Either<Failure, UpdateProfileResponseModel>> udpateProfile(
      BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await ProfileDatasource().updateProfile(body);
      return Right(result);
    });
  }

  Future<Either<Failure, GetProfileModel>> getProfile() async {
    return wrapHandling(tryCall: () async {
      final result = await ProfileDatasource().getProfile();
      return Right(result);
    });
  }
}
