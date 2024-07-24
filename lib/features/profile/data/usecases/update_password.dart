import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/usecase/usecase.dart';
import 'package:first_app/features/profile/data/repo/profile_repo.dart';

import '../../../auth/data/models/auth_model.dart';

class UpdatePasswordUsecase
    implements UseCase<AuthResponseModel, UpdatePasswordParams> {
  @override
  Future<Either<Failure, AuthResponseModel>> call(
      UpdatePasswordParams params) async {
    return await ProfileRepo().updatePassword(params.toMap());
  }
}

class UpdatePasswordParams {
  final String currentPassword;
  final String newPassword;
  UpdatePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'passwordCurrent': currentPassword});
    result.addAll({'password': newPassword});

    return result;
  }

  factory UpdatePasswordParams.fromMap(Map<String, dynamic> map) {
    return UpdatePasswordParams(
      currentPassword: map['currentPassword'] ?? '',
      newPassword: map['newPassword'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdatePasswordParams.fromJson(String source) =>
      UpdatePasswordParams.fromMap(json.decode(source));
}
