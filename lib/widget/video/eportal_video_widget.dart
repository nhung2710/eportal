import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../extension/string_extension.dart';

//
// Created by BlackRose on 22/11/2023.
// Copyright (c) 2023 Hilo All rights reserved.
//
class EportalVideoWidget extends StatefulWidget {
  String? youtubeId;
  String? videoPath;

  EportalVideoWidget({super.key, this.youtubeId, this.videoPath});

  @override
  State<StatefulWidget> createState() => _EportalVideoWidgetState();
}

class _EportalVideoWidgetState extends State<EportalVideoWidget> {
  VideoPlayerController? _videoPlayerController;
  YoutubePlayerController? _youtubePlayerController;
  PlayerState? _playerState;
  YoutubeMetaData? _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      widget.youtubeId =
          YoutubePlayer.convertUrlToId(widget.youtubeId!) ?? widget.youtubeId;
    }
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: widget.youtubeId!,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
        ),
      )..addListener(listener);
    }
    if (!widget.videoPath.isNullOrWhiteSpace()) {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoPath!),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _videoPlayerController!.addListener(() {
        setState(() {});
      });
      _videoPlayerController!.setLooping(true);
      _videoPlayerController!.initialize();
    }
  }

  void listener() {
    if (_isPlayerReady &&
        mounted &&
        !_youtubePlayerController!.value.isFullScreen) {
      setState(() {
        _playerState = _youtubePlayerController!.value.playerState;
        _videoMetaData = _youtubePlayerController!.metadata;
      });
    }
  }

  @override
  void dispose() {
    _youtubePlayerController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      return _buildYoutubeId(context);
    }
    if (widget.videoPath.isNullOrWhiteSpace()) return _buildVideoPath(context);
    return Container();
  }

  Widget _buildYoutubeId(BuildContext context) => Container(
        height: 200,
        child: YoutubePlayerBuilder(
          onExitFullScreen: () {
            // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: _youtubePlayerController!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _youtubePlayerController!.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {
              _isPlayerReady = true;
            },
          ),
          builder: (BuildContext, Widget) => Container(),
        ),
      );

  Widget _buildVideoPath(BuildContext context) => Container();
}
