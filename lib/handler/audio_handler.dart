import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';

void showBottomSheetFunction(
  BuildContext context,
  Map<String, dynamic> laguData,
) {
  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void loadAudio(Map<String, dynamic> laguData) {
    final audioUrl = laguData['audio'];

    assetsAudioPlayer.open(
      Audio(audioUrl),
      loopMode: LoopMode.single,
      autoStart: false,
    );
  }

  loadAudio(laguData);

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async {
            assetsAudioPlayer
                .stop(); // Menghentikan audio saat bottom sheet ditutup
            return true;
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(laguData['judul'],
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 34)),
                    SizedBox(height: 80.0),
                    StreamBuilder(
                      stream: assetsAudioPlayer.currentPosition,
                      builder: (context, snapshot) {
                        Duration currentPosition =
                            snapshot.data ?? Duration.zero;
                        return StreamBuilder(
                          stream: assetsAudioPlayer.current,
                          builder: (context, snapshot) {
                            Duration totalDuration =
                                snapshot.data?.audio.duration ?? Duration.zero;
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
                                    ),
                                    Expanded(
                                      child: StreamBuilder(
                                        stream: assetsAudioPlayer.current,
                                        builder: (context, snapshot) {
                                          Duration totalDuration =
                                              snapshot.data?.audio.duration ??
                                                  Duration.zero;
                                          return Slider(
                                            value: currentPosition.inSeconds
                                                .toDouble(),
                                            onChanged: (value) {
                                              assetsAudioPlayer.seek(Duration(
                                                  seconds: value.toInt()));
                                            },
                                            min: 0.0,
                                            max: totalDuration.inSeconds
                                                .toDouble(),
                                          );
                                        },
                                      ),
                                    ),
                                    Text(
                                      '${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        assetsAudioPlayer.stop();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.stop,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        assetsAudioPlayer
                                            .playOrPause(); // Menggunakan playOrPause() untuk mengontrol pemutaran audio
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        padding: EdgeInsets.all(12.0),
                                        child: StreamBuilder(
                                          stream: assetsAudioPlayer
                                              .isPlaying, // Stream untuk mendapatkan status pemutaran
                                          builder: (context, snapshot) {
                                            bool isPlaying = snapshot.data ??
                                                false; // Mendapatkan status pemutaran saat ini
                                            return Icon(
                                              isPlaying
                                                  ? Icons.pause
                                                  : Icons
                                                      .play_arrow, // Mengubah ikon sesuai status pemutaran
                                              color: Colors.white,
                                              size: 34.0,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        // Add functionality for reset here
                                        assetsAudioPlayer.seek(Duration.zero);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.refresh,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 2,
                child: GestureDetector(
                  onTap: () {
                    assetsAudioPlayer.stop();
                    Navigator.pop(
                        context); // Menutup dialog saat ikon close diklik
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ));
    },
  );
}
