import 'package:first_app/core/shared/request_status.dart';
import 'package:first_app/core/shared/service_locator.dart';
import 'package:first_app/core/widgets/main_error_widget.dart';
import 'package:first_app/features/chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewChatScreen extends StatefulWidget {
  const NewChatScreen({super.key});

  @override
  State<NewChatScreen> createState() => _NewChatScreenState();
}

class _NewChatScreenState extends State<NewChatScreen> {
  @override
  void initState() {
    serviceLocator<ChatBloc>().add(IndexUsersEvent());
    super.initState();
  }

  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Chat'),
        centerTitle: true,
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state.createChatsStatus == RequestStatus.success) {
            Navigator.pop(context, name);
          }
        },
        bloc: serviceLocator<ChatBloc>(),
        builder: (context, state) {
          return switch (state.indexUsersEvent) {
            RequestStatus.success => AnimatedSwitcher(
                duration: Durations.long1,
                child: state.users.isEmpty
                    ? const Center(
                        child: Text('There Is No Another User'),
                      )
                    : ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.asset('assets/images/1a.png'),
                            title: Text(state.users[index].name!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            tileColor:
                                index.isEven ? Colors.grey.shade200 : null,
                            onTap: () {
                              name = state.users[index].name!;
                              serviceLocator<ChatBloc>().add(
                                  CreateChatEvent(id: state.users[index].id!));
                            },
                          );
                        }),
              ),
            RequestStatus.failed => MainErrorWidget(onPressed: () {
                serviceLocator<ChatBloc>().add(IndexUsersEvent());
              }),
            RequestStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
