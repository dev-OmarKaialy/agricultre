import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/features/chat/bloc/chat_bloc.dart';
import 'package:first_app/features/chat/presentation/chat_Details.dart';
import 'package:first_app/features/chat/presentation/new_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'widgets/conversition_List.dart';

// ignore: must_be_immutable
class ConversationPageView extends StatefulWidget {
  const ConversationPageView({super.key});

  @override
  State<ConversationPageView> createState() => _ConversationPageViewState();
}

class _ConversationPageViewState extends State<ConversationPageView> {
  @override
  void initState() {
    serviceLocator<ChatBloc>().add(IndexChatsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "المحادثات",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<ChatBloc, ChatState>(
                          bloc: serviceLocator<ChatBloc>(),
                          builder: (context, state) {
                            return Material(
                              child: InkWell(
                                onTap: () async {
                                  await showGeneralDialog(
                                    context: context,
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return const NewChatScreen();
                                    },
                                  ).then((v) {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ChatDetailPage(
                                          image: 'assets/images/1a.png',
                                          id: state.chats.firstWhereOrNull((e) {
                                                return e.user?.name ==
                                                    v.toString();
                                              })?.id ??
                                              state.chats.first.id!,
                                          name: v.toString(),
                                        );
                                      },
                                    ));
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 2, bottom: 2),
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.pink[50],
                                  ),
                                  child: const Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.add,
                                        color: Colors.pink,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "اضافة جديد",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TextField(
                        onChanged: (v) {
                          serviceLocator<ChatBloc>()
                              .add(SearchChatsEvent(searchPhrase: v));
                        },
                        decoration: InputDecoration(
                          hintText: "بحث  ...",
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade600,
                            size: 20,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          contentPadding: const EdgeInsets.all(8),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade100)),
                        ),
                      ),
                    ),
                    BlocBuilder<ChatBloc, ChatState>(
                      bloc: serviceLocator<ChatBloc>(),
                      builder: (context, state) {
                        return switch (state.indexChatsStatus) {
                          RequestStatus.success => ListView.builder(
                              itemCount: state.chats.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.only(top: 16),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ConversationList(
                                  chat: state.chats[index],
                                  messageText: '',
                                  imageUrl: 'assets/images/1a.png',
                                  time: '',
                                  isMessageRead:
                                      (index == 0 || index == 3) ? true : false,
                                );
                              },
                            ),
                          RequestStatus.loading =>
                            const CircularProgressIndicator(),
                          _ => const SizedBox()
                        };
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
