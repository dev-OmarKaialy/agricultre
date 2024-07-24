import 'package:first_app/core/shared/type_defs.dart';
import 'package:first_app/core/unified_api/api_variables.dart';
import 'package:first_app/core/unified_api/get_api.dart';
import 'package:first_app/core/unified_api/post_api.dart';
import 'package:first_app/features/chat/data/models/index_chats_model.dart';
import 'package:first_app/features/chat/data/models/index_users_model.dart';

import '../models/messages_model.dart';

class ChatDatasource {
  Future<GetAllMessagesResponseModel> indexMessages(String chatId) async {
    final getApi = GetApi(
        uri: ApiVariables().getAllMessages(chatId),
        fromJson: getAllMessagesResponseModelFromJson);
    return await getApi.callRequest();
  }

  Future<void> sendMessages(String chatId, String message) async {
    final getApi = PostApi(
        body: {'message': message},
        uri: ApiVariables().sendMessage(chatId),
        fromJson: (str) {});
    return await getApi.callRequest();
  }

  Future<IndexChatModel> getAllChats() async {
    final getApi = GetApi(
        uri: ApiVariables().getChats(), fromJson: indexChatModelFromJson);
    return await getApi.callRequest();
  }

  Future<CreateChatModel> createChat(BodyMap body) async {
    final getApi = PostApi(
        body: body,
        uri: ApiVariables().createChat(),
        fromJson: createChatModelFromJson);
    return await getApi.callRequest();
  }

  Future<IndexUsersModel> indexUsers() async {
    final getApi = GetApi(
        uri: ApiVariables().getAllUsers(), fromJson: indexUsersModelFromJson);
    return await getApi.callRequest();
  }
}
