import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';
import 'package:first_app/core/unified_api/patch_api.dart';
import 'package:first_app/features/auth/data/models/auth_model.dart';
import 'package:first_app/features/profile/data/model/profile_model.dart';

class ProfileDatasource {
  Future<AuthResponseModel> updatePassword(BodyMap body) async {
    final patchApi = PatchApi(
        uri: ApiVariables().updatePassword(),
        body: body,
        fromJson: authResponseModelFromJson);
    return await patchApi.callRequest();
  }

  Future<UpdateProfileResponseModel> updateProfile(BodyMap body) async {
    final patchApi = PatchApi(
        uri: ApiVariables().updateProfile(),
        body: body,
        fromJson: updateProfileResponseModelFromJson);
    return await patchApi.callRequest();
  }

  Future<GetProfileModel> getProfile() async {
    final patchApi = GetApi(
        uri: ApiVariables().getProfile(), fromJson: getProfileModelFromJson);
    return await patchApi.callRequest();
  }
}
