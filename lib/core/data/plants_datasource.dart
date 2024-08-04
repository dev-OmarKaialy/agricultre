import '../unified_api/api_variables.dart';
import '../unified_api/get_api.dart';

class PlantsDatasource {
  Future<void> getAdverts() async {
    final getApi = GetApi(uri: ApiVariables().plants(), fromJson: (z) {});
    return await getApi.callRequest();
  }

  Future<void> getAdverts1() async {
    final getApi =
        GetApi(uri: ApiVariables().type_of_classifys(), fromJson: (b) {});
    return await getApi.callRequest();
  }

  Future<void> getAdverts2(String id) async {
    final getApi =
        GetApi(uri: ApiVariables().type_of_classifys1(id), fromJson: (a) {});
    return await getApi.callRequest();
  }
}
