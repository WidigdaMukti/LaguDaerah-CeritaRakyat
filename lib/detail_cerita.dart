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
        title: Text(ceritaData['judul'],
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
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
                  child: Text(cerita['teks'], style: GoogleFonts.poppins()),
                ),
              if (cerita['gambar'] != null)
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    cerita['gambar'],
                    fit: BoxFit.cover,
                  ),
                ),
            ],
            if (ceritaData['moral'] != null)
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text('Moral dari Cerita',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            if (ceritaData['video'] != '-')
              Container(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String videoLink = ceritaData['video'];
                    if (videoLink != '-') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              VideoHandler(videoId: videoLink),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Tonton Video',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
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
