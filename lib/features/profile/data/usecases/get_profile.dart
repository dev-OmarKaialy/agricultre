import 'package:dartz/dartz.dart';
import 'package:first_app/core/usecase/usecase.dart';

import '../../../../core/error/failures.dart';
import '../model/profile_model.dart';
import '../repo/profile_repo.dart';

class GetProfileUsecase implements UseCase<GetProfileModel, NoParams> {
  @override
  Future<Either<Failure, GetProfileModel>> call(NoParams params) async {
    return await ProfileRepo().getProfile();
  }
}
