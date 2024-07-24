import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/widgets/main_error_widget.dart';
import 'package:first_app/features/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailPage extends StatefulWidget {
  final String image;
  final String id;
  final String name;
  const ChatDetailPage(
      {super.key, required this.image, required this.id, required this.name});
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final textController = TextEditingController();
  @override
  void initState() {
    serviceLocator<ChatBloc>().add(IndexChatMessagesEvent(chatId: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 20,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        //TODO
                        // Text(
                        //   widget.id,
                        //   style: TextStyle(
                        //       color: Colors.grey.shade600, fontSize: 13),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(children: <Widget>[
          Stack(
            children: <Widget>[
              BlocBuilder<ChatBloc, ChatState>(
                bloc: serviceLocator<ChatBloc>(),
                builder: (context, state) {
                  return switch (state.indexMessagesStatus) {
                    RequestStatus.loading => const CircularProgressIndicator(),
                    RequestStatus.failed => MainErrorWidget(onPressed: () {
                        serviceLocator<ChatBloc>()
                            .add(IndexChatMessagesEvent(chatId: widget.id));
                      }),
                    RequestStatus.success => ListView.builder(
                        itemCount: state.messages.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (state.messages[index].sender?.name ==
                                      widget.name
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (state.messages[index].sender?.name ==
                                          widget.name
                                      ? Colors.grey.shade200
                                      : const Color.fromARGB(
                                          255, 113, 175, 59)),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  state.messages[index].message!,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    _ => const SizedBox(),
                  };
                },
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 59, 92, 30),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          decoration: const InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          serviceLocator<ChatBloc>().add(SendMessageEvent(
                              chatId: widget.id, message: textController.text));
                        },
                        backgroundColor: const Color.fromARGB(255, 59, 92, 30),
                        elevation: 0,
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
