import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'detail_cerita.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CeritaRakyatPage(),
    );
  }
}

class CeritaRakyatPage extends StatefulWidget {
  @override
  _CeritaRakyatPageState createState() => _CeritaRakyatPageState();
}

class _CeritaRakyatPageState extends State<CeritaRakyatPage> {
  List<dynamic> ceritaRakyatData = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/data/cerita.json');
    Map<String, dynamic> data = json.decode(jsonData);
    setState(() {
      ceritaRakyatData = data['cerita_rakyat'];
    });
  }

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
        title: Text('Cerita Rakyat',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ceritaRakyatData.length,
              itemBuilder: (context, index) {
                final cerita = ceritaRakyatData[index];
                return ListTile(
                  title: Text(
                    cerita['judul'],
                    style: GoogleFonts.poppins(),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailCeritaRakyatPage(ceritaData: cerita),
                      ),
                    );
                  },
                  // Anda dapat menambahkan lebih banyak informasi tentang cerita rakyat di sini.
                  // Contoh: Subjudul, gambar, deskripsi, dll.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
