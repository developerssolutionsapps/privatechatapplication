import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/logic/user/user_cubit.dart';
import 'package:private_chat/presentation/widgets/chat/message_card.dart';

import '../../../domain/models/message.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({
    super.key,
    required this.uId,
    required this.myUId,
  });

  final String uId;
  final String myUId;

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
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }

        // adding callback to new message to scroll to bottom.
        SchedulerBinding.instance.addPostFrameCallback(
          (_) => _messagesScrollController.animateTo(
            _messagesScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          ),
        );

        return ListView.builder(
          controller: _messagesScrollController,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            Message message = snapshot.data![index];

            return MessageCard(
              isSender: message.sender == widget.myUId ? true : false,
              message: message.message,
              messageType: message.messageType,
              time: DateFormat.Hm().format(message.createdAt),
              onSwipe: () {},
            );
          },
        );
      },
    );
  }
}
