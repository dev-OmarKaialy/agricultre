import 'package:dartz/dartz.dart';
import 'package:first_app/features/storage/data/datasource/storage_datasource.dart';
import 'package:first_app/features/storage/data/models/storage_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';

class StorageRepo with HandlingExceptionManager {
  Future<Either<Failure, IndexStorageModel>> indexStorage() async {
    return wrapHandling(tryCall: () async {
      return Right(await StorageDatasource().indexstorage());
    });
  }
}
