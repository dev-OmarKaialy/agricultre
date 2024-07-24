import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/multi_post_api.dart';
import 'package:first_app/core/unified_api/post_api.dart';

import '../models/auth_model.dart';

class AuthDatasource {
  Future<AuthResponseModel> login(BodyMap body) async {
    final postApi = PostApi(
        uri: ApiVariables().signIn(),
        body: body,
        fromJson: authResponseModelFromJson);
    return await postApi.callRequest();
  }

  Future<AuthResponseModel> signUp(BodyMap body) async {
    final postApi = PostApi(
        uri: ApiVariables().signUp(),
        body: body,
        fromJson: authResponseModelFromJson);
    return await postApi.callRequest();
  }

  Future<AuthResponseModel> signUpEng(
      Map<String, String> body, Map<String, String> files) async {
    final postApi = MultiPostApi(
        uri: ApiVariables().signUpEng(),
        body: body,
        files: files,
        fromJson: authResponseModelFromJson);
    return await postApi.callRequest();
  }
}
