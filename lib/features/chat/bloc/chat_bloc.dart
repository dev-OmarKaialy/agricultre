import 'package:bloc/bloc.dart';
import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/features/chat/data/models/index_chats_model.dart';
import 'package:first_app/features/chat/data/models/messages_model.dart';
import 'package:first_app/features/chat/data/repo/chat_repo.dart';
import 'package:meta/meta.dart';

import '../../auth/data/models/auth_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  List<ChatModel> chats = [];
  ChatBloc() : super(ChatState()) {
    on<IndexChatsEvent>((event, emit) async {
      emit(state.copyWith(indexChatsStatus: RequestStatus.loading));
      final result = await ChatRepo().indexChats();
      result.fold((l) {
        emit(state.copyWith(indexChatsStatus: RequestStatus.failed));
      }, (r) {
        chats = r.doc!;
        emit(state.copyWith(
            indexChatsStatus: RequestStatus.success, chats: chats));
      });
    });
    on<SearchChatsEvent>((event, emit) async {
      emit(
        state.copyWith(
          indexChatsStatus: RequestStatus.success,
          chats: List.of(chats).where(
            (e) {
              return (e.user?.name ?? '').contains(event.searchPhrase);
            },
          ).toList(),
        ),
      );
    });
    on<CreateChatEvent>((event, emit) async {
      emit(state.copyWith(createChatsStatus: RequestStatus.loading));
      final result = await ChatRepo().createChat({'user2': event.id});
      result.fold((l) {
        emit(state.copyWith(createChatsStatus: RequestStatus.failed));
      }, (r) {
        emit(
          state.copyWith(
            createChatsStatus: RequestStatus.success,
          ),
        );
        add(IndexChatsEvent());
      });
      emit(
        state.copyWith(
          createChatsStatus: RequestStatus.init,
        ),
      );
    });
    on<IndexUsersEvent>((event, emit) async {
      emit(state.copyWith(indexUsersEvent: RequestStatus.loading));
      final result = await ChatRepo().indexUsers();
      result.fold((l) {
        emit(state.copyWith(indexUsersEvent: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            indexUsersEvent: RequestStatus.success, users: r.doc!));
      });
    });
    on<SendMessageEvent>((event, emit) async {
      final result = await ChatRepo().sendMessage(event.chatId, event.message);
      int index = 0;
      result.fold((l) {}, (r) {
        index = 1;
      });
      if (index == 1) {
        final result = await ChatRepo().indexMessages(event.chatId);
        result.fold((l) {}, (r) {
          emit(state.copyWith(
              indexMessagesStatus: RequestStatus.success, messages: r.doc));
        });
      }
    });
    on<IndexChatMessagesEvent>((event, emit) async {
      emit(state
          .copyWith(indexMessagesStatus: RequestStatus.loading, messages: []));
      final result = await ChatRepo().indexMessages(event.chatId);
      result.fold((l) {
        emit(state.copyWith(indexMessagesStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            indexMessagesStatus: RequestStatus.success, messages: r.doc));
      });
    });
  }
}
