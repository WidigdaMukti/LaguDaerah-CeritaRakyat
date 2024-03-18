import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'handler/audio_handler.dart';
import 'backsound.dart';

class DetailLaguPage extends StatelessWidget {
  final Map<String, dynamic> laguData;
  final AudioManager _audioManager = AudioManager();

  DetailLaguPage({required this.laguData});

  @override
  Widget build(BuildContext context) {
    Widget notAngkaSection() {
      if (laguData['Not_Angka'] != null && laguData['Not_Angka'] != '-') {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Not Angka',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // Border radius 12
                child: Image.asset(
                  laguData['Not_Angka'], // Path gambar not angka
                  fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                ),
              ),
            ),
          ],
        );
      } else {
        return SizedBox(); // Widget kosong jika tidak ada not angka
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Gambar di belakang konten utama
          Positioned(
              top: 16,
              right: 16,
              child: FractionalTranslation(
                translation: Offset(0.01, 0.3),
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    laguData['Gambar'],
                    fit: BoxFit.cover,
                    width: 220,
                  ),
                ),
              )),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
                  padding: EdgeInsets.fromLTRB(4, 6, 4, 8),
                  decoration: BoxDecoration(
                    color: Colors.indigo, // Warna container indigo
                    borderRadius: BorderRadius.circular(12), // Border radius 12
                  ),
                  child: Text(
                    laguData['Judul'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'Informasi Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['Informasi_Lagu'],
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'Lirik Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['Lirik'],
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'Terjemahan Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['Terjemahan'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                notAngkaSection(), // Panggil bagian not angka yang telah dibuat
                Container(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'Makna Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['Makna'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol "Audio Link" ditekan
                  String audio = laguData['Audio'];
                  if (audio != '-') {
                    _audioManager.pause();
                    showBottomSheetFunction(context, laguData);
                  } else {
                    // Kasus ketika audioLink adalah '-'
                    print('Audio Kosong');
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 8.0), // Memberi jarak antara ikon dan teks
                    Text(
                      'Play Audio',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    padding: EdgeInsets.all(10.0),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
