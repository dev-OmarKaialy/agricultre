part of 'chat_bloc.dart';

class ChatState {
  final RequestStatus indexChatsStatus;
  final RequestStatus createChatsStatus;
  final RequestStatus sendMessageStatus;
  final RequestStatus indexMessagesStatus;
  final RequestStatus indexUsersEvent;
  final List<MessagesModel> messages;
  final List<UserModel> users;
  final List<ChatModel> chats;
  ChatState({
    this.indexChatsStatus = RequestStatus.init,
    this.createChatsStatus = RequestStatus.init,
    this.sendMessageStatus = RequestStatus.init,
    this.indexMessagesStatus = RequestStatus.init,
    this.indexUsersEvent = RequestStatus.init,
    this.messages = const [],
    this.users = const [],
    this.chats = const [],
  });

  ChatState copyWith({
    RequestStatus? indexChatsStatus,
    RequestStatus? createChatsStatus,
    RequestStatus? sendMessageStatus,
    RequestStatus? indexMessagesStatus,
    RequestStatus? indexUsersEvent,
    List<MessagesModel>? messages,
    List<UserModel>? users,
    List<ChatModel>? chats,
  }) {
    return ChatState(
      indexChatsStatus: indexChatsStatus ?? this.indexChatsStatus,
      createChatsStatus: createChatsStatus ?? this.createChatsStatus,
      sendMessageStatus: sendMessageStatus ?? this.sendMessageStatus,
      indexMessagesStatus: indexMessagesStatus ?? this.indexMessagesStatus,
      indexUsersEvent: indexUsersEvent ?? this.indexUsersEvent,
      messages: messages ?? this.messages,
      users: users ?? this.users,
      chats: chats ?? this.chats,
    );
  }
}
