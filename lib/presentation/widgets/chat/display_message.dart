import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/widgets/chat/video_player_item.dart';

import '../../../core/enums/message_type.dart';
import 'audio_player_item.dart';

class DisplayMessage extends StatelessWidget {
  const DisplayMessage({
    super.key,
    required this.message,
    required this.messageType,
    required this.isSender,
  });
  final String message;
  final MessageType messageType;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return getMessage(context);
  }

  Widget getMessage(BuildContext context) {
    switch (messageType) {
      case MessageType.text:
        return Text(
          textAlign: TextAlign.left,
          message,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSender ? appTheme.gray100 : appTheme.gray800,
              ),
        );
      case MessageType.image:
        return CachedNetworkImage(imageUrl: message);
      case MessageType.audio:
        return AudioPlayerItem(audioUrl: message, isSender: isSender);
      case MessageType.gif:
        return CachedNetworkImage(imageUrl: message);
      case MessageType.video:
        return VideoPlayerItem(videoUrl: message);
      default:
        return Text(
          textAlign: TextAlign.left,
          message,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSender ? appTheme.gray100 : appTheme.gray800,
              ),
        );
    }
  }
}
