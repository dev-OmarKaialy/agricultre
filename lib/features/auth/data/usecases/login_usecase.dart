import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/usecase/usecase.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';
import 'package:first_app/features/auth/data/repo/auth_repo.dart';

class LoginUsecase implements UseCase<AuthResponseModel, LoginParams> {
  @override
  Future<Either<Failure, AuthResponseModel>> call(LoginParams params) async {
    return await AuthRepo().login(params.toMap());
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }
}
