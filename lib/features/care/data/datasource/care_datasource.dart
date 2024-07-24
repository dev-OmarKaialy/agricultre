import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';
import 'package:first_app/features/care/data/models/care_model.dart';

class CareDatasource {
  Future<CareResponseModel> indexCares() async {
    final getApi = GetApi(
        uri: ApiVariables().getCares(), fromJson: careResponseModelFromJson);
    return await getApi.callRequest();
  }
}
