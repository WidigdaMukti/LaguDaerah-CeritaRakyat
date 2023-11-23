import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'handler/audio_handler.dart';

class DetailLaguPage extends StatelessWidget {
  final Map<String, dynamic> laguData;

  DetailLaguPage({required this.laguData});

  @override
  Widget build(BuildContext context) {
    Widget notAngkaSection() {
      if (laguData['not_angka'] != null && laguData['not_angka'] != '-') {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Not Angka',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                laguData['not_angka'], // Path gambar not angka
                fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
              ),
            ),
          ],
        );
      } else {
        return SizedBox(); // Widget kosong jika tidak ada not angka
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(laguData['Judul'],
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Informasi Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20),
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
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lirik Lagu',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20),
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
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Terjemahan',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20),
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
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
