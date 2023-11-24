import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoHandler extends StatefulWidget {
  final String videoId;

  VideoHandler({required this.videoId});

  @override
  _VideoHandlerState createState() => _VideoHandlerState();
}

class _VideoHandlerState extends State<VideoHandler> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId = convertUrlToId(widget.videoId);
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  // Fungsi untuk mengonversi URL video YouTube ke ID
  String convertUrlToId(String videoUrl) {
    String videoId = YoutubePlayer.convertUrlToId(videoUrl) ?? '';
    return videoId;
  }

  // Fungsi untuk membuka link video di aplikasi YouTube atau browser
  void openVideoLink() async {
    String videoLink = widget.videoId;
    if (await canLaunch(videoLink)) {
      await launch(videoLink);
    } else {
      // Tautan tidak dapat diluncurkan, tambahkan penanganan kesalahan di sini
    }
  }

  // Fungsi untuk merefresh halaman
  void refreshPage() {
    setState(() {
      // Anda dapat menambahkan logika refresh atau pengaturan ulang yang diperlukan di sini
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              VideoHandler(videoId: widget.videoId),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: refreshPage,
          ),
          IconButton(
            icon: const Icon(
              Icons.open_in_browser,
              color: Colors.white,
            ),
            onPressed: openVideoLink,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {}),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
