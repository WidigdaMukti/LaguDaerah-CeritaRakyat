import 'package:flutter/material.dart';

class DetailCeritaRakyatPage extends StatelessWidget {
  final Map<String, dynamic> ceritaData;

  DetailCeritaRakyatPage({required this.ceritaData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ceritaData['judul']),
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
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
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
                child: Text(
                  'Moral dari Cerita',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (ceritaData['moral'] != null)
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  ceritaData['moral'],
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            if (ceritaData['video'] != '-')
              Container(
                padding: EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi saat tombol "Video" ditekan
                    String videoLink = ceritaData['video'];
                    if (videoLink != '-') {
                      // Buka video di sini, misalnya dengan URL launcher
                      // Anda harus mengimpor package url_launcher.
                      // Buka video dalam aplikasi YouTube atau aplikasi video lainnya.
                    }
                  },
                  child: Text('Tonton Video'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
