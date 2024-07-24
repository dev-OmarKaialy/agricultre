import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';

import '../models/illusion_model.dart';

class IllusionDatasource {
  Future<IllusionResponseModel> getIllusions() async {
    final getApi = GetApi(
        uri: ApiVariables().getIllusions(),
        fromJson: illusionResponseModelFromJson);
    return await getApi.callRequest();
  }
}
