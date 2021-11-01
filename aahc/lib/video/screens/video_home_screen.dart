import 'package:aahc/components/url_launcher.dart';
import 'package:aahc/video/models/channel_model.dart';
import 'package:aahc/video/models/video_model.dart';
import 'package:aahc/video/screens/video_screen.dart';
import 'package:aahc/video/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoHome extends StatefulWidget {
  @override
  _VideoHomeState createState() => _VideoHomeState();
}

class _VideoHomeState extends State<VideoHome> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC6Dy0rQ6zDnQuHQ1EeErGUA');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return GestureDetector(
      onTap: () {
        UrlLauncher(
                url:
                    'https://www.youtube.com/channel/UCK1zIQG6js6XSum6jHzbnww?sub_confirmation=1')
            .launchInWebViewWithJavaScript();
      },
      child: Container(
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(20.0),
        height: 100.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35.0,
              backgroundImage: NetworkImage(_channel!.profilePictureUrl!),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _channel!.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${_channel!.subscriberCount} ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white.withOpacity(0.9),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl!),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel!.uploadPlaylistId);
    List<Video> allVideos = _channel!.videos!..addAll(moreVideos);
    setState(() {
      _channel!.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos!.length !=
                        int.parse(_channel!.videoCount!) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Make Sure that you are connected with Internet !',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CircularProgressIndicator(
                    color: Colors.blue,
                    // valueColor: AlwaysStoppedAnimation<Color>(
                    //   Theme.of(context).primaryColor, // Red
                    // ),
                  ),
                ],
              ),
            ),
    );
  }
}
