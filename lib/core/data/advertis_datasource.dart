import 'package:dartz/dartz.dart';
import 'package:first_app/core/data/advertis_model.dart';
import 'package:first_app/core/error/failures.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';
import 'package:first_app/core/unified_api/handling_exception_manager.dart';

class AdvertisDatasrouce {
  Future<AdvertismnetModel> getAdverts() async {
    final getApi = GetApi(
        uri: ApiVariables().adverts(), fromJson: advertismnetModelFromJson);
    return await getApi.callRequest();
  }
}

class AdvertisREpo with HandlingExceptionManager {
  Future<Either<Failure, AdvertismnetModel>> getAdverts() async {
    return wrapHandling(tryCall: () async {
      return Right(await AdvertisDatasrouce().getAdverts());
    });
  }
}
