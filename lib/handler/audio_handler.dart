import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lagu_daerah_dan_cerita_rakyat/backsound.dart';

final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

void showBottomSheetFunction(
  BuildContext context,
  Map<String, dynamic> laguData,
) {
  final AudioManager _audioManager = AudioManager();

  void loadAudio(Map<String, dynamic> laguData) {
    final audioUrl = laguData['Audio'];

    assetsAudioPlayer.open(
      Audio(audioUrl),
      loopMode: LoopMode.single,
      autoStart: false,
    );
  }

  loadAudio(laguData);

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async {
            _audioManager.resume();
            assetsAudioPlayer
                .stop(); // Menghentikan audio saat bottom sheet ditutup
            return true;
          },
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(laguData['Judul'],
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 28)),
                    const SizedBox(height: 50.0),
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
                                            activeColor: Colors.indigo,
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
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        assetsAudioPlayer.stop();
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 203, 211, 255),
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Icon(
                                          Icons.stop,
                                          color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        assetsAudioPlayer
                                            .playOrPause(); // Menggunakan playOrPause() untuk mengontrol pemutaran audio
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 203, 211, 255),
                                        ),
                                        padding: const EdgeInsets.all(12.0),
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
                                              color: Colors.indigo,
                                              size: 34.0,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        // Add functionality for reset here
                                        assetsAudioPlayer.seek(Duration.zero);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 203, 211, 255),
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Icon(
                                          Icons.refresh,
                                          color: Colors.indigo,
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
                top: 10,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    assetsAudioPlayer.stop();
                    Navigator.pop(
                        context); // Menutup dialog saat ikon close diklik
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 234, 234, 234),
                    ),
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(
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
