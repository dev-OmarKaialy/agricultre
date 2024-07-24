import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';

import '../models/storage_model.dart';

class StorageDatasource {
  Future<IndexStorageModel> indexstorage() async {
    final getApi = GetApi(
        uri: ApiVariables().getStorage(), fromJson: indexStorageModelFromJson);
    return await getApi.callRequest();
  }
}
