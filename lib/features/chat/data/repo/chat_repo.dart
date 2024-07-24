import 'package:dartz/dartz.dart';
import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/features/chat/data/datasource/chat_datasource.dart';
import 'package:first_app/features/chat/data/models/index_users_model.dart';
import 'package:first_app/features/chat/data/models/messages_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../models/index_chats_model.dart';

class ChatRepo with HandlingExceptionManager {
  Future<Either<Failure, IndexChatModel>> indexChats() async {
    return wrapHandling(
        tryCall: () async => Right(await ChatDatasource().getAllChats()));
  }

  Future<Either<Failure, GetAllMessagesResponseModel>> indexMessages(
      String chatId) async {
    return wrapHandling(
        tryCall: () async =>
            Right(await ChatDatasource().indexMessages(chatId)));
  }

  Future<Either<Failure, void>> sendMessage(
      String chatId, String message) async {
    return wrapHandling(
        tryCall: () async =>
            Right(await ChatDatasource().sendMessages(chatId, message)));
  }

  Future<Either<Failure, IndexUsersModel>> indexUsers() async {
    return wrapHandling(tryCall: () async {
      return Right(await ChatDatasource().indexUsers());
    });
  }

  Future<Either<Failure, CreateChatModel>> createChat(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      return Right(await ChatDatasource().createChat(body));
    });
  }
}
