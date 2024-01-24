import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/widgets/chat/display_message.dart';

import '../../../core/enums/message_type.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.isSender,
    required this.message,
    required this.time,
    required this.messageType,
    required this.onSwipe,
  }) : super(key: key);

  final bool isSender;
  final String message;
  final String time;
  final MessageType messageType;
  final VoidCallback onSwipe;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _buildBody(size, context);
  }

  Widget _buildBody(Size size, BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.8,
            minWidth: 0.0,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 4.0,
            ),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isSender
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.only(
                topLeft: isSender ? const Radius.circular(12.0) : Radius.zero,
                topRight: const Radius.circular(12.0),
                bottomLeft: const Radius.circular(12.0),
                bottomRight:
                    isSender ? Radius.zero : const Radius.circular(12.0),
              ),
            ),
            child: _buildMessageContent(context),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 8.0,
        ),
        DisplayMessage(
          message: message,
          isSender: isSender,
          messageType: messageType,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color:
                        isSender ? theme.colorScheme.primary : appTheme.gray200,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
