import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailLaguPage extends StatelessWidget {
  final Map<String, dynamic> laguData;

  DetailLaguPage({required this.laguData});

  @override
  Widget build(BuildContext context) {
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
        title: Text(laguData['judul'],
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
                    laguData['informasi_lagu'],
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
                    laguData['lirik'],
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
                    laguData['terjemahan'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                if (laguData['not_angka'] != '-')
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Not Angka',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                if (laguData['not_angka'] != '-')
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset(
                      laguData['not_angka'], // Path gambar not angka
                      fit: BoxFit.cover, // Sesuaikan dengan kebutuhan Anda
                    ),
                  ),
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
                  String audioLink = laguData['audio'];
                  if (audioLink != '-') {
                    // Lakukan sesuatu dengan audioLink
                    print('Audio Link: $audioLink');
                  }
                },
                child: Text(
                  'Audio Link',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
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
