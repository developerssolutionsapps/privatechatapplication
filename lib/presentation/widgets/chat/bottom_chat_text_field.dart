import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:private_chat/core/app_export.dart';
import 'package:private_chat/presentation/widgets/chat/helper_widgets.dart';
import 'package:private_chat/presentation/widgets/chat/material_icon_button.dart';

import '../../../domain/models/request.dart';
import '../../../logic/chat/chat_cubit.dart';

class BottomChatTextField extends StatefulWidget {
  const BottomChatTextField({
    super.key,
    required this.request,
  });

  final Request request;

  @override
  State<BottomChatTextField> createState() => _BottomChatTextFieldState();
}

class _BottomChatTextFieldState extends State<BottomChatTextField> {
  late final TextEditingController _messageController;
  late final FlutterSoundRecorder _soundRecorder;
  late final FocusNode _tfFocusNode;
  bool _isEmojiIconTapped = false;
  double? _keyboardSize;
  bool _isSoundRecorderInitialized = false;
  bool _isAudioRecording = false;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _tfFocusNode = FocusNode();
    // sound recorder
    _soundRecorder = FlutterSoundRecorder();
    initSoundRecorder();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _soundRecorder.closeRecorder();
    _isSoundRecorderInitialized = false;
    super.dispose();
  }

  /// invoke to initialize sound recorder
  void initSoundRecorder() async {
    final permissionStatus = await Permission.microphone.request();
    if (permissionStatus != PermissionStatus.granted) {
      throw RecordingPermissionException('Mic permission not granted');
    }

    _soundRecorder.openRecorder();
    _isSoundRecorderInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    if (_keyboardSize == null && viewInsets.bottom > 1) {
      _keyboardSize = viewInsets.bottom;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 2),
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(-2, -2),
                          blurRadius: 3,
                          spreadRadius: 1),
                    ],
                  ),
                  child: _buildChatTextField(),
                ),
              ),
              addHorizontalSpace(8.0),
              _buildMicOrSendButton(),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isEmojiIconTapped ? _keyboardSize ?? 310 : 0.0,
            width: double.infinity,
            child: EmojiPicker(
              textEditingController: _messageController,
              onEmojiSelected: (_, __) => setState(() {}),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMicOrSendButton() {
    return FloatingActionButton(
      onPressed: _messageController.text.isEmpty
          ? _recordAndSendAudio
          : _sendTextMessage,
      child: Icon(
        _messageController.text.isEmpty
            ? _isAudioRecording
                ? Icons.close
                : Icons.mic
            : Icons.send,
        color: Colors.white,
      ),
    );
  }

  Widget _buildChatTextField() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      focusNode: _tfFocusNode,
      onChanged: (value) {
        setState(() {});
      },
      controller: _messageController,
      keyboardType: TextInputType.multiline,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: appTheme.gray200,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: _buildPrefixTFIcon(),
        hintText: 'Type a message...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: appTheme.gray700,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          left: 16.0,
          right: _messageController.text.isEmpty ? 0 : 16.0,
        ),
      ),
    );
  }

  Widget _buildPrefixTFIcon() {
    return buildMaterialIconButton(
      icon: _isEmojiIconTapped ? Icons.keyboard : Icons.emoji_emotions_outlined,
      onTap: !_isEmojiIconTapped
          ? () {
              _tfFocusNode.unfocus();
              setState(() {
                _isEmojiIconTapped = true;
              });
            }
          : () async {
              setState(() {
                _isEmojiIconTapped = false;
              });

              await Future.delayed(const Duration(milliseconds: 350));
              _tfFocusNode.requestFocus();
            },
    );
  }

  void _sendTextMessage() {
    print("seding text message");
    context
        .read<ChatCubit>()
        .sendTextMessage(widget.request, _messageController.text);
  }

  // void _pickAndSendGif() async {
  //   final GiphyGif? gif = await pickGIG(context);
  //   if (!mounted) return;
  //   if (gif != null) {
  //     // send gif image
  //   }
  //   Navigator.pop(context);
  // }

  void _recordAndSendAudio() async {
    if (!_isSoundRecorderInitialized) return;
    final Directory tempDirectory = await getTemporaryDirectory();
    String audioFilePath =
        '${tempDirectory.path}${StringsConstants.audiosSavingPath}';

    if (!_isAudioRecording) {
      _soundRecorder.startRecorder(toFile: audioFilePath);
    } else {
      _soundRecorder.stopRecorder();
      // context.read<ChatCubit>().sendFileMessage(audioFilePath);
    }

    setState(() => _isAudioRecording = !_isAudioRecording);
  }
}
