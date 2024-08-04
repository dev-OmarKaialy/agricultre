import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../model/type_of_class.dart';

class PlantsDatasource {
  Future<void> getPlants() async {
    final getApi = GetApi(uri: ApiVariables().plants(), fromJson: (z) {});
    return await getApi.callRequest();
  }

  Future<IndexTypeOfClassifyModel> getTypeOfClassify() async {
    final getApi = GetApi(
        uri: ApiVariables().type_of_classifys(),
        fromJson: indexTypeOfClassifyModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> getTypeOfClassifyById(String id) async {
    final getApi =
        GetApi(uri: ApiVariables().typesOfClassifyByID(id), fromJson: (a) {});
    return await getApi.callRequest();
  }
}
