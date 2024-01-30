import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
    return Align(
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
            color: isSender ? theme.colorScheme.onPrimary : appTheme.gray200,
            borderRadius: BorderRadius.only(
              topLeft: isSender ? const Radius.circular(12.0) : Radius.zero,
              topRight: const Radius.circular(12.0),
              bottomLeft: const Radius.circular(12.0),
              bottomRight: isSender ? Radius.zero : const Radius.circular(12.0),
            ),
          ),
          child: _buildMessageContent(context),
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
        Builder(builder: (context) {
          if (messageType == MessageType.text) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onLongPressStart: (details) =>
                      showReadOutMenu(context, details, message),
                  child: Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isSender
                              ? theme.colorScheme.primary
                              : appTheme.gray200,
                        ),
                  ),
                ),
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isSender
                          ? theme.colorScheme.primary
                          : appTheme.gray200,
                    ),
              ),
            ],
          );
        }),
      ],
    );
  }

  void showReadOutMenu(
    BuildContext context,
    LongPressStartDetails details,
    String text,
  ) {
    final FlutterTts flutterTts = FlutterTts();
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      items: [
        PopupMenuItem<String>(child: const Text('Read Out'), value: '1'),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      flutterTts.speak(text);
    });
  }
}
