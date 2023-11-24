import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'handler/vidio_handler.dart';

class DetailCeritaRakyatPage extends StatelessWidget {
  final Map<String, dynamic> ceritaData;

  DetailCeritaRakyatPage({required this.ceritaData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          ceritaData['Judul'],
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var cerita in ceritaData['Cerita']) ...[
              if (cerita['teks'] != null)
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    cerita['teks'],
                    style: GoogleFonts.poppins(),
                  ),
                ),
              if (cerita['gambar'] != null && cerita['gambar'] != '-')
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    cerita['gambar'],
                    fit: BoxFit.cover,
                  ),
                )
            ],
            if (ceritaData['Moral'] != null)
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Moral dari Cerita',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                ceritaData['Moral'],
                style: GoogleFonts.poppins(),
              ),
            ),
            if (ceritaData['Video'] != null && ceritaData['Video'] != '-')
              Container(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String videoLink = ceritaData['Video'];
                    if (videoLink != '-') {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return VideoHandler(videoId: videoLink);
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                  child: Text(
                    'Tonton Video',
                    style: GoogleFonts.poppins(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 203, 211, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
