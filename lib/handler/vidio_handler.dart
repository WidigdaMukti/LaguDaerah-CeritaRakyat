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
      flags: YoutubePlayerFlags(
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
      // Misalnya, load ulang konten atau mengatur ulang status aplikasi.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: refreshPage,
          ),
          IconButton(
            icon: Icon(
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
          progressIndicatorColor: Colors.blueAccent,
          onReady: () {
            // Kontrol pemutaran video siap.
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
