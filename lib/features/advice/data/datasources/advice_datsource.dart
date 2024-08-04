import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';
import 'package:first_app/core/unified_api/patch_api.dart';
import 'package:first_app/core/unified_api/post_api.dart';

import '../models/advice_model.dart';

class AdviceDatsource {
  Future<AdviceResponseModel> getAdvices() async {
    final getApi = GetApi(
        uri: ApiVariables().advices(), fromJson: adviceResponseModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> addAdvice(BodyMap body) async {
    final postApi =
        PostApi(uri: ApiVariables().advices(), body: body, fromJson: (str) {});
    return await postApi.callRequest();
  }

  Future<void> updateAdvice(BodyMap body, String id) async {
    final postApi = PatchApi(
        uri: ApiVariables().advices(id: id), body: body, fromJson: (str) {});
    return await postApi.callRequest();
  }
}
