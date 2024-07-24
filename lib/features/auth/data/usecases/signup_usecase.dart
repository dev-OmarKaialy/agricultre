import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/usecase/usecase.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';
import 'package:first_app/features/auth/data/repo/auth_repo.dart';

class SignupUsecase implements UseCase<AuthResponseModel, SignUpParams> {
  @override
  Future<Either<Failure, AuthResponseModel>> call(SignUpParams params) async {
    if (params.image != null) {
      return await AuthRepo().signUpEng(
          params.toMap(), {'educationcertificate': params.image!.path});
    } else {
      return await AuthRepo().signUp(params.toMap());
    }
  }
}

class SignUpParams {
  final String email;
  final String name;
  final String phone;
  final String password;
  final String address;
  final File? image;

  SignUpParams({
    required this.email,
    required this.name,
    required this.phone,
    required this.password,
    required this.address,
    this.image,
  });

  Map<String, String> toMap() {
    final result = <String, String>{};

    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'phone': phone});
    result.addAll({'role': image == null ? 'user' : 'eng'});
    result.addAll({'password': password});
    result.addAll({'address': address});

    return result;
  }

  factory SignUpParams.fromMap(Map<String, dynamic> map) {
    return SignUpParams(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpParams.fromJson(String source) =>
      SignUpParams.fromMap(json.decode(source));
}
