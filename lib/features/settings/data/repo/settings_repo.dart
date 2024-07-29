import 'package:dartz/dartz.dart';
import 'package:first_app/features/care/data/models/care_model.dart';
import 'package:first_app/features/illusion/data/models/illusion_model.dart';
import 'package:first_app/features/settings/data/datasource/settings_datasource.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/models/create_doc_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../storage/data/models/storage_model.dart';

class SettingsRepo with HandlingExceptionManager {
  Future<Either<Failure, CareResponseModel>> indexCares() async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().indexCares());
    });
  }

  Future<Either<Failure, CareResponseModel>> indexAgris() async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().indexAgris());
    });
  }

  Future<Either<Failure, IllusionResponseModel>> getIllusions() async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().getIllusions());
    });
  }

  Future<Either<Failure, IndexStorageModel>> indexstorage() async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().indexstorage());
    });
  }

  Future<Either<Failure, void>> deleteStorage(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().deleteStorage(id));
    });
  }

  Future<Either<Failure, void>> deleteCares(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().deleteCares(id));
    });
  }

  Future<Either<Failure, void>> deleteAgris(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().deleteAgris(id));
    });
  }

  Future<Either<Failure, void>> deleteIllusions(String id) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().deleteIllusions(id));
    });
  }

  Future<Either<Failure, CreateDocModel>> createAgri(
      String name, String description) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().createAgri(name, description));
    });
  }

  Future<Either<Failure, CreateDocModel>> createCare(
      String name, String description) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().createCare(name, description));
    });
  }

  Future<Either<Failure, CreateDocModel>> createStorage(
      String name, String description) async {
    return wrapHandling(tryCall: () async {
      return Right(await SettingsDatasource().createStorage(name, description));
    });
  }
}
