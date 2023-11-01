import 'package:flutter/material.dart';

class DetailLaguPage extends StatelessWidget {
  final Map<String, dynamic> laguData;

  DetailLaguPage({required this.laguData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(laguData['judul']),
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
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['informasi_lagu'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lirik Lagu',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    laguData['lirik'],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Terjemahan',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
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
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                child: Text('Audio Link'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
