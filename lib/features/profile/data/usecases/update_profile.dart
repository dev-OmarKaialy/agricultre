import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/usecase/usecase.dart';
import 'package:first_app/features/profile/data/model/profile_model.dart';
import 'package:first_app/features/profile/data/repo/profile_repo.dart';

class UpdateProfileUsecase
    implements UseCase<UpdateProfileResponseModel, UpdateProfileParams> {
  @override
  Future<Either<Failure, UpdateProfileResponseModel>> call(
      UpdateProfileParams params) async {
    return await ProfileRepo().udpateProfile(params.toMap());
  }
}

class UpdateProfileParams {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  UpdateProfileParams({
    this.name,
    this.email,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }
    if (address != null) {
      result.addAll({'address': address});
    }

    return result;
  }
}
