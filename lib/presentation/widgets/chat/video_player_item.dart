import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({
    super.key,
    required this.videoUrl,
  });
  final String videoUrl;

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late final VideoPlayerController _videoPlayerController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        _videoPlayerController.setVolume(1.0);
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          VideoPlayer(_videoPlayerController),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                if (isPlaying) {
                  _videoPlayerController.pause();
                } else {
                  _videoPlayerController.play();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: isPlaying
                  ? const Opacity(
                      opacity: 0.6,
                      child: Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    )
                  : const Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: 36.0,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
