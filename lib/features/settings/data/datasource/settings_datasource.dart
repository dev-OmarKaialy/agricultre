import 'package:first_app/core/models/create_doc_model.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/delete_api.dart';
import 'package:first_app/core/unified_api/post_api.dart';
import 'package:first_app/features/agriculture/data/datasource/agri_datasource.dart';
import 'package:first_app/features/care/data/datasource/care_datasource.dart';
import 'package:first_app/features/illusion/data/datasource/illusion_datasource.dart';
import 'package:first_app/features/storage/data/datasource/storage_datasource.dart';

import '../../../care/data/models/care_model.dart';
import '../../../illusion/data/models/illusion_model.dart';
import '../../../storage/data/models/storage_model.dart';

class SettingsDatasource {
  Future<CareResponseModel> indexCares() async {
    return await CareDatasource().indexCares();
  }

  Future<CareResponseModel> indexAgris() async => AgriDatasource().indexAgri();
  Future<IllusionResponseModel> getIllusions() async {
    return await IllusionDatasource().getIllusions();
  }

  Future<IndexStorageModel> indexstorage() async =>
      await StorageDatasource().indexstorage();

  Future<void> deleteStorage(String id) async {
    final deleteApi =
        DeleteApi(uri: ApiVariables().deleteStorage(id), fromJson: (s) {});
    return await deleteApi.callRequest();
  }

  Future<void> deleteAgris(String id) async {
    final deleteApi =
        DeleteApi(uri: ApiVariables().deleteAgri(id), fromJson: (s) {});
    return await deleteApi.callRequest();
  }

  Future<void> deleteCares(String id) async {
    final deleteApi =
        DeleteApi(uri: ApiVariables().deleteCares(id), fromJson: (s) {});
    return await deleteApi.callRequest();
  }

  Future<void> deleteIllusions(String id) async {
    final deleteApi =
        DeleteApi(uri: ApiVariables().deleteIllusions(id), fromJson: (s) {});
    return await deleteApi.callRequest();
  }

  Future<CreateDocModel> createAgri(String name, String description) async {
    final postApi = PostApi(
        uri: ApiVariables().getAgri(),
        body: {'name': name, 'discrption': description},
        fromJson: createDocModelFromJson);
    return await postApi.callRequest();
  }

  Future<CreateDocModel> createCare(String name, String description) async {
    final postApi = PostApi(
        uri: ApiVariables().getCares(),
        body: {'name': name, 'discrption': description},
        fromJson: createDocModelFromJson);
    return await postApi.callRequest();
  }

  Future<CreateDocModel> createStorage(String name, String description) async {
    final postApi = PostApi(
        uri: ApiVariables().getStorage(),
        body: {'name': name, 'discrption': description},
        fromJson: createDocModelFromJson);
    return await postApi.callRequest();
  }
}
