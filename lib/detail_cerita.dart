import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'handler/vidio_handler.dart';
import 'backsound.dart';

class DetailCeritaRakyatPage extends StatelessWidget {
  final AudioManager _audioManager = AudioManager();
  final Map<String, dynamic> ceritaData;

  DetailCeritaRakyatPage({required this.ceritaData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: 16,
            right: 16,
            child: FractionalTranslation(
              translation: Offset(-0.01, 2.5),
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  ceritaData['Gambar'],
                  fit: BoxFit.cover,
                  width: 220,
                ),
              ),
            )),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(8, 6, 8, 8),
                  decoration: BoxDecoration(
                    color: Colors.indigo, // Warna container indigo
                    borderRadius: BorderRadius.circular(12), // Border radius 12
                  ),
                  child: Text(
                    ceritaData['Judul'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
              for (var cerita in ceritaData['Cerita']) ...[
                if (cerita['teks'] != null)
                  Container(
                    child: Text(
                      cerita['teks'],
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                if (cerita['teks-bold'] != null)
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                    child: Text(
                      cerita['teks-bold'],
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ),
                if (cerita['gambar'] != null && cerita['gambar'] != '-')
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          12.0), // Atur nilai border radius sesuai keinginan
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          12.0), // Border radius untuk gambar
                      child: Image.asset(
                        cerita['gambar'],
                        fit: BoxFit.cover,
                        width: 400,
                      ),
                    ),
                  )
              ],
              if (ceritaData['Moral'] != null)
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                  child: Text(
                    'Moral dari Cerita',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Text(
                  ceritaData['Moral'],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(),
                ),
              ),
              if (ceritaData['Video'] != null && ceritaData['Video'] != '-')
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _audioManager.pause();
                      String videoLink = ceritaData['Video'];
                      if (videoLink != '-') {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return VideoHandler(videoId: videoLink);
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              const begin = Offset(0.0, 1.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              var offsetAnimation = animation.drive(tween);

                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      } else {
                        // Jika videoLink null atau '-'
                        print('Link video kosong');
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                            width: 8.0), // Memberi jarak antara ikon dan teks
                        Text(
                          'Tonton Vidio',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    ));
  }
}
