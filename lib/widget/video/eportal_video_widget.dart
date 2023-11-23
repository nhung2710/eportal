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
    /*widget.youtubeId = "x0ZNQ0YXyfE";
    widget.youtubeId = "";
    widget.videoPath =
        "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4";
    widget.videoPath =
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4";
    //widget.videoPath = "";*/
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      widget.youtubeId = widget.youtubeId.convertUrlToYoutubeId();
    }
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: widget.youtubeId!,
        flags: const YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            disableDragSeek: false,
            showLiveFullscreenButton: false,
            hideControls: true,
            loop: false,
            isLive: false,
            forceHD: false,
            enableCaption: false,
            controlsVisibleAtStart: false),
      )..addListener(listener);
    }
    if (!widget.videoPath.isNullOrWhiteSpace()) {
      _videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoPath!));

      _videoPlayerController!.initialize().then((value) {
        setState(() {});
      });
    }
    super.initState();
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
    Widget child = Container();
    if (!widget.youtubeId.isNullOrWhiteSpace()) {
      child = _buildYoutubeId(context);
    } else if (!widget.videoPath.isNullOrWhiteSpace()) {
      child = _buildVideoPath(context);
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: GestureDetector(
          onTap: () => playVideo(),
          child: Container(color: Colors.black, child: child)),
    );
  }

  Widget _buildYoutubeId(BuildContext context) => YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
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
      );

  Widget _buildVideoPath(BuildContext context) =>
      VideoPlayer(_videoPlayerController!);

  playVideo() {
    if (_youtubePlayerController != null && _isPlayerReady) {
      if (_youtubePlayerController!.value.playerState == PlayerState.playing) {
        _youtubePlayerController!.pause();
      } else {
        _youtubePlayerController!.play();
      }
    }
    if (_videoPlayerController != null) {
      if (_videoPlayerController!.value.isPlaying) {
        _videoPlayerController!.pause();
      } else {
        _videoPlayerController!.play();
      }
    }
  }
}
