part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class IndexChatsEvent extends ChatEvent {}

class IndexChatMessagesEvent extends ChatEvent {
  final String chatId;
  IndexChatMessagesEvent({
    required this.chatId,
  });
}

class SendMessageEvent extends ChatEvent {
  final String chatId;
  final String message;
  SendMessageEvent({
    required this.chatId,
    required this.message,
  });
}

class IndexUsersEvent extends ChatEvent {}

class CreateChatEvent extends ChatEvent {
  final String id;
  CreateChatEvent({
    required this.id,
  });
}

class SearchChatsEvent extends ChatEvent {
  final String searchPhrase;
  SearchChatsEvent({
    required this.searchPhrase,
  });
}
