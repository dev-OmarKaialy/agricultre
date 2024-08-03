import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';

import '../models/advice_model.dart';

class AdviceDatsource {
  Future<AdviceResponseModel> getAdvices() async {
    final getApi = GetApi(
        uri: ApiVariables().advices(), fromJson: adviceResponseModelFromJson);
    return await getApi.callRequest();
  }
}
