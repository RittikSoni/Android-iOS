import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String? id;

  VideoScreen({this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.id!,
      flags: const YoutubePlayerFlags(
        controlsVisibleAtStart: true,
        mute: false,
        autoPlay: true,
        loop: true,
      ),
    );
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E21),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.pinkAccent),
          leading: MediaQuery.of(context).orientation == Orientation.landscape
              ? Image.asset('images/aahclogo.png')
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text(
            'AASTHA HALLMARK',
            style: TextStyle(color: Colors.amber),
          ),
        ),
        body: SafeArea(
          child: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: ProgressBarColors(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    bufferedColor: const Color(0xff9AADAC),
                    handleColor: Colors.red,
                    playedColor: Colors.red),
              ),
              RemainingDuration(),
              const PlaybackSpeedButton(
                icon: Icon(
                  Icons.shutter_speed,
                  color: Colors.pink,
                ),
              ),
              FullScreenButton(
                color: Colors.pink,
              )
            ],
            onReady: () {
              print('Player is ready.');
            },
          ),
        ),
      ),
    );
  }
}
