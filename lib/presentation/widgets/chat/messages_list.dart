import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/logic/request/request_cubit.dart';
import 'package:private_chat/logic/user/user_cubit.dart';
import 'package:private_chat/presentation/widgets/chat/message_card.dart';

import '../../../domain/models/message.dart';
import '../../../logic/chat/chat_cubit.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
  });

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  late final ScrollController _messagesScrollController;

  @override
  void initState() {
    super.initState();
    _messagesScrollController = ScrollController();
  }

  @override
  void dispose() {
    _messagesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getMyProfile();
    return StreamBuilder<List<Message>>(
      builder: (context, snapshot) {
        // if (!snapshot.hasData) {
        //   return const Center(
        //     child: CircularProgressIndicator(
        //       color: Colors.black,
        //     ),
        //   );
        // }

        // // adding callback to new message to scroll to bottom.
        // SchedulerBinding.instance.addPostFrameCallback(
        //   (_) => _messagesScrollController.animateTo(
        //     _messagesScrollController.position.maxScrollExtent,
        //     duration: const Duration(milliseconds: 500),
        //     curve: Curves.linear,
        //   ),
        // );

        return BlocBuilder<ChatCubit, ChatState>(
          buildWhen: (context, state) {
            return state is ChatMessageListState;
          },
          builder: (context, state) {
            if (state is ChatMessageListState) {
              return ListView.builder(
                itemCount: state.messageList.length,
                itemBuilder: (context, index) {
                  Message message = state.messageList[index];

                  return MessageCard(
                    isSender: message.sender == state.myUId,
                    message: message.message,
                    messageType: message.messageType,
                    time: DateFormat.Hm().format(message.createdAt),
                    onSwipe: () {},
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          },
        );
      },
    );
  }
}
